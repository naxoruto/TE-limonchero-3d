extends Node3D

# ============================================================
# VrLocomotion — Adjuntar al XROrigin3D del jugador
# En VR, la locomoción se hace moviendo el XROrigin3D
# directamente (no con CharacterBody3D).
# ============================================================

@export var move_speed: float = 3.0
@export var snap_turn_angle: float = 45.0   # grados por snap
@export var teleport_enabled: bool = true

@onready var xr_camera: XRCamera3D     = $XRCamera3D
@onready var left_controller: XRController3D  = $LeftHand
@onready var right_controller: XRController3D = $RightHand

var _can_snap_turn: bool = true

# ============================================================
func _physics_process(delta: float) -> void:
	_handle_continuous_movement(delta)
	_handle_snap_turn()

# ============================================================
# Movimiento continuo con joystick izquierdo
# ============================================================
func _handle_continuous_movement(delta: float) -> void:
	var axis: Vector2 = left_controller.get_vector2("primary")
	if axis.length() < 0.1:
		return

	# Mover relativo a la dirección de la cámara (ignorando Y)
	var cam_basis: Basis = xr_camera.global_transform.basis
	var forward: Vector3 = -cam_basis.z
	var right: Vector3   =  cam_basis.x
	forward.y = 0.0
	right.y   = 0.0
	forward   = forward.normalized()
	right     = right.normalized()

	# Mover el XROrigin3D (que es "self" al estar adjunto a él)
	position += (forward * axis.y + right * axis.x) * move_speed * delta

# ============================================================
# Snap turn con joystick derecho (anti motion sickness)
# ============================================================
func _handle_snap_turn() -> void:
	var axis: Vector2 = right_controller.get_vector2("primary")
	if abs(axis.x) > 0.7 and _can_snap_turn:
		rotate_y(deg_to_rad(-snap_turn_angle * sign(axis.x)))
		_can_snap_turn = false
	elif abs(axis.x) < 0.3:
		_can_snap_turn = true
