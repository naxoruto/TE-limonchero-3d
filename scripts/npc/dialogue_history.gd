extends Node
class_name DialogueHistory

# ============================================================
# DialogueHistory — Adjuntar como hijo de cada NpcController
# Responsable de: mantener el historial de conversación en el
#                 formato que espera la API del LLM (OpenAI-style).
# ============================================================

var npc_id: String = ""

# Formato: Array de { "role": "user"|"assistant", "content": String }
var messages: Array[Dictionary] = []

# ============================================================
func add_user_message(text: String) -> void:
	messages.append({ "role": "user", "content": text })

func add_assistant_message(text: String) -> void:
	messages.append({ "role": "assistant", "content": text })

# Devuelve el historial completo para enviarlo al backend
func get_history() -> Array[Dictionary]:
	return messages

# Limpia el historial (nueva partida)
func clear() -> void:
	messages.clear()
	print("[DialogueHistory] Historial de %s limpiado." % npc_id)
