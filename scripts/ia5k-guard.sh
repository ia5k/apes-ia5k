#!/bin/bash
# Hook PreToolUse (Edit|Write|MultiEdit|NotebookEdit) — APES IA5K.
# Enquanto o modo metodologia estiver ativo:
#   bloqueia edicao de CODIGO enquanto faltarem os documentos da metodologia.
# Documentos, docs/, README, configs e caminhos isentos passam sempre.
set -u
. "$(dirname "$0")/ia5k-lib.sh"

deny() { jq -n --arg r "$1" '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:$r}}'; exit 0; }

payload="$(cat 2>/dev/null)"
session="$(printf '%s' "$payload" | jq -r '.session_id // ""' 2>/dev/null)"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // ""' 2>/dev/null)"
path="$(printf '%s' "$payload" | jq -r '.tool_input.file_path // .tool_input.notebook_path // .tool_input.path // ""' 2>/dev/null)"
[ -n "$cwd" ] || cwd="$PWD"
[ -n "$path" ] || exit 0
case "$path" in /*) ;; *) path="$cwd/$path" ;; esac

root="$(ia5k_root "$path")"
ia5k_is_active "$session" "$root" || ia5k_is_active "$session" "$(ia5k_root "$cwd")" || exit 0
[ "$root" = "$HOME" ] && exit 0
ia5k_is_exempt_path "$path" && exit 0

base="$(basename "$path")"

# Documentos/config/docs passam sempre (sao justamente o que deve vir antes).
case "$path" in
  */docs/*|*/.github/*|*/.claude/*) exit 0 ;;
esac
case "$base" in
  PRD.md|DECISOES_TECNICAS.md|CLAUDE.md|AGENTS.md|INSUMOS.md|FSD.md|DESIGN.md|PLANO.md|STATUS.md|ERROS.md|CHECKLIST.md|MANUTENCAO.md|COMO-PEDIR-MUDANCAS.md|README.md|.gitignore|.gitattributes)
    exit 0 ;;
esac

missing="$(ia5k_missing "$root" core)"
[ -z "$missing" ] && exit 0

deny "Metodologia APES IA5K ativa: nenhum codigo antes dos documentos. Faltam em $root: $missing. Faca nesta ordem: (1) ler o codigo com tokensave/code-review-graph; (2) rodar o modo cold-start da skill apes-ia5k para criar TODOS os documentos (STATUS.md e ERROS.md vazios; arquivo de contexto CLAUDE.md ou AGENTS.md); (3) registrar a tarefa em docs/PLANO.md e docs/STATUS.md; (4) so entao editar codigo. Para sair do modo: '/apes-ia5k off'."
