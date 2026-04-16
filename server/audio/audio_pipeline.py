import _thread
import argparse
import atexit
import json
import os
import queue
import subprocess
import sys
import threading
import time
import termios
import tty

import httpx
import numpy as np
import sounddevice as sd
import soundfile as sf
from faster_whisper import WhisperModel

# Agregar la carpeta padre para importar npc_prompts.py
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
try:
    from npc_prompts import get_system_prompt
except ImportError:
    # Dummy fallback if missing for some reason
    def get_system_prompt(npc_id):
        return "You are a helpful assistant."

# ============================================================
# Configuración STT (Whisper)
# ============================================================
WHISPER_MODEL = "base"

# ============================================================
# Configuración TTS (Piper)
# ============================================================
PIPER_MODEL = "en_US-lessac-medium"
PIPER_DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "piper_models")

# ============================================================
# Configuración Ollama
# ============================================================
OLLAMA_URL = "http://localhost:11434/api/chat"
OLLAMA_MODEL = "llama3"

# ============================================================
# Configuración de Audio de Entrada
# ============================================================
SAMPLE_RATE = 16000
CHANNELS = 1


class AudioPipeline:
    def __init__(self, npc_id="marco_delgado"):
        self.npc_id = npc_id
        
        print(f"[*] Inicializando memoria del NPC '{self.npc_id}'...")
        self.messages = [
            {"role": "system", "content": get_system_prompt(self.npc_id)}
        ]

        print(f"[*] Cargando modelo STT (faster-whisper '{WHISPER_MODEL}')...")
        self.whisper_model = WhisperModel(WHISPER_MODEL, device="cpu", compute_type="int8")
        self.compute_device = "CPU"

        os.makedirs(PIPER_DATA_DIR, exist_ok=True)
        self.temp_wav_in = os.path.join(os.path.dirname(os.path.abspath(__file__)), "temp_record.wav")
        self.temp_wav_out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "temp_reply.wav")

        self.recording = False
        self.recorded_frames = []

    def _wait_for_space(self):
        fd = sys.stdin.fileno()
        old = termios.tcgetattr(fd)
        try:
            tty.setraw(fd)
            while True:
                ch = sys.stdin.read(1)
                if ch == ' ':
                    break
                if ch in ('\x03', '\x04'):  # Ctrl+C / Ctrl+D
                    raise KeyboardInterrupt
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old)

    def record_audio(self):
        print("\n> Presiona ESPACIO para empezar a hablar...")
        self._wait_for_space()
        self.recording = True
        self.recorded_frames = []

        def callback(indata, frames, time_info, status):
            if status:
                print(status, file=sys.stderr)
            if self.recording:
                self.recorded_frames.append(indata.copy())

        stream = sd.InputStream(samplerate=SAMPLE_RATE, channels=CHANNELS, callback=callback, dtype='float32')
        with stream:
            print("🎙️ Grabando... (Presiona ESPACIO para detener)")
            self._wait_for_space()
            self.recording = False
            
        print("🎙️ Grabación finalizada...")
        
        if not self.recorded_frames:
            return None
            
        audio_data = np.concatenate(self.recorded_frames, axis=0)
        audio_data = audio_data.flatten()
        duration = len(audio_data) / SAMPLE_RATE
        print(f"🎙️ Guardando grabación de {duration:.1f} segundos...")
        
        sf.write(self.temp_wav_in, audio_data, SAMPLE_RATE)
        return self.temp_wav_in

    def transcribe(self, audio_path):
        print("🔤 Transcribiendo (STT)...")
        # Forzamos idioma inglés ("en")
        segments, _ = self.whisper_model.transcribe(audio_path, beam_size=5, language="en")
        text = "".join([segment.text for segment in segments]).strip()
        print(f"\n▶ JUGADOR: \"{text}\"")
        return text

    def chat_llm(self, text):
        if not text:
            return None
            
        self.messages.append({"role": "user", "content": text})
        
        payload = {
            "model": OLLAMA_MODEL,
            "messages": self.messages,
            "stream": False
        }
        
        print(f"⏳ Enviando al LLM (Ollama → {OLLAMA_MODEL})...")
        try:
            with httpx.Client(timeout=180) as client:
                resp = client.post(OLLAMA_URL, json=payload)
                resp.raise_for_status()
                data = resp.json()
                reply = data["message"]["content"]
                
                self.messages.append({"role": "assistant", "content": reply})
                print(f"\n💬 {self.npc_id.upper()}: \"{reply}\"")
                return reply
        except httpx.ConnectError:
            print("❌ Error: No se puede conectar a Ollama. ¿Está corriendo 'ollama serve'?")
            return None
        except Exception as e:
            print(f"❌ Error con Ollama: {e}")
            return None

    def speak(self, text):
        if not text:
            return
            
        print("🔊 Generando audio (Piper TTS)...")
        # Limpiamos el archivo temporal anterior
        if os.path.exists(self.temp_wav_out):
            os.remove(self.temp_wav_out)
            
        cmd = [
            "piper", 
            "--model", PIPER_MODEL, 
            "--data-dir", PIPER_DATA_DIR,
            "--download-dir", PIPER_DATA_DIR,
            "--output_file", self.temp_wav_out
        ]
        
        try:
            # Piper procesa texto desde la entrada estándar
            process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
            _, stderr_data = process.communicate(input=text.encode('utf-8'))
            
            if process.returncode != 0:
                print(f"❌ Error interno de Piper: {stderr_data.decode('utf-8', errors='ignore')}")
                print("💡 Intenta instalar la versión correcta de piper o revisa la red para descarga del modelo.")
                return

            if os.path.exists(self.temp_wav_out):
                data, fs = sf.read(self.temp_wav_out, dtype='float32')
                print("🎧 Reproduciendo...")
                sd.play(data, fs)
                sd.wait()
            else:
                print("❌ Piper TTS no generó el archivo de salida.")
        except FileNotFoundError:
            print(f"❌ Error: El comando 'piper' no se encontró. ¿Instalaste piper-tts en tu entorno?")

    def run(self):
        print(f"\n╔{'═'*54}╗")
        print(f"║         🎙️  Detective Noir — Audio Pipeline PoC      ║")
        print(f"║{'═'*54}║")
        print(f"║  NPC activo: {self.npc_id:<40}║")
        print(f"║  Modelo STT: faster-whisper ({WHISPER_MODEL}) [{self.compute_device}]      ║")
        print(f"║  Modelo TTS: piper ({PIPER_MODEL})             ║")
        print(f"╚{'═'*54}╝\n")
        
        while True:
            try:
                audio_path = self.record_audio()
                if not audio_path:
                    print("⚠️ No se detectó audio.")
                    continue
                    
                text = self.transcribe(audio_path)
                
                # Descartamos si el jugador no dijo nada ("" o solo espacios)
                if not text.strip():
                    print("⚠️ No se detectó conversación.")
                    continue
                    
                reply = self.chat_llm(text)
                # self.speak(reply)  # TTS desactivado, solo texto
                
                print("\n" + "─"*56)
            except KeyboardInterrupt:
                print("\nSaliendo del pipeline de audio. ¡Adiós!")
                break
            except EOFError:
                break


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Pipeline de audio STT+TTS")
    parser.add_argument("--test", action="store_true", help="Solamente verifica las importaciones y la carga del motor")
    parser.add_argument("--npc", type=str, default="marco_delgado", help="ID del NPC para cargar sus prompts")
    args = parser.parse_args()
    
    pipeline = AudioPipeline(npc_id=args.npc)
    if args.test:
        print("[TEST] Inicialización de componentes exitosa.")
        sys.exit(0)
    else:
        pipeline.run()
