# STATUS — Acompanhamento do Desenvolvimento

> **Projeto:** <nome>
> **Última atualização:** <data>
> **Fase atual:** <ex.: Fase 3 — Autenticação e Controle de Acesso>
> **Base:** `docs/PLANO.md` + `docs/FSD.md` (Seção 22)

---

## Visão geral do progresso

| Fase | Objetivo (leigo) | Status | Concluída em |
|---|---|---|---|
| 1 | Estrutura Base do Projeto | ⬜ | — |
| 2 | Banco de Dados e Migrations | ⬜ | — |
| 3 | Autenticação e Controle de Acesso | ⬜ | — |
| 4 | Recursos Estruturais (UI Base) | ⬜ | — |
| 5 | Entidades Principais | ⬜ | — |
| 6 | CRUDs das Entidades | ⬜ | — |
| 7 | Fluxos Principais | ⬜ | — |
| 8 | Relatórios e Consultas | ⬜ | — |
| 9 | Uploads | ⬜ | — |
| 10 | Exportações | ⬜ | — |
| 11 | APIs e Integrações | ⬜ | — |
| 12 | Logs e Contingência | ⬜ | — |
| 13 | Revisão de Segurança | ⬜ | — |
| 14 | Revisão de Qualidade | ⬜ | — |
| 15 | Documentação e Entrega | ⬜ | — |

> **Legenda:** ⬜ Pendente | 🔄 Em andamento | ✅ Concluída | ❌ Bloqueada

---

## Detalhamento da Fase Atual — <nome da fase>

### ✅ O que foi implementado (linguagem leiga)
> Preenchido ao concluir a fase. Para quem NÃO entende de código.
- [ ] <ex.: "Agora é possível fazer login com e-mail e senha, e a sessão permanece ativa ao fechar o navegador">
- [ ] <ex.: "Usuário sem permissão de admin é bloqueado ao tentar acessar /admin">
- [ ] <...>

### 🧪 Testes Automatizados Executados
> **Obrigatório:** Todos devem passar para marcar fase como ✅ Concluída.

| Tipo | Comando | Resultado | Detalhes |
|---|---|---|---|
| Lint | `<comando>` | ✅ / ❌ | <ex.: 0 erros / 3 erros: ...> |
| Type check | `<comando>` | ✅ / ❌ | <ex.: 0 erros / 2 erros: ...> |
| Testes unitários | `<comando>` | ✅ / ❌ | <ex.: 42/42 pass / 1 fail: ...> |
| Testes feature/E2E | `<comando>` | ✅ / ❌ | <ex.: 18/18 pass / 2 fail: ...> |
| Build | `<comando>` | ✅ / ❌ | <ex.: Success / Failed: ...> |
| Servidor local | `<comando>` | ✅ / ❌ | <ex.: Rodando em http://localhost:3000> |
| Migrations (se fase 2) | `<comando>` | ✅ / ❌ | <ex.: 12 migrations OK / 1 fail: ...> |

### 👁️ Validação Visual (Obrigatório se fase tem UI — Fases 4, 6, 7, 9, 10)
> **Não marcar fase concluída sem isso.**

| Verificação | Resultado | Evidência |
|---|---|---|
| Screenshot salvo | ✅ / ❌ | `docs/screenshots/fase-X-<nome>.png` |
| Comparação com DESIGN.md | ✅ / ❌ | Cores, tipografia, espaçamento, componentes OK |
| Responsividade Mobile (375px) | ✅ / ❌ | Layout não quebra, toque funciona |
| Responsividade Tablet (768px) | ✅ / ❌ | Layout adapta, navegação OK |
| Responsividade Desktop (1440px) | ✅ / ❌ | Layout completo, hover states OK |
| Acessibilidade básica | ✅ / ❌ | Tab nav, labels, contraste 4.5:1, ARIA básico |

### 🔁 Verificações de Regressão (Obrigatório)
> O que NÃO pode ter quebrado em fases anteriores.

- [ ] Login/logout continua funcionando
- [ ] Navegação entre páginas funciona
- [ ] Middleware de autenticação bloqueia rotas privadas
- [ ] RBAC/perfis continuam isolando dados
- [ ] APIs anteriores respondem corretamente
- [ ] Componentes base (tabelas, forms, modais) funcionam
- [ ] <outro específico do projeto>

### ⚠️ Erros encontrados nesta fase
> Registrar TODOS, mesmo corrigidos. Formato padrão em `docs/ERROS.md`.

| ID | Erro | Causa | Correção | Status |
|---|---|---|---|---|
| ERRO-001 | <resumo> | <causa raiz> | <o que fez> | ✅ Corrigido / 🔄 Em análise |

