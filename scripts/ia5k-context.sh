#!/bin/bash
# Hook UserPromptSubmit — APES IA5K.
# Ativa/desativa o modo sessão e injeta o protocolo obrigatório em TODO comando
# enquanto o modo estiver ativo. Silencioso quando inativo.
set -u
. "$(dirname "$0")/ia5k-lib.sh"

payload="$(cat 2>/dev/null)"
session="$(printf '%s' "$payload" | jq -r '.session_id // ""' 2>/dev/null)"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // ""' 2>/dev/null)"
prompt="$(printf '%s' "$payload" | jq -r '.prompt // ""' 2>/dev/null)"
[ -n "$cwd" ] || cwd="$PWD"
root="$(ia5k_root "$cwd")"
low="$(printf '%s' "$prompt" | tr '[:upper:]' '[:lower:]')"

# --- desativar (checar antes de ativar) ---
case "$low" in
  /apes-ia5k\ off\ global*|/ia5k\ off\ global*|*ia5k\ off\ em\ todos*|*desativar\ ia5k\ em\ todos*)
    ia5k_global_deactivate
    ia5k_deactivate "$session" "$root"
    echo "[apes-ia5k] Modo metodologia DESATIVADO globalmente (todas sessoes/projetos)."
    exit 0 ;;
  /apes-ia5k\ off*|/apes-ia5k\ desativar*|/ia5k\ off*|*desativar\ ia5k*|*desligar\ ia5k*|*ia5k\ off*)
    ia5k_deactivate "$session" "$root"
    echo "[apes-ia5k] Modo metodologia DESATIVADO para esta sessao e para $root."
    exit 0 ;;
esac

# --- ativar ---
activated=0
case "$low" in
  *todas\ as\ sess*e\ todos\ os\ projeto*|*todas\ sess*e\ todos\ projeto*|*ia5k\ em\ todos\ os\ projetos*|/apes-ia5k\ global*|*ia5k\ global*)
    ia5k_global_activate; ia5k_activate "$session" "$root"; activated=1 ;;
  /apes-ia5k*|/ia5k*|*ativar\ ia5k*|*ia5k\ on*|*ativar\ metodologia*|*modo\ ia5k*)
    ia5k_activate "$session" "$root"; activated=1 ;;
esac

ia5k_is_active "$session" "$root" || exit 0

missing_core="$(ia5k_missing "$root" core)"
missing_all="$(ia5k_missing "$root" all)"
if [ -z "$missing_all" ]; then docs_state="COMPLETOS"; else docs_state="FALTANDO: $missing_all"; fi

agents_warn=""
[ -f "$root/AGENTS.md" ] && [ ! -f "$root/CLAUDE.md" ] && agents_warn="O projeto tem AGENTS.md e nao tem CLAUDE.md. O Claude Code le CLAUDE.md: crie CLAUDE.md contendo a linha @AGENTS.md (importa o mesmo conteudo) em vez de duplicar ou apagar o AGENTS.md, que o Codex e o Antigravity usam."

if [ "$activated" = "1" ]; then
  ia5k_garantir_ferramentas
  echo "[apes-ia5k] MODO METODOLOGIA ATIVADO (sessao + projeto $root)."
  echo "Leia o SKILL.md da metodologia APES IA5K agora e siga o protocolo P1-P8 em TODOS os comandos seguintes ate desativar."
fi

ia5k_ativar_caveman

cat <<EOF
<metodologia-apes-ia5k estado="ATIVA">
Projeto: $root
Documentos da metodologia: $docs_state
$agents_warn

REGRA DURA: nenhum codigo antes dos documentos. O hook PreToolUse bloqueia Edit/Write/MultiEdit em arquivos de codigo enquanto faltar: $IA5K_CORE_DOCS

