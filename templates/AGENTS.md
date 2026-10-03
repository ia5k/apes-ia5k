# Contexto do projeto — instruções para IAs que trabalham aqui

> Este arquivo é lido por ferramentas de IA agêntica (Claude Code lê `CLAUDE.md`; Codex e Antigravity leem `AGENTS.md`) para que qualquer sessão siga a mesma metodologia. Mantenha-o atualizado quando a stack ou as regras mudarem.
> **Modo:** 🏗️ CONSTRUÇÃO (durante desenvolvimento) → 🔧 MANUTENÇÃO (após a entrega)

---

## Stack e Estrutura
- **Linguagem/Framework:** <ex.: TypeScript + Next.js 14 (App Router) / PHP 8.3 + Laravel 11 / Python 3.12 + FastAPI>
- **Banco de Dados:** <ex.: PostgreSQL 15 / MySQL 8 / SQLite (dev)>
- **ORM:** <ex.: Prisma / Eloquent / SQLAlchemy>
- **Autenticação:** <ex.: NextAuth.js / Laravel Sanctum / JWT custom>
- **Hospedagem:** <ex.: Vercel / VPS / AWS>
- **CI/CD:** <ex.: GitHub Actions>
- **Testes:** <ex.: Vitest + Playwright / Pest + PHPUnit / Pytest + Playwright>
- **Lint/Format:** <ex.: ESLint + Prettier / Pint + Prettier / Ruff>
- **Estrutura de pastas:** <resumo conforme FSD Seção 5>

---

## Metodologia Obrigatória — APES IA5K

**Antes de QUALQUER alteração ou implementação, seguir a metodologia da skill `apes-ia5k`.**

