#!/bin/bash
# Biblioteca comum dos hooks da metodologia APES IA5K.
# Sem efeitos colaterais: apenas funções.

IA5K_HOME="${IA5K_HOME:-$HOME/.ia5k}"

# Documentos exigidos ANTES de qualquer código (bloqueiam edição de código).
IA5K_CORE_DOCS="PRD.md docs/FSD.md docs/PLANO.md docs/STATUS.md docs/ERROS.md"
# Conjunto completo da metodologia (reportado, não bloqueante).
IA5K_ALL_DOCS="PRD.md DECISOES_TECNICAS.md CLAUDE.md INSUMOS.md docs/DESIGN.md docs/FSD.md docs/PLANO.md docs/STATUS.md docs/ERROS.md"

# Raiz do projeto: sobe até achar .git ou um documento da metodologia.
ia5k_root() {
  local d="$1"
  [ -d "$d" ] || d="$(dirname "$d")"
  while [ -n "$d" ] && [ "$d" != "/" ] && [ "$d" != "." ]; do
    if [ -d "$d/.git" ] || [ -f "$d/docs/STATUS.md" ] || [ -f "$d/PRD.md" ]; then
      printf '%s' "$d"; return 0
    fi
    d="$(dirname "$d")"
  done
  printf '%s' "$1"
}

ia5k_slug() { printf '%s' "$1" | tr '/ ' '--'; }

ia5k_activate() {
  local session="$1" root="$2"
  mkdir -p "$IA5K_HOME/sessions" "$IA5K_HOME/projects" 2>/dev/null
  [ -n "$session" ] && : > "$IA5K_HOME/sessions/$session"
  [ -n "$root" ] && : > "$IA5K_HOME/projects/$(ia5k_slug "$root")"
  return 0
}

ia5k_deactivate() {
  local session="$1" root="$2"
  [ -n "$session" ] && rm -f "$IA5K_HOME/sessions/$session"
  [ -n "$root" ] && rm -f "$IA5K_HOME/projects/$(ia5k_slug "$root")"
  return 0
}

ia5k_global_flag() { printf '%s' "$IA5K_HOME/global-on"; }

ia5k_global_is_active() {
  [ -f "$(ia5k_global_flag)" ]
}

ia5k_global_activate() {
  mkdir -p "$IA5K_HOME" 2>/dev/null
  : > "$(ia5k_global_flag)"
}

ia5k_global_deactivate() {
  rm -f "$(ia5k_global_flag)"
}

ia5k_is_active() {
  local session="$1" root="$2"
  ia5k_global_is_active && return 0
  [ -n "$session" ] && [ -f "$IA5K_HOME/sessions/$session" ] && return 0
  [ -n "$root" ] && [ -f "$IA5K_HOME/projects/$(ia5k_slug "$root")" ] && return 0
  return 1
}

# Lista (separada por espaço) dos docs faltantes. $2 = "core" | "all"
ia5k_missing() {
  local root="$1" set="${2:-core}" list miss="" f
  if [ "$set" = "all" ]; then list="$IA5K_ALL_DOCS"; else list="$IA5K_CORE_DOCS"; fi
  for f in $list; do
    if [ "$f" = "CLAUDE.md" ]; then
      [ -f "$root/CLAUDE.md" ] || [ -f "$root/AGENTS.md" ] || miss="$miss CLAUDE.md(ou AGENTS.md)"
      continue
    fi
    [ -f "$root/$f" ] || miss="$miss $f"
  done
  printf '%s' "${miss# }"
}

