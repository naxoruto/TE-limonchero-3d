extends Node

# ============================================================
# InventorySystem — Singleton (Autoload)
# Responsable de: mostrar/ocultar el tablón de pistas en VR,
#                 sincronizar con GameManager.collected_clues.
# ============================================================

# Referencia al nodo UI del tablón (panel world-space en la escena)
@export var clue_board_node: NodePath

var _visible: bool = false

# ============================================================
func _ready() -> void:
	GameManager.clue_collected.connect(_on_clue_collected)

func _on_clue_collected(clue: Dictionary) -> void:
	# TODO: Actualizar visualmente el tablón de pistas
	print("[InventorySystem] Nueva pista en tablón: ", clue.get("name"))

# ============================================================
# Alternar visibilidad del inventario (botón menú / gesto)
# ============================================================
func toggle_visibility() -> void:
	_visible = not _visible
	# TODO: get_node(clue_board_node).visible = _visible
	print("[InventorySystem] Tablón de pistas: ", "visible" if _visible else "oculto")
