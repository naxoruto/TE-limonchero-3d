extends Node

# ============================================================
# LlmClient — Singleton (Autoload)
# Responsable de: comunicarse con el backend FastAPI vía HTTP.
# Endpoints:
#   POST /transcribe  → { audio: <bytes base64> } → { text: String }
#   POST /chat        → { npc_id, messages, audio } → { text, audio }
#   POST /evaluate    → { accusation, clues } → { correct, response }
# ============================================================

## IP y puerto del PC donde corre el servidor FastAPI.
## Cambia esto por la IP local de tu PC en la red WiFi.
@export var server_url: String = "http://192.168.1.100:8000"

var _http: HTTPRequest

signal transcription_received(text: String)
signal chat_response_received(text: String, audio_bytes: PackedByteArray)
signal evaluation_received(is_correct: bool, response_text: String)
signal request_failed(endpoint: String, error: String)

# ============================================================
func _ready() -> void:
	_http = HTTPRequest.new()
	add_child(_http)
	_http.request_completed.connect(_on_request_completed)
	print("[LlmClient] Inicializado. Servidor: ", server_url)

# ============================================================
# Transcribir audio (STT)
# audio_bytes: datos WAV en crudo como PackedByteArray
# ============================================================
func transcribe(audio_bytes: PackedByteArray) -> void:
	var body = {
		"audio": Marshalls.raw_to_base64(audio_bytes)
	}
	_post("/transcribe", body, "transcribe")

# ============================================================
# Enviar mensaje al NPC y recibir respuesta (LLM + TTS)
# ============================================================
func chat(npc_id: String, messages: Array, audio_bytes: PackedByteArray) -> void:
	var body = {
		"npc_id":   npc_id,
		"messages": messages,
		"audio":    Marshalls.raw_to_base64(audio_bytes)
	}
	_post("/chat", body, "chat")

# ============================================================
# Evaluar acusación final
# ============================================================
func evaluate_accusation(suspect_id: String, clue_ids: Array) -> void:
	var body = {
		"suspect_id": suspect_id,
		"clues":      clue_ids
	}
	_post("/evaluate", body, "evaluate")

# ============================================================
# Helpers internos
# ============================================================
func _post(endpoint: String, body: Dictionary, _tag: String) -> void:
	var url: String = server_url + endpoint
	var headers: PackedStringArray = ["Content-Type: application/json"]
	var json_body: String = JSON.stringify(body)
	var err = _http.request(url, headers, HTTPClient.METHOD_POST, json_body)
	if err != OK:
		request_failed.emit(endpoint, "Error al iniciar request: " + str(err))

func _on_request_completed(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != HTTPRequest.RESULT_SUCCESS or response_code != 200:
		request_failed.emit("?", "HTTP error %d / result %d" % [response_code, result])
		return

	var json = JSON.new()
	var parse_err = json.parse(body.get_string_from_utf8())
	if parse_err != OK:
		request_failed.emit("?", "JSON parse error")
		return

	var data: Dictionary = json.get_data()
	# El backend siempre devuelve un campo "type" para identificar la respuesta
	match data.get("type", ""):
		"transcription":
			transcription_received.emit(data.get("text", ""))
		"chat":
			var audio: PackedByteArray = Marshalls.base64_to_raw(data.get("audio", ""))
			chat_response_received.emit(data.get("text", ""), audio)
		"evaluation":
			evaluation_received.emit(data.get("correct", false), data.get("response", ""))
		_:
			push_warning("[LlmClient] Tipo de respuesta desconocido: " + str(data.get("type")))
