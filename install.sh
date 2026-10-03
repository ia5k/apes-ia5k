#!/bin/bash
# Instalador da skill APES IA5K.
# Uso: ./install.sh claude | codex | antigravity | all
#      ./install.sh antigravity --projeto /caminho/do/projeto   (instala em .agent/skills do projeto)
set -euo pipefail

AQUI="$(cd "$(dirname "$0")" && pwd)"
NOME="apes-ia5k"
ARQUIVOS="SKILL.md METODOLOGIA.md references templates scripts"

copiar() {
  local destino="$1"
  mkdir -p "$destino"
  for a in $ARQUIVOS; do
    rm -rf "${destino:?}/$a"
    cp -R "$AQUI/$a" "$destino/"
  done
  chmod +x "$destino"/scripts/*.sh
  echo "skill copiada para $destino"
}

instalar_claude() {
  copiar "$HOME/.claude/skills/$NOME"
  command -v jq >/dev/null 2>&1 || { echo "jq nao encontrado: instale o jq e rode de novo para registrar os hooks." >&2; return 1; }
  local cfg="$HOME/.claude/settings.json"
  [ -f "$cfg" ] || echo '{}' > "$cfg"
  cp "$cfg" "$cfg.bak-$NOME-$(date +%Y%m%d%H%M%S)"
  # Remove hooks antigos desta skill e adiciona os atuais (rodar de novo nao duplica).
  jq --slurpfile novo "$AQUI/hooks/claude-settings.json" '
    .hooks = (.hooks // {})
    | .hooks |= with_entries(.value |= map(select(all(.hooks[]?; (.command // "") | test("skills/apes-ia5k/") | not))))
    | reduce ($novo[0].hooks | to_entries[]) as $e (.; .hooks[$e.key] = ((.hooks[$e.key] // []) + $e.value))
  ' "$cfg" > "$cfg.tmp" && mv "$cfg.tmp" "$cfg"
  echo "hooks registrados em $cfg (backup salvo ao lado)"
  echo "Claude Code: abra uma sessao nova e digite /apes-ia5k para ativar."
}

instalar_codex() {
  copiar "${CODEX_HOME:-$HOME/.codex}/skills/$NOME"
  echo "Codex: no projeto, peca 'use a skill apes-ia5k'. O protocolo fica no AGENTS.md (templates/AGENTS.md)."
}

instalar_antigravity() {
  if [ "${1:-}" = "--projeto" ] && [ -n "${2:-}" ]; then
    copiar "$2/.agent/skills/$NOME"
  else
    copiar "$HOME/.gemini/antigravity/skills/$NOME"
  fi
  echo "Antigravity: peca 'use a skill apes-ia5k'. O protocolo fica no AGENTS.md (templates/AGENTS.md)."
}

case "${1:-}" in
  claude) instalar_claude ;;
  codex) instalar_codex ;;
  antigravity) shift; instalar_antigravity "$@" ;;
  all) instalar_claude; instalar_codex; instalar_antigravity ;;
  *) echo "uso: ./install.sh claude | codex | antigravity [--projeto DIR] | all" >&2; exit 1 ;;
esac
