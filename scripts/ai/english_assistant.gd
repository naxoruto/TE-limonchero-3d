extends Node

# ============================================================
# EnglishAssistant — Singleton (Autoload)
# Responsable de: evaluar el inglés del jugador tras cada frase
#                 recibida vía STT y llamar al endpoint /correct
#                 del backend para que Félix "El Viejo" corrija.
# ============================================================

## Activar/desactivar el asistente durante el juego
@export var enabled: bool = true

signal correction_received(original: String, correction: String)

# ============================================================
func _ready() -> void:
	LlmClient.transcription_received.connect(_on_transcription_received)
	print("[EnglishAssistant] Monitoreando inglés del jugador.")

# ============================================================
# Cuando llega una transcripción, la mandamos a evaluar
# ============================================================
func _on_transcription_received(text: String) -> void:
	if not enabled or text.strip_edges().is_empty():
		return
	print("[EnglishAssistant] Evaluando: ", text)
	_request_correction(text)

func _request_correction(player_text: String) -> void:
	var body = { "player_text": player_text }
	# Reutilizamos el HTTPRequest del LlmClient con un endpoint distinto
	# TODO: Añadir endpoint /correct al LlmClient o hacer request propio
	push_warning("[EnglishAssistant] Endpoint /correct pendiente de implementar en LlmClient.")

# ============================================================
# Callback cuando el backend devuelve la corrección de Félix
# ============================================================
func on_correction_response(original: String, correction: String) -> void:
	print("[EnglishAssistant] Félix dice: ", correction)
	correction_received.emit(original, correction)
	# TODO: Reproducir audio TTS de la corrección de Félix
	# TODO: Mostrar panel world-space con la corrección