### ✅ Checklist de Pronto da Fase (FSD Seção 22 + 23)
> **Todos devem estar ✅ para marcar fase como Concluída.**

- [ ] Critério 1 (ex.: Migrations rodam limpo up/down)
- [ ] Critério 2 (ex.: Seeders populam dados obrigatórios)
- [ ] Critério 3 (ex.: Factories geram dados válidos para testes)
- [ ] Lint zero erros
- [ ] Type check zero erros
- [ ] Testes automatizados 100% pass
- [ ] Build success
- [ ] Servidor local sobe e responde
- [ ] Validação visual completa (se UI)
- [ ] Regressão OK
- [ ] ERROS.md atualizado
- [ ] Commit realizado: `Fase X: <resumo>`

---

## Checklist Completo — Todas as Fases (Geral)
> Atualizado **sempre que uma fase é concluída**. Lista TUDO o que já foi entregue no projeto, em linguagem leiga, por fase.

### Fase 1 — Estrutura Base do Projeto
- [x] Projeto inicializado e roda localmente
- [x] Lint, type check, build, testes passam
- [x] CI/CD configurado e verde no GitHub
- [x] `.env.example` completo
- [x] Git conectado ao GitHub com primeiro commit

### Fase 2 — Banco de Dados e Migrations
- [ ] Migrations criam todas as tabelas (up/down OK)
- [ ] Seeders populam perfis, admin, configs
- [ ] Factories funcionam para testes
- [ ] Rollback testado

### Fase 3 — Autenticação e Controle de Acesso
- [ ] Login/logout funciona
- [ ] Registro de usuário (se aplicável)
- [ ] Recuperação de senha
- [ ] 2FA (se aplicável)
- [ ] Perfis/RBAC bloqueiam acesso indevido
- [ ] Middleware auth protege rotas privadas

### Fase 4 — Recursos Estruturais (UI Base)
- [ ] Layout base (header, footer, sidebar)
- [ ] Menu navegação responsivo (hamburger mobile)
- [ ] Dashboard com KPIs reais
- [ ] Componentes: tabelas, forms, modais, notificações, breadcrumbs, paginação
- [ ] Validação visual OK (screenshot + DESIGN.md)
- [ ] Acessibilidade básica OK

### Fase 5 — Entidades Principais
- [ ] Models com relationships, scopes, casts
- [ ] Services/Repositories com lógica de negócio
- [ ] Testes unitários passam

### Fase 6 — CRUDs das Entidades
- [ ] Create/Read/Update/Delete por entidade
- [ ] Filtros e busca funcionam
- [ ] Export CSV/PDF
- [ ] Testes feature passam
- [ ] Validação visual OK

### Fase 7 — Fluxos Principais
- [ ] Cada fluxo E2E implementado
- [ ] Testes automatizados + manuais passam
- [ ] Regras de negócio validadas

### Fase 8 — Relatórios e Consultas
- [ ] Relatórios geram corretos
- [ ] Filtros, agrupamentos, export funcionam
- [ ] Performance dentro do threshold

### Fase 9 — Uploads
- [ ] Upload/download/delete funcionam
- [ ] Validações MIME/tamanho/segurança
- [ ] Storage privado, thumbnails/OCR

### Fase 10 — Exportações
- [ ] Formatos corretos
- [ ] Agendamento funciona
- [ ] Grandes volumes dentro do threshold

### Fase 11 — APIs e Integrações
- [ ] Contrato cumprido
- [ ] Retry + Dead letter queue
- [ ] Monitoramento + testes de contrato

### Fase 12 — Logs e Contingência
- [ ] Erros/auditoria/acesso/jobs logados
- [ ] Alertas disparam
- [ ] Retenção configurada

### Fase 13 — Revisão de Segurança
- [ ] Checklist Passo 5 100% OK
- [ ] Achados corrigidos ou aceitos com justificativa

### Fase 14 — Revisão de Qualidade
- [ ] Lint/Type/Tests/Build/Cobertura/A11y/Perf thresholds OK

### Fase 15 — Documentação e Entrega
- [ ] Arquivo de contexto (CLAUDE.md ou AGENTS.md) em modo manutenção
- [ ] `docs/MANUTENCAO.md` e `docs/COMO-PEDIR-MUDANCAS.md` criados
- [ ] Variáveis de produção documentadas em `.env.example`

---

## Próximos passos
1. <próxima fase a implementar conforme PLANO.md>
2. <pendências ou bloqueios atuais>

---

> **Regra:** Quando a última fase (15 - Documentação e Entrega) for concluída: o projeto está **entregue**. A Revisão de Segurança (Fase 13) e Qualidade (Fase 14) já foram executadas **antes** da Fase 15. Não há passos extras depois da entrega.