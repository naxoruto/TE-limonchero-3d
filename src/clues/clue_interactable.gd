extends Node3D

# ============================================================
# ClueInteractable — Adjuntar al nodo raíz de cada objeto-pista
# Responsable de: detectar cuando el jugador agarra el objeto,
#                 registrar la pista en el GameManager,
#                 dar feedback háptico y visual.
# ============================================================

@export var clue_id: String = ""           # Ej: "testamento"
@export var clue_name: String = ""         # Ej: "El Testamento"
@export var clue_description: String = ""  # Descripción breve visible en el inventario
@export var clue_location: String = ""     # Ej: "Escritorio de la oficina"

var _is_collected: bool = false

signal clue_picked_up(clue_id: String)

# ============================================================
func _ready() -> void:
	# TODO: Añadir outline/highlight cuando el jugador esté cerca
	pass

# ============================================================
# Llamar desde el script de manos XR cuando Grip sea presionado
# ============================================================
## Punto de entrada público para el sistema de interacción.
## Llama a on_grip_pressed() internamente para mantener compatibilidad.
func interact() -> void:
	on_grip_pressed()

func on_grip_pressed() -> void:
	if _is_collected:
		return

	_is_collected = true
	var clue_data: Dictionary = {
		"id":          clue_id,
		"name":        clue_name,
		"description": clue_description,
		"location":    clue_location,
	}

	GameManager.collect_clue(clue_data)
	clue_picked_up.emit(clue_id)

	# TODO: Feedback háptico en el controlador
	# TODO: Mostrar notificación "Pista encontrada: [nombre]"
	# TODO: Animación de la pista yendo al inventario
	print("[ClueInteractable] Pista recogida: ", clue_name)
