# CHECKLIST — Modelo de Checklist por Fase

> **Projeto:** <nome> | **Fase:** <número e nome> | **Data:** <data>
> **Base:** `docs/FSD.md` Seção 23 + `docs/STATUS.md`

---

## ✅ Checklist 1 — O que foi implementado (linguagem leiga)
> Para o cliente/usuário que NÃO entende de código. Entregue ao final da fase.

- [ ] <ex.: "Agora é possível fazer login com e-mail e senha, e a sessão permanece ativa ao fechar o navegador">
- [ ] <ex.: "Usuário sem permissão de admin é bloqueado ao tentar acessar /admin com mensagem amigável">
- [ ] <ex.: "Dashboard mostra KPIs reais (vendas do mês, clientes ativos) com dados do banco">
- [ ] <...>

---

## 🧪 Checklist 2 — O que testar e como testar (passo a passo)
> **Ação → Resultado esperado.** Inclui testes manuais E comandos automatizados.
> Entregue ao final da fase para validação humana.

### Testes Manuais (ação do usuário)
- [ ] **Teste:** Acessar `http://localhost:3000/login` → **Resultado:** Ver formulário com campos email, senha, botão "Entrar", link "Esqueci senha"
- [ ] **Teste:** Preencher email válido + senha correta → clicar "Entrar" → **Resultado:** Redirecionar para `/dashboard`, ver nome do usuário no header
- [ ] **Teste:** Preencher email válido + senha errada → clicar "Entrar" → **Resultado:** Ver mensagem "Credenciais inválidas" em vermelho, permanecer em `/login`
- [ ] **Teste:** Deixar campos vazios → clicar "Entrar" → **Resultado:** Ver mensagens "O campo email é obrigatório" e "O campo senha é obrigatório"
- [ ] **Teste:** Acessar `/dashboard` sem estar logado → **Resultado:** Redirecionar para `/login` com mensagem "Faça login para continuar"
- [ ] **Teste:** Logout → **Resultado:** Redirecionar para `/login`, sessão destruída, não acessa `/dashboard` voltando no histórico

### Testes Automatizados (comandos)
- [ ] **Comando:** `npm run lint` → **Resultado:** ✅ 0 erros, 0 warnings
- [ ] **Comando:** `tsc --noEmit` → **Resultado:** ✅ 0 erros de tipo
- [ ] **Comando:** `npm test` → **Resultado:** ✅ 42/42 testes passam (inclui 8 testes de auth)
- [ ] **Comando:** `npm run build` → **Resultado:** ✅ Build succeeds sem erros
- [ ] **Comando:** `npm run dev` → **Resultado:** ✅ Servidor roda em http://localhost:3000

### Testes de Regressão (o que NÃO pode quebrar)
- [ ] Login/logout continua funcionando após mudanças
- [ ] Middleware auth ainda bloqueia rotas privadas
- [ ] RBAC/perfis continuam isolando dados por empresa
- [ ] APIs anteriores respondem com mesmo contrato
- [ ] Componentes base (Button, Input, Modal, Table) renderizam corretamente

---

## 🔁 Checklist 3 — Verificações de Regressão (obrigatório)
> Verificar se fases anteriores não quebraram.

- [ ] Fase 1: Projeto ainda roda, lint/build/test passam, CI verde
- [ ] Fase 2: Migrations ainda rodam limpo, seeders populam
- [ ] Fase 3: Auth (login, logout, middleware, RBAC) funciona
- [ ] Fase 4: Layout, menu, dashboard, componentes base funcionam
- [ ] <outras fases conforme projeto>

---

## 👁️ Checklist 4 — Validação Visual (obrigatório se fase tem UI)
> Não marcar fase concluída sem preencher.

| Verificação | ✅/❌ | Evidência |
|---|---|---|
| Screenshot salvo em `docs/screenshots/fase-X-<nome>.png` | | |
| Cores conforme DESIGN.md (primária, secundária, neutras) | | |
| Tipografia conforme DESIGN.md (fontes, tamanhos, pesos) | | |
| Espaçamento 8pt grid (margins, padding, gaps) | | |
| Componentes visuais idênticos ao DESIGN.md (buttons, inputs, cards) | | |
| Responsivo Mobile (375px) — sem overflow, toque OK | | |
| Responsivo Tablet (768px) — layout adapta | | |
| Responsivo Desktop (1440px) — layout completo | | |
| Dark mode (se no DESIGN.md) — cores invertidas corretamente | | |
| Acessibilidade: Tab navigation顺序 lógica | | |
| Acessibilidade: Labels em todos inputs | | |
| Acessibilidade: Contraste ≥ 4.5:1 (texto normal) | | |
| Acessibilidade: ARIA básico (buttons, modais, alerts) | | |
| Estados: loading, vazio, erro, sucesso visíveis | | |

---

## 📋 Checklist 5 — Critérios de Pronto da Fase (FSD Seção 22)
> **Todos devem ser ✅ para marcar fase como Concluída no STATUS.md.**

- [ ] Critério específico 1 (ex.: Migrations up/down OK)
- [ ] Critério específico 2 (ex.: Seeders populam dados obrigatórios)
- [ ] Critério específico 3 (ex.: Factories geram dados válidos)
- [ ] Lint zero erros
- [ ] Type check zero erros
- [ ] Testes automatizados 100% pass
- [ ] Build success
- [ ] Servidor local sobe e responde
- [ ] Validação visual completa (Checklist 4)
- [ ] Regressão OK (Checklist 3)
- [ ] ERROS.md atualizado com quaisquer erros (mesmo corrigidos)
- [ ] Commit realizado: `Fase X: <resumo claro>`

---

## 📦 Entrega da Fase
> Ao concluir, entregar ao usuário:

1. **Este CHECKLIST preenchido** (todos os 5 checklists acima)
2. **STATUS.md atualizado** com detalhamento da fase
3. **ERROS.md atualizado** se houver erros
4. **Commit Git** com mensagem `Fase X: <resumo>`
5. **Próxima fase identificada** no PLANO.md
6. **Instrução:** "Próxima fase = chat novo com Prompt 04"

---

> **Regra:** Fase só é ✅ Concluída se **TODOS** os checklists acima estão preenchidos e válidos.