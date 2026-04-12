"""
server.py — Backend FastAPI para Detective Noir VR (PoC Entrega 1)

Endpoints implementados:
  POST /chat   → recibe npc_id + historial de mensajes → llama a Ollama → devuelve texto
  GET  /health → verificar que el servidor está corriendo

Cómo correr:
  uvicorn server:app --host 0.0.0.0 --port 8000

Requisitos:
  - Ollama corriendo en localhost:11434  (ollama serve)
  - Modelo descargado:                  ollama pull llama3
"""

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional
import httpx

from npc_prompts import get_system_prompt

# ============================================================
# Configuración
# ============================================================
OLLAMA_URL   = "http://localhost:11434/api/chat"
OLLAMA_MODEL = "llama3"          # Cambia a "mistral" si no tienes llama3
REQUEST_TIMEOUT = 60.0           # segundos — los modelos locales pueden tardar

app = FastAPI(title="Detective Noir VR — Backend PoC")


# ============================================================
# Schemas
# ============================================================
class Message(BaseModel):
    role: str       # "user" | "assistant"
    content: str

class ChatRequest(BaseModel):
    npc_id: str
    messages: List[Message]
    audio: Optional[str] = None  # base64 WAV — ignorado en el PoC (sin STT aún)


# ============================================================
# Endpoints
# ============================================================
@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/chat")
async def chat(req: ChatRequest):
    system_prompt = get_system_prompt(req.npc_id)

    # Construir el array de mensajes en formato Ollama/OpenAI
    ollama_messages = [{"role": "system", "content": system_prompt}]
    for msg in req.messages:
        ollama_messages.append({"role": msg.role, "content": msg.content})

    payload = {
        "model":    OLLAMA_MODEL,
        "messages": ollama_messages,
        "stream":   False,          # respuesta completa de una vez, más simple para el PoC
    }

    async with httpx.AsyncClient(timeout=REQUEST_TIMEOUT) as client:
        try:
            response = await client.post(OLLAMA_URL, json=payload)
            response.raise_for_status()
        except httpx.ConnectError:
            raise HTTPException(
                status_code=503,
                detail="No se puede conectar a Ollama. ¿Está corriendo 'ollama serve'?"
            )
        except httpx.HTTPStatusError as e:
            raise HTTPException(
                status_code=502,
                detail=f"Ollama devolvió error: {e.response.status_code}"
            )

    data = response.json()
    reply_text: str = data["message"]["content"]

    # Formato que espera LlmClient.gd en Godot
    return {
        "type":  "chat",
        "text":  reply_text,
        "audio": "",        # TTS se agrega en la Entrega 2
    }
