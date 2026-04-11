extends Node3D

# ============================================================
# NpcController — Adjuntar a cada NPC en la escena
# Responsable de: activar/desactivar diálogo con el jugador,
#                 llamar al VoiceManager para el pipeline STT→LLM→TTS.
# ============================================================

@export var npc_id: String = ""          # Ej: "sofia_ramos"
@export var display_name: String = ""    # Ej: "Sofía Ramos"
@export var interaction_radius: float = 2.0

# Referencia al historial de diálogo de este NPC
var dialogue_history: DialogueHistory

var _player_nearby: bool = false

signal dialogue_started(npc_id: String)
signal dialogue_ended(npc_id: String)

# ============================================================
func _ready() -> void:
	dialogue_history = DialogueHistory.new()
	dialogue_history.npc_id = npc_id
	add_child(dialogue_history)
	print("[NpcController] %s listo." % display_name)

# ============================================================
# Llamar desde el script de interacción VR cuando el jugador
# active el trigger del controlador cerca del NPC.
# ============================================================
func start_dialogue() -> void:
	if _player_nearby:
		dialogue_started.emit(npc_id)
		print("[NpcController] Diálogo iniciado con %s" % display_name)
		# TODO: Activar el VoiceManager / panel de subtítulos

func end_dialogue() -> void:
	dialogue_ended.emit(npc_id)
	print("[NpcController] Diálogo terminado con %s" % display_name)

# ============================================================
# Detección de proximidad (se puede usar con Area3D también)
# ============================================================
func set_player_nearby(nearby: bool) -> void:
	_player_nearby = nearby
	# TODO: mostrar/ocultar ícono de interacción sobre el NPC
