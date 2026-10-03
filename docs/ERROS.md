# Erros — APES IA5K

## 03/10/2026 - Gatilho de ativação disparava com caminhos de pasta
- **Sintoma:** o padrão `*/apes-ia5k*` herdado da base ativaria o modo em qualquer prompt que citasse um caminho como `~/projetos/apes-ia5k/...`.
- **Causa:** o padrão aceitava `/apes-ia5k` em qualquer posição do texto.
- **Correção:** comandos com barra só valem no início do prompt (`/apes-ia5k*`, `/ia5k*`) em `scripts/ia5k-context.sh`. Testado: prompt com caminho não ativa.

## 03/10/2026 - Hook de encerramento não viu a atualização do STATUS
- **Sintoma:** o hook Stop bloqueou o encerramento dizendo que `docs/STATUS.md` não foi atualizado.
- **Causa:** o STATUS foi escrito por comando de terminal, que o hook não registra (limite conhecido, documentado no SKILL.md).
- **Correção:** atualizar `docs/STATUS.md` e `docs/ERROS.md` pela ferramenta de edição.

## 03/10/2026 - Não foi possível apagar o repositório antigo
- **Sintoma:** `gh repo delete kairoxaioficial/apes-ia5k` respondeu `HTTP 403: Must have admin rights to Repository`.
- **Causa:** o token da conta kairoxaioficial não tem a permissão `delete_repo`.
- **Correção:** rodar `gh auth refresh -h github.com -s delete_repo -u kairoxaioficial` e repetir a exclusão.
