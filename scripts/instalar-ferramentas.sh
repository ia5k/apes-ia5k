#!/bin/bash
# Instala as ferramentas OBRIGATORIAS de economia de tokens usadas pela
# metodologia APES IA5K.
#
# Uso:
#   ./scripts/instalar-ferramentas.sh            # instala o que estiver faltando
#   ./scripts/instalar-ferramentas.sh --check    # so verifica, nao instala
set -u

MODO="${1:-instalar}"
FALTANDO=""
OK=""

tem() { command -v "$1" >/dev/null 2>&1; }
titulo() { printf '\n\033[1m==> %s\033[0m\n' "$1"; }
aviso()  { printf '    %s\n' "$1"; }

registrar_ok()      { OK="$OK $1"; aviso "ja instalado: $(command -v "$1")"; }
registrar_falta()   { FALTANDO="$FALTANDO $1"; }

# ---------------------------------------------------------------- pre-requisitos
titulo "Pre-requisitos"
for dep in git python3 jq; do
  if tem "$dep"; then aviso "ok: $dep"; else aviso "FALTA: $dep (instale antes de continuar)"; fi
done
tem brew || aviso "aviso: Homebrew nao encontrado (macOS: https://brew.sh) — sera usado o metodo alternativo"
tem uv   || aviso "aviso: uv nao encontrado — instale com: curl -LsSf https://astral.sh/uv/install.sh | sh"
tem pipx || aviso "aviso: pipx nao encontrado — instale com: python3 -m pip install --user pipx"

instalar_py() { # $1 = pacote pip
  if tem uv; then uv tool install "$1"
  elif tem pipx; then pipx install "$1"
  else python3 -m pip install --user "$1"; fi
}

# ---------------------------------------------------------------- 1. tokensave
titulo "1/10 tokensave — grafo de codigo (MCP)  https://github.com/aovestdipaperino/tokensave"
if tem tokensave; then registrar_ok tokensave; else
  if [ "$MODO" = "--check" ]; then registrar_falta tokensave; else
    if tem brew; then brew install aovestdipaperino/tap/tokensave
    elif tem cargo; then cargo install tokensave
    else aviso "instale manualmente: https://github.com/aovestdipaperino/tokensave#install"; fi
  fi
fi
tem tokensave && [ "$MODO" != "--check" ] && tokensave install --agent claude || true

# ---------------------------------------------------------------- 2. rtk
titulo "2/10 rtk — filtro de saida do terminal  https://github.com/rtk-ai/rtk"
if tem rtk; then registrar_ok rtk; else
  if [ "$MODO" = "--check" ]; then registrar_falta rtk; else
    if tem brew; then brew install rtk
    else curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh; fi
  fi
fi
tem rtk && [ "$MODO" != "--check" ] && rtk init -g || true

# ---------------------------------------------------------------- 3. code-review-graph
titulo "3/10 code-review-graph — grafo estrutural para review (MCP)  https://github.com/tirth8205/code-review-graph"
if tem code-review-graph; then registrar_ok code-review-graph; else
  if [ "$MODO" = "--check" ]; then registrar_falta code-review-graph; else instalar_py code-review-graph; fi
fi
tem code-review-graph && [ "$MODO" != "--check" ] && code-review-graph install --platform claude-code || true

# ---------------------------------------------------------------- 4. graphify
titulo "4/10 graphify — grafo de conhecimento  https://github.com/Graphify-Labs/graphify"
if tem graphify; then registrar_ok graphify; else
  if [ "$MODO" = "--check" ]; then registrar_falta graphify; else instalar_py graphifyy; fi
fi
tem graphify && [ "$MODO" != "--check" ] && graphify install || true

# ---------------------------------------------------------------- 5. tokenoptim
titulo "5/10 tokenoptim — compressao de prompt  https://github.com/Manas470/tokenoptim"
if tem tokenoptim || tem llm-tokenoptim; then registrar_ok "$(tem tokenoptim && echo tokenoptim || echo llm-tokenoptim)"; else
  if [ "$MODO" = "--check" ]; then registrar_falta tokenoptim; else instalar_py llm-tokenoptim; fi
fi

# ---------------------------------------------------------------- 6 a 10. plugins do Claude Code
# Instalados pelo proprio CLI do Claude Code ('claude plugin'). Sem o CLI, mostra os comandos.
instalar_plugin() { # $1 = repo do marketplace  $2 = plugin@marketplace  $3 = nome
  if ls -d "$HOME"/.claude/plugins/cache/*/"$3" >/dev/null 2>&1 || [ -d "$HOME/.claude/skills/$3" ]; then
    aviso "ja instalado: $3"; OK="$OK $3"; return 0; fi
  if [ "$MODO" = "--check" ] || ! tem claude; then
    registrar_falta "$3"; aviso "no Claude Code: /plugin marketplace add $1  e  /plugin install $2"; return 0; fi
  claude plugin marketplace add "$1" >/dev/null 2>&1
  if claude plugin install "$2" >/dev/null 2>&1; then aviso "instalado: $2"; OK="$OK $3"; else registrar_falta "$3"; aviso "falhou: claude plugin install $2"; fi
}
titulo "6/10 caveman — resposta comprimida  https://github.com/JuliusBrussee/caveman"
instalar_plugin JuliusBrussee/caveman caveman@caveman caveman
titulo "7/10 ponytail — solucao mais simples que funciona  https://github.com/DietrichGebert/ponytail"
instalar_plugin DietrichGebert/ponytail ponytail@ponytail ponytail
titulo "8/10 context-mode — saidas grandes fora do contexto  https://github.com/mksglu/context-mode"
instalar_plugin mksglu/context-mode context-mode@context-mode context-mode
titulo "9/10 token-optimizer — auditoria de desperdicio  https://github.com/alexgreensh/token-optimizer"
instalar_plugin alexgreensh/token-optimizer token-optimizer@alexgreensh-token-optimizer token-optimizer
titulo "10/10 claude-hud — contexto ocupado na barra de status  https://github.com/jarrodwatts/claude-hud"
instalar_plugin jarrodwatts/claude-hud claude-hud@claude-hud claude-hud
aviso "barra de status: rode /claude-hud:setup uma vez dentro do Claude Code."
aviso "medicao de gasto (sem instalar nada): npx -y ccusage@latest daily"

# ---------------------------------------------------------------- resultado
titulo "Resultado"
if [ "$MODO" = "--check" ]; then
  if [ -n "$FALTANDO" ]; then
    aviso "FALTANDO:$FALTANDO"
    aviso "Rode sem --check para instalar."
    exit 1
  fi
  aviso "Todas as ferramentas de linha de comando estao instaladas."
  exit 0
fi
aviso "Feche e abra o Claude Code para os servidores MCP entrarem no ar."
aviso "Depois confira com: ./scripts/instalar-ferramentas.sh --check"
