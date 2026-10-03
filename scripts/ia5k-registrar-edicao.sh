#!/bin/bash
# Hook PostToolUse (Edit|Write|MultiEdit|NotebookEdit) — APES IA5K.
# Anota o que foi alterado na sessao, para o Stop hook cobrar a atualizacao dos documentos.
set -u
. "$(dirname "$0")/ia5k-lib.sh"

payload="$(cat 2>/dev/null)"
command -v jq >/dev/null 2>&1 || exit 0

session="$(printf '%s' "$payload" | jq -r '.session_id // ""')"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // ""')"
alvo="$(printf '%s' "$payload" | jq -r '.tool_input.file_path // .tool_input.notebook_path // ""')"
root="$(ia5k_root "${cwd:-$PWD}")"

[ -n "$alvo" ] || exit 0
ia5k_is_active "$session" "$root" || exit 0
ia5k_is_exempt_path "$alvo" && exit 0

printf '%s\n' "$alvo" >> "$(ia5k_edits_file "$session" "$root")"
exit 0
