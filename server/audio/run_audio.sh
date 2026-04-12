#!/bin/bash

# Entramos a server/
cd "$(dirname "$0")/.."

if [ ! -d "venv" ]; then
    echo "❌ Entorno virtual no encontrado. Primero ejecuta ./audio/setup_audio.sh"
    exit 1
fi

source venv/bin/activate
cd audio
python audio_pipeline.py "$@"