Para QUALQUER pedido (criar / alterar / implementar / corrigir), execute nesta ordem:
P0 FERRAMENTAS OBRIGATORIAS (uso automatico em TODO passo): tokensave, rtk, code-review-graph, graphify, tokenoptim (CLI) + ponytail, caveman, context-mode, token-optimizer e claude-hud (plugins). As CLI faltantes ja sao baixadas e instaladas em segundo plano pelo proprio plugin (log ~/.ia5k/instalacao.log) — nao pedir permissao, so nao dependa delas antes de terminar. Se faltarem os plugins, pedir ao usuario: /plugin marketplace add DietrichGebert/ponytail + /plugin install ponytail@ponytail e /plugin marketplace add JuliusBrussee/caveman + /plugin install caveman@caveman. TRAVA: o hook PreToolUse bloqueia Read/Grep/Glob em arquivos de codigo enquanto o P1 nao for feito; a trava cai na primeira chamada de mcp__tokensave__* ou mcp__code-review-graph__*. Combinar quantas ferramentas couberem no mesmo passo — quanto mais, menos token. Insumos longos->graphify(+tokenoptim). Mapear->tokensave(_context,_search,_entities)+code-review-graph(arquitetura,fluxos), em paralelo na mesma mensagem. Planejar/impacto->tokensave(_impact,_callers)+code-review-graph(get_impact_radius_tool)+graphify se houver graphify-out. Codificar->ponytail sempre+tokensave(_body,_signature) em vez de Read. Terminal->rtk automatico. Revisar->code-review-graph(detect_changes_tool,get_review_context_tool)+tokensave(_diff_context). Saida grande (log, JSON, web, snapshot de navegador, contar/filtrar muitos arquivos)->context-mode (ctx_execute/ctx_batch_execute/ctx_execute_file; ctx_fetch_and_index+ctx_search para docs), so o resultado entra no contexto; para editar, Read normal. Busca ampla->subagente. Relatar->caveman. Medir->npx -y ccusage@latest daily, rtk gain, /context-mode:ctx-stats; auditoria de desperdicio->skill token-optimizer (so auditar); contexto ocupado->barra do claude-hud. Detalhes: references/ferramentas-token.md.
P1 LER COM ECONOMIA DE TOKEN antes de opinar ou editar: mcp__tokensave__tokensave_context / _search / _callers / _entities (rodar 'tokensave init' se nao houver indice) e code-review-graph (build_or_update_graph_tool, get_architecture_overview_tool, get_impact_radius_tool). rtk ja filtra saida de Bash. Buscas amplas -> subagente. Nunca ler arquivo inteiro sem necessidade.
P2 DOCUMENTOS: se faltar qualquer um, rodar o modo cold-start desta skill (SKILL.md, secao Cold start). Na PRIMEIRA vez o projeto INTEIRO tem de ser varrido, sem amostragem: rodar scripts/inventario-projeto.sh, cobrir 100% dos modulos do inventario (grafo primeiro; leitura direta obrigatoria em migrations, rotas, .env.example, manifestos, middleware/permissoes, README), entregar a TABELA DE COBERTURA (pasta -> como foi coberto -> o que faz -> entidades -> pendencias) e so entao escrever PRD, DECISOES_TECNICAS, FSD, DESIGN, INSUMOS, CLAUDE.md. Cada afirmacao dos documentos aponta a origem no codigo; o que nao der para inferir vira 'PENDENTE - confirmar com o usuario'. STATUS.md e ERROS.md nascem VAZIOS. Tudo isso ANTES de tocar em codigo. Arquivo de contexto: CLAUDE.md no Claude Code; AGENTS.md no Codex/Antigravity; nos dois, conteudo em AGENTS.md e CLAUDE.md com a linha @AGENTS.md.
P3 CLASSIFICAR pela MATRIZ DE IMPACTO (nao pelo tamanho aparente do pedido): funcionalidade nova/alterada/removida ou regra de negocio -> PRD.md + docs/FSD.md; entidade, tabela, campo, migration, rota, endpoint, tela, fluxo -> docs/FSD.md; stack, banco, biblioteca, hospedagem, auth, perfil, permissao -> DECISOES_TECNICAS.md; variavel de ambiente, config, integracao externa, dependencia -> INSUMOS.md + DECISOES_TECNICAS.md; cor, fonte, espacamento, componente, padrao visual -> docs/DESIGN.md; etapa nova descoberta -> docs/PLANO.md; mudou como rodar/testar -> arquivo de contexto (CLAUDE.md ou AGENTS.md). Recurso novo ou mudanca grande: atualizar os documentos ANTES do codigo.
P4 PLANEJAR: registrar a tarefa em docs/PLANO.md (etapas) e abrir a etapa em docs/STATUS.md antes da primeira edicao de codigo.
P5 EXECUTAR UMA etapa por comando, conforme PLANO/FSD/DESIGN. Nao construir varias etapas de uma vez. Nao usar tecnologia fora do FSD.
P6 TESTAR de verdade: lint, typecheck, testes, build, migrations, subir servidor; se houver UI, screenshot + responsividade em docs/screenshots/. Sistema criado != sistema testado.
P7 REGISTRAR SEMPRE: docs/STATUS.md (etapa, arquivos alterados, testes e resultado, data, proxima etapa) e docs/ERROS.md (TODO erro, mesmo ja corrigido, com causa e correcao; consultar ERROS.md ANTES de corrigir). Etapas/subpassos descobertos no caminho -> PLANO.md e STATUS.md. E REVISAR a matriz do P3: atualizar TODO documento que a mudanca afetou (PRD, FSD, DECISOES_TECNICAS, INSUMOS, DESIGN, arquivo de contexto). Ao fechar, dizer em uma linha quais documentos foram atualizados e, para os que nao foram, qual foi conferido e por que nao precisou mexer. O hook Stop bloqueia o encerramento se houve codigo alterado sem STATUS.md atualizado.
P8 ENTREGAR: commit com mensagem clara + Checklist 1 (o que foi feito, linguagem leiga) + Checklist 2 (o que testar e como: acao -> resultado esperado) + Checklist 3 (regressao). Ao concluir uma etapa do STATUS.md, anexar tambem o checklist acumulado de todas as etapas ja feitas.
Concluiu todas as etapas do PLANO -> Revisao de Seguranca (Passo 5) -> Documentacao (Passo 6). A metodologia termina na documentacao; publicar o sistema fica a criterio do usuario.

$(ia5k_regras_sempre_ativas)

Prompt verbatim de cada fase: o SKILL.md da metodologia APES IA5K e references/. Desativar: "/apes-ia5k off".
</metodologia-apes-ia5k>
EOF
exit 0
