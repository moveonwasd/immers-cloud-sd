#!/bin/bash

echo "первоначальная настройка automatic1111 на immers.cloud запущена"

if [ $(id -u) -ne 0 ]; then
  echo "этот скрипт требует sudo права для выполнения"
  exit 1
fi

echo "удаление установленных по умолчанию моделей"
rm -rf "$(PWD)/stable-diffusion-webui/models/Stable-diffusion/*"
rm -rf "$(PWD)/stable-diffusion/*"
echo "удаление модулей по умолчанию завершено"

# модели для установки
declare -A models
models["Deliberate"]="https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors"
models["Deliberate Inpainting"]="https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2-inpainting.safetensors"
models["Reliberate"]="https://huggingface.co/XpucT/Reliberate/resolve/main/Reliberate_v2.safetensors"
models["Reliberate Inpainting"]="https://huggingface.co/XpucT/Reliberate/resolve/main/Reliberate_v2-inpainting.safetensors"
models["ToonYou"]="https://huggingface.co/frankjoshua/toonyou_beta6/resolve/main/toonyou_beta6.safetensors"
models["Rev Animated"]="https://huggingface.co/s6yx/ReV_Animated/resolve/main/rev_1.2.safetensors"

for key in "${!models[@]}"; do
  echo "установка модели '$key'"
  wget -P "$(PWD)/stable-diffusion-webui/models/Stable-diffusion/" "${models[$key]}"
  echo "модель '$key' установлена"
done

# эмбеддинги для установки
declare -A embeddings
embeddings["EasyNegative"]="https://huggingface.co/imagepipeline/EasyNegative/resolve/main/81b443d9-e15f-4e87-b1fc-2ea793ebe8a8.pt"

for key in "${!embeddings[@]}"; do
  echo "установка эмбеддинга '$key'"
  wget -P "$(PWD)/stable-diffusion-webui/embeddings/" "${embeddings[$key]}"
  echo "эмбеддинг '$key' установлен"
done

# лора для установки
declare -A lora
lora["Catman"]="https://huggingface.co/artieeg/catman/resolve/main/catman.safetensors"
lora["M_Pixel"]="https://huggingface.co/metalmouseN/M-Pixel/resolve/main/pixel_f2.safetensors"

for key in "${!lora[@]}"; do
  echo "установка лора '$key'"
  wget -P "$(PWD)/stable-diffusion-webui/models/Lora/" "${lora[$key]}"
  echo "лора '$key' установлена"
done

echo "установка sfw стиля по умолчанию"
mv "$(PWD)/styles.csv" "$(PWD)/stable-diffusion-webui/"
mv "$(PWD)/ui-config.json" "$(PWD)/stable-diffusion-webui/"
echo "установка sfw стиля завершена"

echo "первоначальная настройка automatic1111 на immers.cloud завершена"
