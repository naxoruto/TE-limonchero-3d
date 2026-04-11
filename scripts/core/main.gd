extends Node3D

# ============================================================
# Main — Nodo raíz de la escena principal (PoC)
# Responsable de: inicializar OpenXR y conectar la Quest.
# ============================================================

var xr_interface: XRInterface

func _ready() -> void:
	_init_xr()

func _init_xr() -> void:
	xr_interface = XRServer.find_interface("OpenXR")

	if xr_interface and xr_interface.is_initialized():
		print("[Main] ✅ OpenXR inicializado correctamente")
		# Decirle a Godot que renderice hacia el visor VR
		get_viewport().use_xr = true
		# Deshabilitar VSync: OpenXR gestiona sus propios frames (obligatorio)
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	else:
		push_warning("[Main] ⚠️  OpenXR no disponible — corriendo en modo escritorio (debug)")
		# En modo escritorio los controles VR no funcionan,
		# pero la escena carga igualmente para testear la UI.
