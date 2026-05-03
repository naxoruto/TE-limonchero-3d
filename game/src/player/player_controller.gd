extends CharacterBody3D
class_name PlayerController

# ============================================================
# PlayerController
# Nodo raíz: CharacterBody3D
# Hijo requerido: Camera3D (referenciada como @onready)
#
# Movimiento WASD + rotación de cámara con mouse.
# Sin salto. Sprint con Shift.
# ============================================================

## Velocidad base de movimiento (m/s).
@export_range(1.0, 20.0, 0.1) var speed: float = 4.0

## Multiplicador de velocidad al hacer sprint.
@export_range(1.0, 3.0, 0.1) var sprint_multiplier: float = 1.6

## Sensibilidad del ratón para rotación de cámara (rad/pixel).
@export_range(0.0001, 0.01, 0.0001) var mouse_sensitivity: float = 0.003

signal player_moved(position: Vector3)

@onready var _camera: Camera3D = $Camera3D

var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var _camera_pitch: float = 0.0

const MAX_PITCH: float = deg_to_rad(85.0)

# ============================================================
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# Rotación horizontal del cuerpo completo
		rotate_y(-event.relative.x * mouse_sensitivity)
		# Rotación vertical solo de la cámara, con clamp
		_camera_pitch = clampf(
			_camera_pitch - event.relative.y * mouse_sensitivity,
			-MAX_PITCH,
			MAX_PITCH
		)
		_camera.rotation.x = _camera_pitch

	# Permitir liberar el cursor con Escape en desarrollo
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	# Gravedad
	if not is_on_floor():
		velocity.y -= _gravity * delta

	# Dirección de movimiento desde input
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_dir: Vector3 = (
		transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)
	).normalized()

	# Sprint
	var is_sprinting: bool = _is_sprint_pressed()
	var current_speed: float = speed * (sprint_multiplier if is_sprinting else 1.0)

	if move_dir != Vector3.ZERO:
		velocity.x = move_dir.x * current_speed
		velocity.z = move_dir.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, current_speed)
		velocity.z = move_toward(velocity.z, 0.0, current_speed)

	var was_moving: bool = velocity.length_squared() > 0.01
	move_and_slide()

	if was_moving:
		player_moved.emit(global_position)


## Detecta la acción "sprint". Usa la action del InputMap si existe,
## o KEY_SHIFT como fallback.
func _is_sprint_pressed() -> bool:
	if InputMap.has_action("sprint"):
		return Input.is_action_pressed("sprint")
	return Input.is_key_pressed(KEY_SHIFT)