# Caminhos onde a metodologia NUNCA deve bloquear/injetar (config, temporários, home puro).
ia5k_is_exempt_path() {
  local p="$1"
  case "$p" in
    "$HOME"/.claude/*|"$HOME"/.codex/*|"$HOME"/.gemini/*|"$HOME"/.config/*|/tmp/*|/private/tmp/*|/var/folders/*) return 0 ;;
  esac
  return 1
}

# Raiz do plugin (contem scripts/instalar-ferramentas.sh).
ia5k_instalador() {
  local d
  d="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
  [ -f "$d/instalar-ferramentas.sh" ] && { printf '%s' "$d/instalar-ferramentas.sh"; return 0; }
  [ -n "${CLAUDE_PLUGIN_ROOT:-}" ] && [ -f "$CLAUDE_PLUGIN_ROOT/scripts/instalar-ferramentas.sh" ] && \
    { printf '%s' "$CLAUDE_PLUGIN_ROOT/scripts/instalar-ferramentas.sh"; return 0; }
  return 1
}

# Ferramentas obrigatorias de linha de comando presentes?
ia5k_ferramentas_faltando() {
  local falta="" c
  for c in tokensave rtk code-review-graph graphify; do
    command -v "$c" >/dev/null 2>&1 || falta="$falta $c"
  done
  command -v tokenoptim >/dev/null 2>&1 || command -v llm-tokenoptim >/dev/null 2>&1 || falta="$falta tokenoptim"
  printf '%s' "${falta# }"
}

# Instala em segundo plano o que faltar. Roda no maximo 1x por dia.
ia5k_garantir_ferramentas() {
  [ -n "$(ia5k_ferramentas_faltando)" ] || return 0
  local inst marca hoje
  inst="$(ia5k_instalador)" || return 0
  mkdir -p "$IA5K_HOME" 2>/dev/null
  marca="$IA5K_HOME/ultima-instalacao"
  hoje="$(date +%Y-%m-%d)"
  [ -f "$marca" ] && [ "$(cat "$marca" 2>/dev/null)" = "$hoje" ] && return 0
  printf '%s' "$hoje" > "$marca"
  nohup bash "$inst" >"$IA5K_HOME/instalacao.log" 2>&1 &
  return 0
}

# --- P1: mapeamento com grafo feito nesta sessao/projeto? ---
ia5k_p1_marca() {
  local session="$1" root="$2"
  mkdir -p "$IA5K_HOME/p1" 2>/dev/null
  : > "$IA5K_HOME/p1/$(ia5k_slug "${session:-sem-sessao}--$root")"
}

ia5k_p1_feito() {
  local session="$1" root="$2"
  [ -f "$IA5K_HOME/p1/$(ia5k_slug "${session:-sem-sessao}--$root")" ]
}

# Arquivo de codigo? (documentos e configs nao contam)
ia5k_is_codigo() {
  case "$1" in
    *.md|*.txt|*.json|*.yml|*.yaml|*.toml|*.ini|*.env|*.env.*|*.lock|*.csv|*.svg|*.png|*.jpg|*.jpeg|*.gif|*.pdf) return 1 ;;
    *.*) return 0 ;;
  esac
  return 1
}

# --- ponytail + caveman: SEMPRE ativos ---
# Garante o arquivo de estado do caveman (o plugin le o nivel dali).
ia5k_ativar_caveman() {
  local f="$HOME/.claude/.caveman-active"
  [ -f "$f" ] || { mkdir -p "$HOME/.claude" 2>/dev/null; printf 'full' > "$f" 2>/dev/null; }
  return 0
}

# Regras de ponytail e caveman em texto, injetadas em todo prompt.
# Funcionam mesmo se os plugins ainda nao estiverem instalados.
ia5k_regras_sempre_ativas() {
  cat <<'REGRAS'
PONYTAIL (SEMPRE ATIVO) — escada obrigatoria antes de escrever qualquer codigo:
1 a tarefa precisa existir? 2 ja existe no projeto? 3 resolve com recurso nativo da linguagem/plataforma? 4 resolve com dependencia ja instalada? 5 resolve em uma linha? 6 so entao o minimo que funciona.
Nunca cortar validacao, tratamento de erro, seguranca ou acessibilidade. Nao adicionar dependencia, abstracao, camada, config ou arquivo que a tarefa nao exigiu.

CAVEMAN (SEMPRE ATIVO, nivel full) — saida comprimida: sem preambulo, sem resumo final, sem "vou fazer", sem narrar tool call, sem elogio, sem emoji decorativo. Fragmentos ok. Resultado primeiro.
NUNCA comprimir: codigo, comandos, caminhos de arquivo, mensagens de erro, numeros, versoes, avisos de seguranca.
NUNCA comprimir o que fica gravado: documentos da metodologia (PRD, FSD, STATUS, ERROS, PLANO), checklists em linguagem leiga e mensagens de commit sao escritos em portugues normal, por extenso.
Responder sempre no idioma do usuario.
REGRAS
}

# --- registro de edicoes da sessao (para cobrar atualizacao dos documentos) ---
ia5k_edits_file() {
  local session="$1" root="$2"
  mkdir -p "$IA5K_HOME/edits" 2>/dev/null
  printf '%s' "$IA5K_HOME/edits/$(ia5k_slug "${session:-sem-sessao}--$root")"
}

# Documentos da metodologia (para nao contar como "codigo alterado").
ia5k_is_doc_metodologia() {
  case "$1" in
    */PRD.md|PRD.md|*/DECISOES_TECNICAS.md|DECISOES_TECNICAS.md|*/INSUMOS.md|INSUMOS.md|\
    */CLAUDE.md|CLAUDE.md|*/AGENTS.md|AGENTS.md|*/docs/FSD.md|*/docs/DESIGN.md|*/docs/PLANO.md|*/docs/STATUS.md|*/docs/ERROS.md|*/docs/MANUTENCAO.md) return 0 ;;
  esac
  return 1
}
