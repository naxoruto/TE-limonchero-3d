#!/bin/bash
set -e

echo "============================================="
echo " Detective Noir VR - Audio Pipeline Setup"
echo "============================================="

cd "$(dirname "$0")/.." # Ir a la carpeta server/

if [ ! -d "venv" ]; then
    echo "[*] Creando entorno virtual (venv)..."
    python3 -m venv venv
fi

echo "[*] Activando entorno e instalando dependencias..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
pip install -r requirements-audio.txt

echo ""
echo "[✅] Setup STT+TTS completado."
echo "     Usa './audio/run_audio.sh' para ejecutar la herramienta interactiva de consola."
