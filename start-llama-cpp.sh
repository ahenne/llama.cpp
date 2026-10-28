export CUDA_VISIBLE_DEVICES=0
llama serve --list-devices
# pip install -U "huggingface_hub[cli]"
# hf download ggml-org/Qwen3.8-27B-GGUF Qwen3.8-27B-Q4_K_M.gguf --local-dir /home/alex/models
# https://huggingface.co/bartowski/Qwen3.8-27B-GGUF/resolve/main/Qwen3.8-27B-Q4_K_M.gguf
# https://huggingface.co/unsloth/Qwen3.8-27B-GGUF/resolve/main/Qwen3.8-27B-UD-Q4_K_M.gguf
#llama serve -hf ggml-org/Qwen3.8-27B-GGUF --port 9931 --alias "claude-sonnet" -fa on -ngl 99 -c 131072 -ctk q8_0 -ctv q4_0 
 llama serve -dev CUDA0 \
  -m /home/alex/models/Unsloth-Qwen3.8-27B-UD-Q4_K_M.gguf \
  --spec-type draft-mtp \
  --spec-draft-n-max 2 \
  --port 9931 \
  --jinja \
  -fa on \
  -ngl 99 \
  -c 131072 \
  -ctk q8_0 -ctv q8_0 \
  -b 4096 -ub 1024 \
  --temp 0.2 \
  --repeat-penalty 1.15 \
  --frequency-penalty 0.05 \
  --metrics 
#llama serve -dev CUDA0 \
  -m /home/alex/models/Bartowski-Qwen3.8-27B-Q4_K_M.gguf \
  --spec-type draft-mtp \
  --spec-draft-n-max 2 \
  --port 9931 \
  --jinja \
  -fa on \
  -ngl 99 \
  -c 131072 \
  -ctk q4_0 -ctv q4_0 \
  -b 512 -ub 512
