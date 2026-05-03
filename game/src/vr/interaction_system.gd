extends Node

# ============================================================
# InteractionSystem — Singleton (Autoload)
# Responsable de: despachar interacciones desde los controladores VR
#                 a los objetos interactuables de la escena.
#
# Separa la lógica "qué objeto está siendo apuntado" (HandInteraction)
# de "qué ocurre al interactuar" (el propio objeto), evitando
# acoplamiento directo entre HandInteraction y tipos concretos.
# ============================================================

## Emitido cuando se completa una interacción con éxito.
signal interaction_performed(node: Node3D)

# ============================================================
# API pública
# ============================================================

## Intentar interactuar con [node] usando el gesto de grip.
## El nodo debe exponer el método interact() (ej: ClueInteractable).
## Retorna true si la interacción se ejecutó.
func try_interact(node: Node3D) -> bool:
	if not is_instance_valid(node):
		return false
	if not node.has_method("interact"):
		return false
	node.interact()
	interaction_performed.emit(node)
	return true

## Intentar iniciar diálogo con [node].
## El nodo debe exponer el método start_dialogue() (ej: NpcController).
## Retorna true si el diálogo se inició.
func try_start_dialogue(node: Node3D) -> bool:
	if not is_instance_valid(node):
		return false
	if not node.has_method("start_dialogue"):
		return false
	node.start_dialogue()
	return true
