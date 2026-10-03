#!/bin/bash
# CLI do modo sessao da metodologia APES IA5K.
# Uso: ia5k-session.sh on|off|status [diretorio]
set -u
. "$(dirname "$0")/ia5k-lib.sh"

action="${1:-status}"
target="${2:-$PWD}"
root="$(ia5k_root "$target")"

case "$action" in
  on|ativar)
    ia5k_activate "" "$root"
    ia5k_garantir_ferramentas
    echo "ia5k: ATIVA em $root"
    ;;
  off|desativar)
    ia5k_deactivate "" "$root"
    echo "ia5k: DESATIVADA em $root"
    ;;
  status)
    if ia5k_is_active "" "$root"; then echo "ia5k: ATIVA em $root"; else echo "ia5k: inativa em $root"; fi
    ;;
  *)
    echo "uso: ia5k-session.sh on|off|status [diretorio]" >&2; exit 1 ;;
esac

miss_all="$(ia5k_missing "$root" all)"
miss_core="$(ia5k_missing "$root" core)"
[ -z "$miss_all" ] && echo "docs: completos" || echo "docs faltando: $miss_all"
[ -n "$miss_core" ] && echo "BLOQUEIO ATIVO em codigo ate criar: $miss_core"
[ -f "$root/AGENTS.md" ] && [ ! -f "$root/CLAUDE.md" ] && echo "AGENTS.md sem CLAUDE.md -> para o Claude Code, crie CLAUDE.md com a linha @AGENTS.md"
exit 0
