#!/bin/bash
# Hook PostToolUse (ferramentas de grafo) — APES IA5K.
# Registra que o P1 (mapeamento com economia de token) foi feito nesta sessao/projeto.
set -u
. "$(dirname "$0")/ia5k-lib.sh"

payload="$(cat 2>/dev/null)"
command -v jq >/dev/null 2>&1 || exit 0

session="$(printf '%s' "$payload" | jq -r '.session_id // ""')"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // ""')"
root="$(ia5k_root "${cwd:-$PWD}")"

ia5k_p1_marca "$session" "$root"
exit 0
