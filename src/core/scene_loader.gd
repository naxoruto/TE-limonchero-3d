extends Node

# ============================================================
# SceneLoader — Singleton (Autoload)
# Responsable de: cargar/descargar escenas con transición.
# ============================================================

# Rutas de las escenas principales
const SCENES: Dictionary = {
	"main_menu":    "res://scenes/main_menu.tscn",
	"el_cisne_negro": "res://scenes/el_cisne_negro.tscn",
}

var _is_loading: bool = false

signal scene_loaded(scene_name: String)

# ============================================================
# Cambiar de escena con transición de fade
# ============================================================
func go_to(scene_name: String) -> void:
	if _is_loading:
		push_warning("[SceneLoader] Ya hay una carga en progreso.")
		return

	if not SCENES.has(scene_name):
		push_error("[SceneLoader] Escena desconocida: " + scene_name)
		return

	_is_loading = true
	print("[SceneLoader] Cargando escena: ", scene_name)
	get_tree().change_scene_to_file(SCENES[scene_name])
	_is_loading = false
	scene_loaded.emit(scene_name)
