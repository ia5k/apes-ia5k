#!/bin/bash
# Hook SessionStart — APES IA5K.
# Verifica as ferramentas OBRIGATORIAS de economia de tokens e injeta no contexto
# do Claude quais estao disponiveis e como instalar as que faltam.
set -u
cat >/dev/null 2>&1   # descarta o payload do hook

AQUI="$(cd "$(dirname "$0")" && pwd)"
INSTALADOR="$AQUI/instalar-ferramentas.sh"
tem() { command -v "$1" >/dev/null 2>&1; }

# Instala em segundo plano o que estiver faltando (no maximo 1x por dia).
LIB="$AQUI/ia5k-lib.sh"
if [ -f "$LIB" ]; then . "$LIB"; ia5k_garantir_ferramentas 2>/dev/null || true; ia5k_ativar_caveman 2>/dev/null || true; fi

disp=""; falta=""
add() { if tem "$1"; then disp="$disp $1"; else falta="$falta $1"; fi; }
add tokensave
add rtk
add code-review-graph
add graphify
if tem tokenoptim || tem llm-tokenoptim; then disp="$disp tokenoptim"; else falta="$falta tokenoptim"; fi

# plugins do Claude Code: procurados no disco
for pl in ponytail caveman context-mode token-optimizer claude-hud; do
  if ls -d "$HOME"/.claude/plugins/cache/*/"$pl" >/dev/null 2>&1 || ls -d "$HOME"/.claude/skills/"$pl" >/dev/null 2>&1; then
    disp="$disp $pl"
  else
    falta="$falta $pl"
  fi
done

regras=""
command -v ia5k_regras_sempre_ativas >/dev/null 2>&1 || true
type ia5k_regras_sempre_ativas >/dev/null 2>&1 && regras="$(ia5k_regras_sempre_ativas)"

ctx="FERRAMENTAS DE ECONOMIA DE TOKENS (APES IA5K) — USO OBRIGATORIO.
Disponiveis:${disp:- nenhuma}.
Ausentes:${falta:- nenhuma}.

Regras obrigatorias enquanto trabalhar neste projeto:
- Explorar codigo: usar mcp__tokensave__tokensave_context / _search / _callers / _callees / _impact ANTES de ler arquivos inteiros.
- Review e impacto: usar mcp__code-review-graph__detect_changes_tool, _get_review_context_tool, _get_impact_radius_tool, _semantic_search_nodes_tool em vez de Grep amplo.
- Busca ampla em varios arquivos: delegar a subagente, nunca despejar arquivos inteiros no contexto principal.
- Escrever codigo: aplicar a skill ponytail (solucao mais simples que funciona, sem over-engineering).
- Terminal: rtk filtra a saida automaticamente; nunca contornar com 'rtk proxy'.
- Saida grande (log, JSON, web, navegador): context-mode (ctx_execute / ctx_batch_execute) processa fora do contexto.
- Medir: npx -y ccusage@latest daily · rtk gain · /context-mode:ctx-stats. Auditoria: skill token-optimizer.
- Perguntas sobre a arquitetura do projeto: consultar graphify (graphify-out/) antes de ler arquivos.
- Combinar varias ferramentas no MESMO passo (chamadas em paralelo na mesma mensagem) sempre que possivel — economiza mais que usar uma de cada vez.

$regras"

# Instrucoes de instalacao so quando algo falta (economiza token em toda sessao).
if [ -n "$falta" ]; then
  ctx="$ctx

As ferramentas de linha de comando ausentes ja estao sendo instaladas em segundo plano
(log: ~/.ia5k/instalacao.log). Para forcar agora:
  bash \"$INSTALADOR\"
Plugins faltando: rode o instalador acima (usa 'claude plugin install'). Ou, dentro do Claude Code:
  /plugin marketplace add JuliusBrussee/caveman        /plugin install caveman@caveman
  /plugin marketplace add DietrichGebert/ponytail      /plugin install ponytail@ponytail
  /plugin marketplace add mksglu/context-mode          /plugin install context-mode@context-mode
  /plugin marketplace add alexgreensh/token-optimizer  /plugin install token-optimizer@alexgreensh-token-optimizer
  /plugin marketplace add jarrodwatts/claude-hud       /plugin install claude-hud@claude-hud"
fi

if command -v jq >/dev/null 2>&1; then
  jq -n --arg c "$ctx" '{hookSpecificOutput:{hookEventName:"SessionStart",additionalContext:$c}}'
else
  printf '%s\n' "$ctx"
fi
exit 0