### Fluxo Resumido
1. **Ler contexto completo:** `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, `docs/DESIGN.md`, `docs/FSD.md`, `PRD.md`, `DECISOES_TECNICAS.md`, este arquivo de contexto, código relevante.
2. **Se projeto não tem documentos:** Cold Start → ler TODO o código → criar estrutura completa → aplicar comando.
3. **Simples vs. Grande:** Edição simples → direto + STATUS/ERROS. Recurso maior → atualizar PRD/FSD/insumos → novo plano → fase a fase.
4. **Codificar em etapas:** UMA fase por vez, UMA fase por chat. Código → Testes (auto + manual) → STATUS/ERROS → Commit → Checklists → Parar.
5. **Testar antes de avançar:** Sistema criado ≠ sistema testado. Checklists obrigatórios.
6. **Fim do STATUS:** Segurança → Documentação. Publicar o sistema fica fora da metodologia.
7. **Checklists:** Entregar ao final de cada fase: (a) O que foi implementado (leigo), (b) O que testar e como (ação→resultado + comandos), (c) Regressão, (d) Visual (se UI), (e) Critérios de pronto.


### Protocolo em todo pedido (P1–P8)
O Codex e o Antigravity não têm os hooks do Claude Code. Por isso as travas valem aqui como regra escrita, e você deve cumpri-las sozinho:

- **P1 Ler antes de agir.** Mapear o código relevante antes de opinar ou editar. Não ler arquivos inteiros sem necessidade.
- **P2 Documentos primeiro.** Se faltar `PRD.md`, `docs/FSD.md`, `docs/PLANO.md`, `docs/STATUS.md` ou `docs/ERROS.md`, **não escreva código**: faça o cold start (ler todo o projeto, criar os documentos; STATUS e ERROS nascem vazios).
- **P3 Classificar pelo impacto.** Funcionalidade ou regra de negócio → `PRD.md` + `docs/FSD.md`. Tabela, campo, rota, tela, fluxo → `docs/FSD.md`. Stack, banco, biblioteca, autenticação, permissão → `DECISOES_TECNICAS.md`. Variável de ambiente, integração, dependência → `INSUMOS.md`. Cor, fonte, componente → `docs/DESIGN.md`. Recurso novo: atualizar os documentos **antes** do código.
- **P4 Planejar.** Registrar a tarefa em `docs/PLANO.md` e abrir a etapa em `docs/STATUS.md` antes de editar código.
- **P5 Uma etapa por vez.** Nunca construir várias etapas de uma vez. Nada fora do FSD.
- **P6 Testar de verdade.** Lint, typecheck, testes, build, servidor rodando; se houver tela, conferir visualmente. Sistema criado não é sistema testado.
- **P7 Registrar sempre.** `docs/STATUS.md` (etapa, arquivos, testes e resultado, data, próxima etapa) e `docs/ERROS.md` (todo erro, mesmo corrigido, com causa e correção). Não encerre com código alterado e STATUS desatualizado.
- **P8 Entregar.** Commit com mensagem clara + checklist do que foi feito (linguagem simples) + checklist do que testar e como + checklist de regressão.

---

## Regras Rígidas de Execução (OBRIGATÓRIAS - R1 a R8)

### R1 — FSD Validado ANTES de Codificar
- `docs/FSD.md` deve passar pela **Validação do FSD (Passo 6 Fase 1)** antes da Fase 2.
- Relatório: Resumo, Problemas Críticos, Importantes, Melhorias, Verificação PRD/Decisões/Design, Conclusão.
- **NÃO iniciar codificação sem validação aprovada.**

### R2 — Estrutura Completa Antes da Fase 1 de Código
Antes do primeiro Prompt 04, deve existir e estar commitado:
- `docs/PLANO.md` com fases do FSD Seção 22
- `docs/STATUS.md` vazio inicial
- `docs/ERROS.md` com modelo
- Este `AGENTS.md` em **modo construção**
- Pastas do projeto conforme FSD
- `.gitignore`, `.gitattributes`
- Git init + primeiro commit + GitHub conectado

### R3 — Uma Fase por Chat (Prompt 04 = Uma Fase)
- Identificar próxima fase ⬜ no `PLANO.md` (ordem fixa, não escolher).
- Implementar → Testar auto → Testar manual (instruções) → Registrar → Commit → **Parar**.
- Próxima fase = **chat novo** com mesmo Prompt 04.
- **NUNCA** construir duas fases no mesmo chat.

### R4 — Testes Automatizados Obrigatórios por Fase
**Executar TODOS aplicáveis à stack ANTES de entregar:**
- [ ] Lint/Syntax (`npm run lint`, `./vendor/bin/pint --test`, `ruff check`)
- [ ] Type check (`tsc --noEmit`, `phpstan analyse`, `mypy`)
- [ ] Testes unitários/integração (`npm test`, `./vendor/bin/pest`, `pytest`)
- [ ] Build/Compile (`npm run build`, `composer install --no-dev`, `cargo build`)
- [ ] Migrations/Schema (se banco envolvido)
- [ ] Server startup (iniciar local, verificar resposta HTTP 200)
- **Se algum falhar: corrigir → retestar → só então prosseguir.**

### R5 — Validação Visual Obrigatória (Fases com UI: 4, 6, 7, 9, 10)
- IA deve **iniciar servidor local** e fornecer URL.
- IA deve **tirar screenshot** (Playwright/Puppeteer/Chrome DevTools MCP).
- IA deve **verificar visualmente** contra `docs/DESIGN.md` (cores, tipografia, espaçamento, componentes).
- IA deve testar **responsividade** (mobile 375px, tablet 768px, desktop 1440px) via emulação.
- Screenshot salvo em `docs/screenshots/fase-X-<nome>.png`.
- **Não marcar fase concluída sem validação visual.**

### R6 — Checklists Humanos Obrigatórios (Entregar ao Usuário)
Ao final de cada fase, entregar **3 checklists em linguagem leiga:**

**Checklist 1 — O que foi implementado (para cliente/usuário leigo)**
- [ ] Descrição simples do que agora é possível fazer
- [ ] Conquistas visíveis

**Checklist 2 — O que testar e como testar (ação → resultado esperado)**
- [ ] **Teste:** <ação> → <resultado> (ex.: "Abrir /login → Ver formulário com email, senha, botão Entrar")
- [ ] **Teste erro:** <ação inválida> → <mensagem amigável>
- [ ] **Comando auto:** <comando> → <resultado> (ex.: `npm test` → "42/42 pass")
- [ ] **Comando build:** <comando> → <resultado>

**Checklist 3 — Regressão (o que NÃO pode quebrar)**
- [ ] Login/logout funciona
- [ ] Navegação entre páginas
- [ ] Middleware auth bloqueia rotas privadas
- [ ] RBAC isola dados
- [ ] APIs anteriores respondem
- [ ] Componentes base funcionam

### R7 — Atualização STATUS.md + ERROS.md Obrigatória
Após cada fase:
- `docs/STATUS.md`: fase, arquivos, testes/resultados, validação visual, erros, data, próxima fase.
- `docs/ERROS.md`: qualquer erro (mesmo corrigido) no modelo padrão.
- Commit: `Fase X: <resumo da fase>`.

### R8 — Segurança FINAL Obrigatória
Ao concluir **todas** as fases do `PLANO.md`:
- Executar **Revisão de Segurança (Passo 5)** em chat novo com raciocínio.
- Checklist: SQLi, XSS, CSRF, Hash, Auth/Session, RBAC, Isolamento, Arquivos sensíveis, Env vars, Error msgs, Logs, Input val, Output sanit, Uploads, APIs ext, Secrets, Rotas internas, FSD/AGENTS prioridade.
- Classificar: Crítico/Alto/Médio/Baixo.
- Corrigir o seguro, perguntar antes de mudar regra/fluxo/dados/arquitetura.
- Atualizar STATUS, ERROS, commit, push.
- Só então: Documentação (Passo 6).

---

## Modo Construção vs Manutenção

### 🏗️ MODO CONSTRUÇÃO (durante desenvolvimento)
- Seguir metodologia completa acima
- Prompt 04 para cada fase
- Checklists obrigatórios
- STATUS/ERROS ativos
- Commits frequentes

### 🔧 MODO MANUTENÇÃO (após a entrega - preencher no Passo 6)
Atualizar este arquivo com:
- **Como rodar localmente:** comandos reais (ex.: `npm run dev`, `php artisan serve`)
- **Mapa de pastas:** o que guarda, quando mexer, cuidados
- **Banco de dados:** migrations, seeders, cuidados (backup antes de alterar)
- **Auth/Autorização:** perfis, onde permissões verificadas (policies, middleware)
- **Como adicionar tela:** passos, arquivos a alterar (rota, controller, view, componente, teste)
- **Como adicionar campo:** banco (migration), model (fillable/casts), formulário, validação, listagem, testes, docs
- **Como alterar regra de negócio:** onde fica, testes afetados, checklist regressão
- **Variáveis de produção:** quais existem e onde ficam (sem valores reais)
- **Checklist antes de alterar:** ler docs, preservar FSD, testar, commit
- **Rollback:** código = Git (`git revert`/`reset`); banco = backup + análise + cuidado

---

## Regras de Registro
- `docs/ERROS.md`: **Todo** erro com causa e correção (modelo no template).
- `docs/STATUS.md`: Status da fase atual a cada avanço (modelo no template).
- Commits: Mensagem clara em português (`Fase X: <resumo>`).

---

## Comandos Úteis (Preencher com comandos REAIS da stack)

| Ação | Comando |
|---|---|
| Instalar dependências | `<ex.: npm ci / composer install>` |
| Rodar localmente | `<ex.: npm run dev / php artisan serve>` |
| Rodar testes | `<ex.: npm test / ./vendor/bin/pest>` |
| Rodar lint | `<ex.: npm run lint / ./vendor/bin/pint --test>` |
| Type check | `<ex.: tsc --noEmit / phpstan analyse --level=5>` |
| Build | `<ex.: npm run build / composer install --no-dev>` |
| Migrations | `<ex.: npx prisma migrate dev / php artisan migrate --seed>` |
| Screenshot (Playwright) | `<ex.: npx playwright test --project=chromium>` |
| Formatar código | `<ex.: npx prettier --write . / ./vendor/bin/pint>` |

---

## Segurança por Stack (Resumo)
- **Next.js/React:** CSP headers, `dangerouslySetInnerHTML` evitado, Server Actions validadas, cookies `httpOnly` `secure` `sameSite`
- **Laravel:** Eloquent bindings (sem raw SQL), `$request->validate()`, policies/gates, `Hash::make()`, CSRF tokens, `encrypted` cookies
- **FastAPI/Python:** Pydantic validation, SQLAlchemy params, `passlib` bcrypt, `itsdangerous` tokens, `httpx` timeouts
- **Universal:** Rate limit auth/API, secrets só em env/Secrets, logs sem PII/senhas, uploads validados MIME+tamanho+storage privado

---

## Fluxos Especiais (Resumo)

### Edição Simples (bug pequeno, ajuste)
1. Aplicar direto no código
2. Atualizar `docs/STATUS.md` e `docs/ERROS.md`
3. Entregar 2 checklists (leigo + como testar)
4. **NÃO** atualizar PRD/FSD/insumos

### Alteração/Recurso Maior
1. Atualizar `PRD.md`/`FSD.md`/insumos se necessário
2. Iniciar novo plano no `docs/STATUS.md` (nova fase)
3. Ir fase a fase, metodologia completa
4. Gerar nova documentação se necessário

### Pedido de Alteração (Chat Separado)
Checklist antes de pedir:
- [ ] Objetivo explicado
- [ ] Tipo: visual / funcional / técnica / regra
- [ ] O que NÃO deve alterar avisado
- [ ] Plano pedido antes de executar (se necessário)
- [ ] Preservar regras do FSD pedido
- [ ] Documentação atualizada pedida
- [ ] Verificar necessidade de commit pedida
- [ ] Testar depois da alteração pedido

### Rollback
- **Código:** Git (`git revert <commit>` ou `git reset --hard <tag>` + `push --force-with-lease`)
- **Banco:** Só com análise, backup, cuidado. 9 perguntas antes (código? interface? regra? banco? GitHub? produção? usuários criaram dados? backup? tag anterior?)

---

> **Este arquivo deve ser lido por COMPLETO no início de CADA sessão de trabalho neste projeto.**
> **Dúvidas sobre a metodologia → consultar a skill `apes-ia5k` e os arquivos em `references/`.**