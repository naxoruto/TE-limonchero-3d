extends Node3D

# ============================================================
# NpcController — Adjuntar a cada NPC en la escena.
# Responsable de: activar/desactivar diálogo con el jugador,
#                 enviar mensajes al LLM y recibir respuestas.
#
# Uso básico (PoC sin STT):
#   npc.send_text_message("Where were you last night?")
# ============================================================

@export var npc_id: String = ""          # Ej: "marco_delgado"
@export var display_name: String = ""    # Ej: "Marco Delgado"
@export var interaction_radius: float = 2.0
@export var subtitle_label: Label3D      # Asignar en el Inspector (nodo SubtitleLabel)

var dialogue_history: DialogueHistory

var _player_nearby: bool = false
var _waiting_response: bool = false      # evita enviar mientras hay una request en vuelo

signal dialogue_started(npc_id: String)
signal dialogue_ended(npc_id: String)
signal npc_responded(npc_id: String, text: String)  # para subtítulos / UI

# ============================================================
func _ready() -> void:
	dialogue_history = DialogueHistory.new()
	dialogue_history.npc_id = npc_id
	add_child(dialogue_history)

	LlmClient.chat_response_received.connect(_on_llm_response)
	LlmClient.request_failed.connect(_on_llm_error)

	print("[NpcController] %s (%s) listo." % [display_name, npc_id])

# ============================================================
# Llamar desde el script de interacción VR cuando el jugador
# active el trigger del controlador cerca del NPC.
# ============================================================
func start_dialogue() -> void:
	if _player_nearby:
		dialogue_started.emit(npc_id)
		print("[NpcController] Diálogo iniciado con %s" % display_name)

func end_dialogue() -> void:
	dialogue_ended.emit(npc_id)
	print("[NpcController] Diálogo terminado con %s" % display_name)

# ============================================================
# Enviar un mensaje de texto al NPC (PoC sin STT).
# Cuando STT esté listo, llamar esto con el texto transcripto.
# ============================================================
func send_text_message(text: String) -> void:
	if _waiting_response:
		push_warning("[NpcController] %s: request en curso, espera la respuesta." % npc_id)
		return
	if text.strip_edges().is_empty():
		return

	_waiting_response = true
	dialogue_history.add_user_message(text)
	print("[NpcController] → %s: \"%s\"" % [display_name, text])

	LlmClient.chat_text(npc_id, dialogue_history.get_history())

# ============================================================
# Detección de proximidad
# ============================================================
func set_player_nearby(nearby: bool) -> void:
	_player_nearby = nearby

# ============================================================
# Callbacks internos
# ============================================================
func _on_llm_response(text: String, _audio_bytes: PackedByteArray) -> void:
	# Nota: en una escena con múltiples NPCs esta señal llega a todos.
	# El VoiceManager/GameManager deberá filtrar por npc_id activo.
	# Para el PoC con un solo NPC esto no es problema.
	_waiting_response = false
	dialogue_history.add_assistant_message(text)
	print("[NpcController] ← %s: \"%s\"" % [display_name, text])
	if subtitle_label:
		subtitle_label.text = display_name + ":\n" + text
	npc_responded.emit(npc_id, text)

func _on_llm_error(endpoint: String, error: String) -> void:
	_waiting_response = false
	push_error("[NpcController] Error en %s → %s: %s" % [npc_id, endpoint, error])
