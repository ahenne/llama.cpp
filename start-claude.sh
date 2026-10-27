CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
#ANTHROPIC_CUSTOM_HEADERS='{"x-api-key":"sk-ant-local1234567890abcdefghijklmnopqrstuvwxyz"}' \
ANTHROPIC_BASE_URL="http://localhost:9931/v1" \
ANTHROPIC_API_KEY="sk-ant-local1234567890abcdefghijklmnopqrstuvwxyz" \
ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet" \
ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-sonnet" \
ANTHROPIC_DEFAULT_OPUS_MODEL="claude-sonnet" \
claude --bare --exclude-dynamic-system-prompt-sections
