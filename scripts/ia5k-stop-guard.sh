#!/bin/bash
# Hook Stop — APES IA5K.
# Se a sessao alterou CODIGO e nao atualizou os documentos da metodologia,
# nao deixa encerrar: devolve a lista do que precisa ser revisado.
set -u
. "$(dirname "$0")/ia5k-lib.sh"

payload="$(cat 2>/dev/null)"
command -v jq >/dev/null 2>&1 || exit 0

# Ja estamos num ciclo de continuacao disparado por este hook: nao bloquear de novo.
[ "$(printf '%s' "$payload" | jq -r '.stop_hook_active // false')" = "true" ] && exit 0

session="$(printf '%s' "$payload" | jq -r '.session_id // ""')"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // ""')"
root="$(ia5k_root "${cwd:-$PWD}")"

ia5k_is_active "$session" "$root" || exit 0

arquivo="$(ia5k_edits_file "$session" "$root")"
[ -f "$arquivo" ] || exit 0

codigo=0; status=0; erros=0
while IFS= read -r f; do
  [ -n "$f" ] || continue
  case "$f" in */docs/STATUS.md) status=1; continue ;; esac
  case "$f" in */docs/ERROS.md) erros=1; continue ;; esac
  ia5k_is_doc_metodologia "$f" && continue
  ia5k_is_codigo "$f" && codigo=1
done < "$arquivo"

# Nada de codigo alterado, ou STATUS ja atualizado: pode encerrar.
[ "$codigo" = "1" ] || { rm -f "$arquivo"; exit 0; }
[ "$status" = "1" ] && { rm -f "$arquivo"; exit 0; }

alterados="$(sort -u "$arquivo" | sed "s|^$root/||" | head -20 | tr '\n' ' ')"
rm -f "$arquivo"

jq -n --arg a "$alterados" '{
  decision: "block",
  reason: ("Codigo foi alterado nesta sessao e docs/STATUS.md nao foi atualizado. Antes de encerrar, faca o P7 e o P8.\n\nArquivos alterados: " + $a + "\n\n1. docs/STATUS.md — etapa, arquivos alterados, testes executados e resultado, data, proxima etapa.\n2. docs/ERROS.md — todo erro que apareceu no caminho, mesmo os ja corrigidos, com causa e correcao.\n3. Avalie pela matriz de impacto e ATUALIZE o que mudou de verdade:\n   - funcionalidade nova, alterada ou removida -> PRD.md\n   - mudanca de stack, banco, biblioteca, hospedagem, autenticacao, permissao, config -> DECISOES_TECNICAS.md\n   - entidade, tabela, campo, rota, tela, fluxo, regra de negocio, endpoint -> docs/FSD.md\n   - cor, fonte, espacamento, componente novo, padrao visual -> docs/DESIGN.md\n   - dependencia, variavel de ambiente, insumo, integracao externa -> INSUMOS.md e DECISOES_TECNICAS.md\n   - etapa nova descoberta no caminho -> docs/PLANO.md\n   - mudanca no jeito de rodar, testar ou contribuir -> arquivo de contexto (CLAUDE.md ou AGENTS.md)\n   Nada dessa lista mudou? Diga explicitamente qual documento voce conferiu e por que nao precisou mexer.\n4. Entregue os checklists do P8: o que foi feito (linguagem leiga), o que testar e como, e o que conferir de regressao.")
}'
exit 0
