export CUDA_VISIBLE_DEVICES=0
llama serve --list-devices
# pip install -U "huggingface_hub[cli]"
# hf download ggml-org/Qwen3.8-27B-GGUF Qwen3.8-27B-Q4_K_M.gguf --local-dir /home/alex/models
# https://huggingface.co/bartowski/Qwen3.8-27B-GGUF/resolve/main/Qwen3.8-27B-Q4_K_M.gguf
# https://huggingface.co/unsloth/Qwen3.8-27B-GGUF/resolve/main/Qwen3.8-27B-UD-Q4_K_M.gguf
#llama serve -dev CUDA0 -sm none -hf ggml-org/Qwen3.8-27B-GGUF --port 9931 --alias "claude-sonnet" -fa on -ngl 99 -c 32768
#llama serve -dev CUDA0 -sm none -hf ggml-org/Qwen3.8-27B-GGUF --port 9931 --alias "claude-sonnet" -fa on -ngl 99 -c 65536 
#llama serve -dev CUDA0 -sm none -hf ggml-org/Qwen3.8-27B-GGUF --port 9931 --alias "claude-sonnet" -fa on -ngl 99 -c 131072 -ctk q8_0 -ctv q4_0 
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
  -ctk q4_0 -ctv q4_0 \
  -b 512 -ub 512 
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
