#!/bin/bash

# Entramos a server/
cd "$(dirname "$0")/.."

if [ ! -d "venv" ]; then
    echo "❌ Entorno virtual no encontrado. Primero ejecuta ./audio/setup_audio.sh"
    exit 1
fi

source venv/bin/activate

# Vincular las librerías de NVIDIA instaladas por pip para aceleración por GPU
ENV_SITE_PACKAGES=$(python -c "import site; print(site.getsitepackages()[0])")
export LD_LIBRARY_PATH="$ENV_SITE_PACKAGES/nvidia/cublas/lib:$ENV_SITE_PACKAGES/nvidia/cudnn/lib:$LD_LIBRARY_PATH"

cd audio
python audio_pipeline.py "$@"
