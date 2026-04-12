extends Node3D

# ============================================================
# Main — Nodo raíz de la escena principal (PoC)
# Responsable de: inicializar OpenXR y conectar la Chat UI con el NPC.
# ============================================================

var xr_interface: XRInterface

var _npc: Node
var _chat_log: RichTextLabel
var _input_field: LineEdit

func _ready() -> void:
	_init_xr()
	_setup_chat_ui()

# ============================================================
func _setup_chat_ui() -> void:
	_npc = get_node_or_null("NPC_Prueba")
	if not _npc:
		push_warning("[Main] No se encontró NPC_Prueba en la escena.")
		return

	_npc.subtitle_label = _npc.get_node_or_null("SubtitleLabel")
	_npc.npc_responded.connect(_on_npc_responded)

	_chat_log   = get_node("ChatUI/Panel/VBox/ChatLog")
	_input_field = get_node("ChatUI/Panel/VBox/HBox/InputField")
	var send_btn = get_node("ChatUI/Panel/VBox/HBox/SendButton")

	send_btn.pressed.connect(_on_send_pressed)
	_input_field.text_submitted.connect(_on_send_text)

# ============================================================
func _on_send_pressed() -> void:
	_on_send_text(_input_field.text)

func _on_send_text(text: String) -> void:
	text = text.strip_edges()
	if text.is_empty():
		return
	_chat_log.append_text("\n[color=cyan][You]:[/color] " + text)
	_input_field.clear()
	_npc.send_text_message(text)

func _on_npc_responded(_npc_id: String, response: String) -> void:
	_chat_log.append_text("\n[color=yellow][Marco]:[/color] " + response)

# ============================================================
func _init_xr() -> void:
	xr_interface = XRServer.find_interface("OpenXR")

	if xr_interface and xr_interface.is_initialized():
		print("[Main] OpenXR inicializado correctamente")
		get_viewport().use_xr = true
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	else:
		push_warning("[Main] OpenXR no disponible — corriendo en modo escritorio (debug)")
