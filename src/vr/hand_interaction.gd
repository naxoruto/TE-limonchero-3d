extends Node3D

# ============================================================
# HandInteraction — Adjuntar a cada XRController3D (mano)
# Responsable de: detectar objetos interactuables con Ray Cast,
#                 activar pistas (Grip) e iniciar diálogos (Trigger).
# ============================================================

@export var ray_length: float = 5.0
@export var hand_side: String = "right"  # "left" o "right"

@onready var ray_cast: RayCast3D = $RayCast3D
# ⚠️  get_parent() dentro de @onready es seguro: se evalúa en _ready(),
#     cuando el nodo ya está en el árbol de escena.
@onready var controller: XRController3D = get_parent() as XRController3D

var _highlighted_object: Node3D = null

signal object_grabbed(node: Node3D)
signal object_released(node: Node3D)

# ============================================================
func _ready() -> void:
	if not controller:
		push_error("[HandInteraction] El nodo padre no es un XRController3D.")
		return
	controller.button_pressed.connect(_on_button_pressed)
	controller.button_released.connect(_on_button_released)
	if ray_cast:
		ray_cast.target_position = Vector3(0, 0, -ray_length)

# ============================================================
func _process(_delta: float) -> void:
	_update_ray_highlight()

# ============================================================
# Detectar y resaltar objetos interactuables
# ============================================================
func _update_ray_highlight() -> void:
	if not ray_cast or not ray_cast.is_colliding():
		if _highlighted_object:
			_clear_highlight()
		return

	var target: Node3D = ray_cast.get_collider()
	if target == _highlighted_object:
		return

	_clear_highlight()
	if target.has_method("on_highlight"):
		target.on_highlight()
		_highlighted_object = target

func _clear_highlight() -> void:
	if _highlighted_object and _highlighted_object.has_method("on_unhighlight"):
		_highlighted_object.on_unhighlight()
	_highlighted_object = null

# ============================================================
# Botones del controlador Quest 2
# ============================================================
func _on_button_pressed(button_name: String) -> void:
	match button_name:
		"grip_click":
			_try_grab()
		"trigger_click":
			_try_interact()
		"ax_button":
			# Botón A (mano derecha) / X (mano izquierda) → Hablar
			_try_start_voice()

func _on_button_released(button_name: String) -> void:
	match button_name:
		"ax_button":
			_try_stop_voice()

# ============================================================
func _try_grab() -> void:
	if _highlighted_object and InteractionSystem.try_interact(_highlighted_object):
		object_grabbed.emit(_highlighted_object)

func _try_interact() -> void:
	if _highlighted_object:
		InteractionSystem.try_start_dialogue(_highlighted_object)

func _try_start_voice() -> void:
	# TODO: Obtener el NPC activo y su historial desde GameManager/escena
	# VoiceManager.start_recording(npc_id, history)
	print("[HandInteraction] Botón hablar presionado (grabación aún no conectada)")

func _try_stop_voice() -> void:
	# VoiceManager.stop_recording()
	print("[HandInteraction] Botón hablar soltado (grabación aún no conectada)")
