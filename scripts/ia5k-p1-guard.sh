#!/bin/bash
# Hook PreToolUse (Read|Grep|Glob|Bash) — APES IA5K.
# Enquanto a metodologia estiver ativa, obriga o P1: mapear o codigo pelo grafo
# (tokensave / code-review-graph) ANTES de ler arquivos de codigo direto.
# Documentos, configs e caminhos isentos passam sempre.
set -u
. "$(dirname "$0")/ia5k-lib.sh"

payload="$(cat 2>/dev/null)"
command -v jq >/dev/null 2>&1 || exit 0

session="$(printf '%s' "$payload" | jq -r '.session_id // ""')"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // ""')"
alvo="$(printf '%s' "$payload" | jq -r '.tool_input.file_path // .tool_input.path // .tool_input.pattern // ""')"
root="$(ia5k_root "${cwd:-$PWD}")"

# Bash lendo codigo (cat/head/tail/sed/awk/less/grep/rg/nl) tambem conta como leitura direta.
cmd="$(printf '%s' "$payload" | jq -r '.tool_input.command // ""')"
if [ -n "$cmd" ]; then
  alvo=""
  # so a 1a linha conta (heredoc e escrita com 'cat >' nao sao leitura)
  cmd="$(printf '%s' "$cmd" | head -1)"
  case "$cmd" in *'cat >'*|*'cat >>'*|*'tee '*) cmd="" ;; esac
  if printf '%s' "$cmd" | grep -qE '^[[:space:]]*(cd [^;&]+(;|&&)[[:space:]]*)?(cat|head|tail|sed|awk|less|grep|rg|nl|bat)[[:space:]]'; then
    alvo="$(printf '%s' "$cmd" | grep -oE '[^[:space:]'"'"'"]+\.(js|mjs|cjs|ts|tsx|jsx|py|go|rs|rb|php|java|kt|swift|c|cc|cpp|h|cs|vue|svelte|dart|sql|css|scss|html)\b' | head -1)"
    case "$alvo" in /*|"") ;; *) alvo="${cwd:-$PWD}/$alvo" ;; esac
  fi
fi

ia5k_is_active "$session" "$root" || exit 0
ia5k_p1_feito "$session" "$root" && exit 0
ia5k_is_exempt_path "$alvo" && exit 0
[ -n "$alvo" ] && ia5k_is_codigo "$alvo" || exit 0

# Sem tokensave instalado nao da para exigir o grafo: instala em segundo plano e libera.
if ! command -v tokensave >/dev/null 2>&1; then
  ia5k_garantir_ferramentas
  exit 0
fi

jq -n '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: "P1 da metodologia APES IA5K ainda nao foi feito nesta sessao. Antes de ler codigo arquivo por arquivo, mapeie com o grafo (gasta muito menos token): mcp__tokensave__tokensave_context com a descricao da tarefa (e keywords), depois _search / _callers / _callees / _impact conforme necessario; para arquitetura e raio de impacto, mcp__code-review-graph__build_or_update_graph_tool e _get_impact_radius_tool. Sem indice ainda? rode: tokensave init . — Depois da primeira chamada de qualquer uma dessas ferramentas, Read/Grep/Glob sao liberados nesta sessao."
  }
}'
exit 0
