extends Node
class_name VoiceManager

# ============================================================
# VoiceManager — Singleton (Autoload)
# Responsable de: grabar audio del micrófono (PTT),
#                 enviarlo al backend vía LlmClient (STT → LLM),
#                 emitir el texto de respuesta del NPC.
# Los NPCs no usan TTS — responden con texto + balbuceo local.
#
# Requisitos del proyecto de audio:
#   - Un bus llamado "Capture" debe existir con un AudioEffectCapture.
#   - Si no existe, _ready() lo crea automáticamente.
# ============================================================

const CAPTURE_BUS_NAME: String = "Capture"
const SAMPLE_RATE: int = 22050
const CHANNELS: int = 1  # mono

var _mic_stream: AudioStreamMicrophone
var _mic_player: AudioStreamPlayer
var _capture_effect: AudioEffectCapture

var _recording: bool = false
var _current_npc_id: String = ""
var _current_history: Array = []

signal recording_started
signal recording_stopped
signal transcription_received(text: String)

# ============================================================
func _ready() -> void:
	_ensure_capture_bus()

	_mic_stream = AudioStreamMicrophone.new()
	_mic_player = AudioStreamPlayer.new()
	_mic_player.stream = _mic_stream
	_mic_player.bus = CAPTURE_BUS_NAME
	add_child(_mic_player)

	# Obtener referencia al AudioEffectCapture del bus
	var bus_idx: int = AudioServer.get_bus_index(CAPTURE_BUS_NAME)
	_capture_effect = AudioServer.get_bus_effect(bus_idx, 0) as AudioEffectCapture

	LlmClient.chat_response_received.connect(_on_chat_response)
	LlmClient.request_failed.connect(_on_request_failed)

	print("[VoiceManager] Listo. Bus de captura: %s" % CAPTURE_BUS_NAME)


## Garantiza que el bus "Capture" exista con un AudioEffectCapture en slot 0.
func _ensure_capture_bus() -> void:
	var bus_idx: int = AudioServer.get_bus_index(CAPTURE_BUS_NAME)
	if bus_idx == -1:
		AudioServer.add_bus()
		bus_idx = AudioServer.bus_count - 1
		AudioServer.set_bus_name(bus_idx, CAPTURE_BUS_NAME)
		# El bus de captura no debe enviar sonido a los altavoces
		AudioServer.set_bus_send(bus_idx, "")
		var effect := AudioEffectCapture.new()
		AudioServer.add_bus_effect(bus_idx, effect, 0)
		print("[VoiceManager] Bus '%s' creado automáticamente." % CAPTURE_BUS_NAME)
	else:
		# Verificar que haya al menos un efecto y sea AudioEffectCapture
		if AudioServer.get_bus_effect_count(bus_idx) == 0:
			var effect := AudioEffectCapture.new()
			AudioServer.add_bus_effect(bus_idx, effect, 0)
			print("[VoiceManager] AudioEffectCapture añadido al bus '%s'." % CAPTURE_BUS_NAME)


# ============================================================
## Inicia la grabación. Llamar cuando el jugador presiona push_to_talk.
# ============================================================
func start_recording(npc_id: String, dialogue_history: Array) -> void:
	if _recording:
		return
	_recording = true
	_current_npc_id = npc_id
	_current_history = dialogue_history

	# Limpiar el buffer de captura antes de empezar
	if _capture_effect:
		_capture_effect.clear_buffer()

	_mic_player.play()
	recording_started.emit()
	print("[VoiceManager] Grabando...")


# ============================================================
## Detiene la grabación y envía el audio al backend.
# ============================================================
func stop_recording() -> void:
	if not _recording:
		return
	_recording = false

	# Leer todos los frames disponibles del buffer de captura
	var frame_count: int = _capture_effect.get_frames_available()
	var audio_frames: PackedVector2Array = _capture_effect.get_buffer(frame_count)
	var wav_bytes: PackedByteArray = _frames_to_wav(audio_frames)

	_mic_player.stop()
	recording_stopped.emit()
	print("[VoiceManager] Grabación detenida (%d frames). Enviando al backend..." % frame_count)

	# Enviar al backend (STT + LLM)
	LlmClient.chat(_current_npc_id, _current_history, wav_bytes)


# ============================================================
# Callbacks LlmClient
# ============================================================
func _on_chat_response(text: String) -> void:
	print("[VoiceManager] NPC dice: ", text)
	transcription_received.emit(text)


func _on_request_failed(endpoint: String, error: String) -> void:
	push_error("[VoiceManager] Error en %s: %s" % [endpoint, error])


# ============================================================
## Convierte un PackedVector2Array de frames de micrófono a bytes WAV PCM 16-bit.
## Salida: mono (canal izquierdo) a SAMPLE_RATE.
# ============================================================
func _frames_to_wav(frames: PackedVector2Array) -> PackedByteArray:
	if frames.is_empty():
		push_warning("[VoiceManager] _frames_to_wav: sin frames de audio.")
		return PackedByteArray()

	# Convertir float [-1.0, 1.0] a int16 [-32768, 32767], canal izquierdo (mono)
	var pcm: PackedByteArray = PackedByteArray()
	pcm.resize(frames.size() * 2)  # 2 bytes por muestra (16-bit)
	for i: int in range(frames.size()):
		var sample_f: float = clampf(frames[i].x, -1.0, 1.0)
		var sample_i: int = int(sample_f * 32767.0)
		pcm.encode_s16(i * 2, sample_i)

	# Construir header WAV estándar (44 bytes, PCM 16-bit mono)
	var data_size: int = pcm.size()
	var byte_rate: int = SAMPLE_RATE * CHANNELS * 2  # bytes/segundo
	var block_align: int = CHANNELS * 2              # bytes por frame

	var header: PackedByteArray = PackedByteArray()
	header.resize(44)

	# RIFF chunk
	header[0] = 0x52; header[1] = 0x49; header[2] = 0x46; header[3] = 0x46  # "RIFF"
	header.encode_u32(4, 36 + data_size)                                       # ChunkSize
	header[8] = 0x57; header[9] = 0x41; header[10] = 0x56; header[11] = 0x45 # "WAVE"

	# fmt sub-chunk
	header[12] = 0x66; header[13] = 0x6D; header[14] = 0x74; header[15] = 0x20 # "fmt "
	header.encode_u32(16, 16)          # Subchunk1Size (PCM = 16)
	header.encode_u16(20, 1)           # AudioFormat (PCM = 1)
	header.encode_u16(22, CHANNELS)    # NumChannels
	header.encode_u32(24, SAMPLE_RATE) # SampleRate
	header.encode_u32(28, byte_rate)   # ByteRate
	header.encode_u16(32, block_align) # BlockAlign
	header.encode_u16(34, 16)          # BitsPerSample

	# data sub-chunk
	header[36] = 0x64; header[37] = 0x61; header[38] = 0x74; header[39] = 0x61 # "data"
	header.encode_u32(40, data_size)   # Subchunk2Size

	return header + pcm
