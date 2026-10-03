# ERROS — Registro de Erros e Correções

> **Projeto:** <nome>
> **Última atualização:** <data>

Todo erro/bug encontrado durante o desenvolvimento é registrado aqui, com a correção. Esse histórico evita que a IA repita os mesmos erros e serve de guia para problemas futuros.

---

## Modelo de Registro (copie para novo erro)

```markdown
### ERRO-<NNN>: <Título curto do erro>
**Data:** <YYYY-MM-DD>
**Fase:** <número e nome da fase>
**Arquivo(s) envolvido(s):** `<caminho/arquivo.ext>`

**O que aconteceu (linguagem leiga):**
<ex.: "Ao tentar fazer login com senha errada, a página ficava em branco sem mostrar mensagem de erro">

**Mensagem de erro técnica / Stack trace:**
```
<cole o erro exato, log, traceback, console error>
```

**Causa raiz:**
<ex.: "Variável \$errors não passada para a view no controller LoginController@login">

**Correção aplicada:**
<ex.: "Adicionado `->withErrors($validator)` no redirect back do controller">

**Teste de regressão:**
<ex.: "Teste automatizado: POST /login com senha inválida → espera flash error message">
<ex.: "Teste manual: acessar /login, digitar senha errada, clicar entrar → ver mensagem 'Credenciais inválidas'">

**Status:** ✅ Resolvido / 🔄 Em análise / ❌ Bloqueado (dependência)

**Commit da correção:** `<hash ou "pendente">`
```

---

## Log de Erros

| # | ID | Data | Fase | Título | Status |
|---|---|---|---|---|---|
| 1 | ERRO-001 | <data> | <fase> | <título> | ✅ / 🔄 / ❌ |
| 2 | ERRO-002 | <data> | <fase> | <título> | ✅ / 🔄 / ❌ |
| ... | ... | ... | ... | ... | ... |

---

### ERRO-001: <Título>
**Data:** <YYYY-MM-DD>
**Fase:** <número e nome>
**Arquivo(s):** `<caminho/arquivo.ext>`

**O que aconteceu (leiga):**
<descrição>

**Erro técnico:**
```
<erro>
```

**Causa:**
<causa raiz>

**Correção:**
<o que fez>

**Teste regressão:**
<como validou>

**Status:** ✅ Resolvido
**Commit:** <hash>

---

## Erros Conhecidos — Padrões para Evitar
> Preencha conforme erros se repetem. Use na revisão de código e ao iniciar nova fase.

| Padrão de erro | Como evitar na próxima etapa |
|---|---|
| <ex.: "Variável não passada para view Blade"> | Sempre verificar `compact()` ou `with()` no controller antes de commit |
| <ex.: "Migration falha por FK inexistente"> | Ordem das migrations: tabelas pai antes de filhas; usar `foreignIdFor()` |
| <ex.: "Teste falha por dado não limpo entre testes"> | Usar `RefreshDatabase` trait ou `DatabaseTransactions` em testes feature |
| <ex.: "Build falha por variável env não definida"> | Verificar `.env.example` e `.env.testing` antes de push |
| <ex.: "CSS não carrega em produção"> | `npm run build` antes de publicar; verificar `vite.config.js` / `mix` output |

---

## Checklist ao Encontrar um Erro (Obrigatório)

1. [ ] **Reproduzir** o erro consistentemente
2. [ ] **Copiar** mensagem de erro / stack trace / console log exato
3. [ ] **Registrar** neste arquivo (nova entrada ERRO-NNN seguindo o modelo)
4. [ ] **Consultar** se erro semelhante já existe em "Erros Conhecidos"
5. [ ] **Pedir correção** à IA descrevendo: o que fez → o que esperava → o que aconteceu
6. [ ] **Aplicar correção** → **Retestar** (automatizado + manual)
7. [ ] **Marcar como Resolvido** ✅ e preencher commit
8. [ ] **Atualizar** "Erros Conhecidos" se for padrão novo

---

> **"Sistema criado ≠ sistema testado."** Todo erro é uma oportunidade de registrar e não repetir.
> **Regra:** Consultar `docs/ERROS.md` **antes** de pedir correção para erro semelhante.