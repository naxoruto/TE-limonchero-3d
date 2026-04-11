extends Node

# ============================================================
# VoiceManager — Singleton (Autoload)
# Responsable de: grabar audio del micrófono del Quest 2,
#                 enviarlo al backend vía LlmClient,
#                 reproducir el audio TTS de respuesta del NPC.
# ============================================================

var _mic_stream: AudioStreamMicrophone
var _mic_player: AudioStreamPlayer
var _playback: AudioStreamPlayback  # AudioStreamPlaybackMicrophone hereda de este tipo base

var _recording: bool = false
var _current_npc_id: String = ""
var _current_history: Array = []

# AudioStreamPlayer para reproducir la respuesta del NPC
var _npc_audio_player: AudioStreamPlayer3D  # Se asigna desde la escena

signal recording_started
signal recording_stopped
signal npc_speaking_started
signal npc_speaking_finished

# ============================================================
func _ready() -> void:
	# Configurar captura de micrófono
	_mic_stream = AudioStreamMicrophone.new()
	_mic_player = AudioStreamPlayer.new()
	_mic_player.stream = _mic_stream
	_mic_player.bus = "Capture"  # Un bus de audio dedicado a la grabación
	add_child(_mic_player)

	# Conectar señales del LlmClient
	LlmClient.chat_response_received.connect(_on_chat_response)
	LlmClient.request_failed.connect(_on_request_failed)

	print("[VoiceManager] Listo. Bus de audio: Capture")

# ============================================================
# Iniciar grabación (llamar cuando el jugador presiona el botón)
# ============================================================
func start_recording(npc_id: String, dialogue_history: Array) -> void:
	if _recording:
		return
	_recording = true
	_current_npc_id = npc_id
	_current_history = dialogue_history

	_mic_player.play()
	_playback = _mic_player.get_stream_playback()
	recording_started.emit()
	print("[VoiceManager] Grabando...")

# ============================================================
# Detener grabación y enviar al backend
# ============================================================
func stop_recording() -> void:
	if not _recording:
		return
	_recording = false

	# Recopilar frames de audio del micrófono
	# get_frames_available_count() devuelve un int; get_buffer(n) devuelve los datos reales
	var frame_count: int = _playback.get_frames_available()
	var audio_frames: PackedVector2Array = _playback.get_buffer(frame_count)
	var wav_bytes: PackedByteArray = _frames_to_wav(audio_frames)

	_mic_player.stop()
	recording_stopped.emit()
	print("[VoiceManager] Grabación detenida. Enviando al backend...")

	# Enviar al backend (STT + LLM en un solo request)
	LlmClient.chat(_current_npc_id, _current_history, wav_bytes)

# ============================================================
# Callback: respuesta del NPC recibida
# ============================================================
func _on_chat_response(text: String, audio_bytes: PackedByteArray) -> void:
	print("[VoiceManager] NPC dice: ", text)
	# TODO: Mostrar subtítulos con el texto
	_play_npc_audio(audio_bytes)

func _on_request_failed(endpoint: String, error: String) -> void:
	push_error("[VoiceManager] Error en %s: %s" % [endpoint, error])

# ============================================================
# Reproducir audio TTS del NPC en 3D
# ============================================================
func set_npc_audio_player(player: AudioStreamPlayer3D) -> void:
	_npc_audio_player = player

func _play_npc_audio(audio_bytes: PackedByteArray) -> void:
	if not _npc_audio_player:
		push_warning("[VoiceManager] No hay AudioStreamPlayer3D asignado al NPC.")
		return
	npc_speaking_started.emit()
	# Crear un AudioStreamWAV desde los bytes crudos
	var stream := AudioStreamWAV.new()
	# TODO: Parsear los bytes WAV del servidor correctamente
	_npc_audio_player.stream = stream
	_npc_audio_player.play()
	await _npc_audio_player.finished
	npc_speaking_finished.emit()

# ============================================================
# Helper: convertir frames de micrófono a bytes WAV (stub)
# ============================================================
func _frames_to_wav(_frames: PackedVector2Array) -> PackedByteArray:
	# TODO: Implementar conversión real a WAV de 16kHz mono
	# Requiere escribir el header WAV + los datos PCM.
	push_warning("[VoiceManager] _frames_to_wav: Implementación pendiente.")
	return PackedByteArray()
