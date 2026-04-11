extends Node

# ============================================================
# GameManager — Singleton (Autoload)
# Responsable de: estado del juego, inventario de pistas,
#                 seguimiento de progreso y flujo de partida.
# ============================================================

# --- Estado del juego ---
enum GameState { MENU, BRIEFING, EXPLORATION, INTERROGATION, ACCUSATION, RESOLVED }
var current_state: GameState = GameState.MENU

# --- Inventario de pistas ---
# Cada pista es un Dictionary: { "id", "name", "description", "location" }
var collected_clues: Array[Dictionary] = []

# --- Historial de sospechosos interrogados ---
var interrogated_npcs: Array[String] = []

# --- Acusación final ---
var accused_suspect_id: String = ""
const REAL_CULPRIT_ID: String = "ramona_villanueva"

# ============================================================
# Señales
# ============================================================
signal state_changed(new_state: GameState)
signal clue_collected(clue: Dictionary)
signal accusation_made(suspect_id: String, is_correct: bool)

# ============================================================
# Métodos de estado
# ============================================================
func change_state(new_state: GameState) -> void:
	current_state = new_state
	state_changed.emit(new_state)
	print("[GameManager] Estado → ", GameState.keys()[new_state])

# ============================================================
# Métodos de pistas
# ============================================================
func collect_clue(clue: Dictionary) -> void:
	if not has_clue(clue.get("id", "")):
		collected_clues.append(clue)
		clue_collected.emit(clue)
		print("[GameManager] Pista recopilada: ", clue.get("name", "Desconocida"))

func has_clue(clue_id: String) -> bool:
	for clue in collected_clues:
		if clue.get("id") == clue_id:
			return true
	return false

func get_clue_count() -> int:
	return collected_clues.size()

# ============================================================
# Acusación final
# ============================================================
func make_accusation(suspect_id: String) -> bool:
	accused_suspect_id = suspect_id
	var is_correct: bool = (suspect_id == REAL_CULPRIT_ID)
	accusation_made.emit(suspect_id, is_correct)
	print("[GameManager] Acusación: %s — %s" % [suspect_id, "CORRECTO" if is_correct else "INCORRECTO"])
	return is_correct
