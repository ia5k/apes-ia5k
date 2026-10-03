# FSD — Especificação Funcional do Sistema

> **Projeto:** <nome>
> **Versão:** 0.1
> **Última atualização:** <data>
> **Status:** ⏳ Em elaboração / ✅ Validado
> **Base:** `PRD.md` + `DESIGN.md` + `DECISOES_TECNICAS.md`

---

## 1. Visão Geral
<1 parágrafo: o que o sistema faz, para quem, com qual stack, objetivo principal.>

---

## 2. Documentos do Projeto para Implementação
**Apenas estes dois documentos devem ser lidos pela IA durante a codificação:**
- `docs/FSD.md` (este arquivo)
- `docs/DESIGN.md`

> **Regra:** PRD, DECISOES_TECNICAS, INSUMOS, PLANO, STATUS, ERROS servem de apoio/validação, mas a IA de codificação deve consumir apenas FSD + DESIGN para não se perder em contexto.

---

## 3. Stack Definida
| Item | Decisão |
|---|---|
| Linguagem / Framework | <ex.: PHP 8.3 + Laravel 11 / TypeScript + Next.js 14 / Python 3.12 + FastAPI> |
| Banco de Dados | <ex.: MySQL 8 / PostgreSQL 15 / SQLite (dev)> |
| ORM / Query Builder | <ex.: Eloquent / Prisma / SQLAlchemy> |
| Autenticação | <ex.: Laravel Sanctum / NextAuth / JWT custom> |
| Hospedagem (produção) | <ex.: VPS / Vercel / AWS> |
| CI/CD | <ex.: GitHub Actions → SSH/rsync> |
| Frontend (se houver) | <ex.: Blade + Alpine.js / React + Tailwind / Vue + Nuxt> |
| Testes | <ex.: Pest / Vitest / Pytest> |
| Lint/Format | <ex.: Pint + Prettier / ESLint + Prettier / Ruff> |

---

## 4. Ambientes do Projeto
| Ambiente | URL / Host | Banco | Variáveis de ambiente | Observações |
|---|---|---|---|---|
| Local | `http://localhost:8000` | SQLite / MySQL local | `.env` | Desenvolvimento |
| Testes | `http://localhost:8001` | SQLite em memória | `.env.testing` | CI / testes automatizados |
| Homologação | <url> | MySQL/PostgreSQL remoto | Secrets GitHub / painel | Pré-produção |
| Produção | <url> | MySQL/PostgreSQL produção | Secrets GitHub / painel | Acesso restrito |

---

## 5. Arquitetura do Sistema
- **Padrão arquitetural:** <ex.: MVC / Modular Monolith / Clean Architecture / Feature-based>
- **Estrutura de pastas (resumo):**
```
<root>/
├── app/              # Lógica de aplicação (Controllers, Models, Services)
├── resources/        # Views, assets, lang
├── routes/           # Rotas (web, api, console)
├── database/         # Migrations, seeders, factories
├── tests/            # Unit, Feature, E2E
├── public/           # Entry point, assets compilados
├── config/           # Configurações
├── storage/          # Logs, cache, uploads
└── docs/             # Documentos da metodologia
```

---

## 6. Regras de Segurança no Contexto
- Autenticação: <ex.: email + senha (hash bcrypt/argon2), 2FA opcional, remember token>
- Autorização: <ex.: RBAC com perfis Admin/Gestor/Cliente, policies/gates>
- Isolamento de dados: <ex.: multi-tenancy por company_id em todas as queries>
- Soft delete: <ex.: `deleted_at` em todas as entidades sensíveis>
- Auditoria: <ex.: tabela `audits` com user_id, action, model, changes, ip, user_agent>
- Logs de erro em banco: <ex.: tabela `error_logs` com exception, trace, context, severity>
- Proteção CSRF: <ex.: tokens em formulários, SameSite=Lax cookies>
- Proteção XSS: <ex.: escape automático Blade/React, CSP headers>
- Sanitização uploads: <ex.: validação MIME + extensão, armazenamento fora de public/, scan antivírus se crítico>
- Variáveis sensíveis: <ex.: apenas em `.env` / GitHub Secrets, nunca no código>
- Mensagens de erro: <ex.: amigáveis para usuário, técnicas apenas em log (não expostas)>
- Rate limiting: <ex.: login 5/min, API 60/min, ajustável por rota>

---

## 7. Estrutura Base do Projeto - Fase 1
| Item | Detalhamento | Critério de Pronto |
|---|---|---|
| Inicialização | `composer create-project` / `npm create` / `pip install` | Projeto roda (`php artisan serve` / `npm run dev`) |
| Pastas base | Conforme seção 5 | Estrutura existe e é navegável |
| Configuração `.env` | Variáveis obrigatórias documentadas | `.env.example` completo |
| `.gitignore` | Segredos, logs, dumps, node_modules, vendor, build | Git limpo, sem lixo |
| `.gitattributes` | line endings, linguagens, diff drivers | Padronizado |
| README inicial | Como rodar, testar, buildar | Novo dev onboards em < 10 min |
| Lint/Format config | Conforme stack | `lint` e `format` passam |
| CI pipeline | GitHub Actions: lint + test + build | Pipeline verde no primeiro push |

---

## 8. Banco de Dados e Migrations - Fase 2
### 8.1 Tabelas / Entidades
| Tabela | Campos (tipo, constraints) | Índices / FKs | Soft Delete | Auditoria |
|---|---|---|---|---|
| <ex.: users> | id (PK), name, email (unique), password, role, company_id (FK), timestamps, deleted_at | idx_email, fk_company | ✅ | ✅ |

### 8.2 Migrations (ordem de execução)
1. <migration_1>
2. <migration_2>
...

### 8.3 Seeders (dados iniciais obrigatórios)
- <ex.: Perfis/Roles, Admin inicial, Configurações globais>

### 8.4 Factories (para testes)
- <ex.: UserFactory, CompanyFactory, ...>

---

## 9. Autenticação e Controle de Acesso - Fase 3
| Componente | Implementação | Critério de Pronto |
|---|---|---|
| Login | Email + senha, rate limit, remember me | Login/logout funcionam, sessão persiste |
| Registro (se houver) | Validação, email único, senha forte | Usuário criado, email verificado (se aplicável) |
| Recuperação senha | Token expiração 1h, email enviado | Fluxo completo funciona |
| 2FA (se houver) | TOTP / SMS / Email | Ativação/validação ok |
| Perfis/Permissões | RBAC: <lista perfis + permissões> | Middleware/policies bloqueiam acesso indevido |
| Middleware auth | Rotas protegidas redirecionam para login | Testado: rota privada → login → volta |
| Sessão | Timeout configurável, renovação | Sessão expira, renova em atividade |

---

## 10. Recursos Estruturais - Fase 4
| Recurso | Descrição | Onde fica | Critério de Pronto |
|---|---|---|---|
| Layout base | Header, footer, sidebar, flash messages | `resources/views/layouts/` | Todas as páginas usam |
| Menu navegação | Itens por perfil, responsivo | Componente reutilizável | Mobile hamburger, desktop expandido |
| Dashboard | Cards KPI, atalhos, gráficos | `resources/views/dashboard/` | Dados reais, loading states |
| Breadcrumbs | Automático por rota | Helper/Componente | Funciona em rotas aninhadas |
| Paginação | Componente padrão, preserva filtros | Componente reutilizável | Testado com 1, 10, 100+ itens |
| Busca global | Header/topbar, debounce | Componente | Resultados em < 300ms |
| Notificações | Toast + centro notificações | Service + Componente | Tempo real / polling configurável |
| Modais | Confirm, Form, Info | Componente base | Acessível (ESC, foco, ARIA) |
| Tabelas | Sort, filter, pagination, actions | Componente base | Responsivo (cards no mobile) |
| Formulários | Validação client+server, mensagens | Componente base | Erros inline, success toast |

---

## 11. Entidades Principais - Fase 5
Para cada entidade principal (ex.: Cliente, Produto, Ordem, Fatura):

| Entidade | Campos | Regras de negócio | Validações | Relacionamentos |
|---|---|---|---|---|
| <Cliente> | nome, cpf/cnpj, email, telefone, endereco, company_id | CPF/CNPJ único por company, email único | required, unique, format | 1:N Enderecos, 1:N Contatos, N:M Tags |

### 11.1 Models / ORM
- <ex.: `app/Models/Cliente.php` com fills, casts, relationships, scopes>

### 11.2 Repositories / Services (se aplicável)
- <ex.: `ClienteService` com `create`, `update`, `delete`, `list`, `export`>

---

## 12. CRUDs - Fase 6
Para cada entidade com CRUD:

| Entidade | Create | Read (List/Show) | Update | Delete (Soft) | Filtros/Busca | Exportar |
|---|---|---|---|---|---|---|
| <Cliente> | Modal/Page | Tabela + Detalhe | Modal/Page | Botão confirm | nome, cpf, status | CSV/PDF |

### 12.1 Padrão de implementação por CRUD
- **Controller:** Resource controller (`index`, `create`, `store`, `show`, `edit`, `update`, `destroy`)
- **Requests:** `StoreClienteRequest`, `UpdateClienteRequest` (validação separada)
- **Resources/API:** `ClienteResource` (transformação consistente)
- **Testes:** Feature tests para cada ação + edge cases

---

## 13. Fluxos Principais - Fase 7
| Fluxo | Ator | Passos (resumo) | Regras críticas | Tela(s) envolvidas |
|---|---|---|---|---|
| <Nova venda> | Vendedor | 1. Seleciona cliente 2. Adiciona itens 3. Define pagamento 4. Confirma | Estoque reservado, comissão calculada | PDV, Seleção cliente, Confirmação |

---

## 14. Relatórios e Consultas - Fase 8
| Relatório | Filtros | Colunas | Agrupamentos | Exportar | Performance |
|---|---|---|---|---|---|
| <Vendas por período> | data_inicio, data_fim, vendedor, status | data, cliente, valor, status | dia/semana/mês | CSV, PDF | Índice em created_at + company_id |

---

## 15. Uploads - Fase 9 (se existirem)
| Tipo | Extensões permitidas | Tamanho máx. | Armazenamento | Processamento | Segurança |
|---|---|---|---|---|---|
| <Anexos cliente> | pdf, jpg, png, docx | 10MB | S3/MinIO/local `storage/app/private` | Thumbnail se imagem, OCR se pdf | MIME real, scan vírus, nome aleatório |

---

## 16. Exportações - Fase 10 (se existirem)
| Exportação | Formato | Filtros | Colunas | Agendamento | Critério |
|---|---|---|---|---|---|
| <Clientes ativos> | CSV, XLSX | status, empresa | todos campos | Sob demanda / Diário 06h | < 30s para 10k linhas |

---

## 17. APIs e Integrações - Fase 11 (se existirem)
| Integração | Tipo | Autenticação | Endpoints usados | Rate limit | Tratamento erro |
|---|---|---|---|---|---|
| <WhatsApp Business> | Webhook + REST | Bearer token | `/messages`, `/webhook` | 80/s | Retry 3x, dead letter queue |

---

## 18. Logs e Contingência - Fase 12
| Tipo | Destino | Retenção | Alerta | Detalhes |
|---|---|---|---|---|
| Erros aplicação | Banco (`error_logs`) + arquivo | 90 dias | Slack/Email se CRITICAL | exception, trace, user_id, url, context |
| Auditoria | Banco (`audits`) | 1 ano | — | user_id, action, model, old/new, ip |
| Acesso / Segurança | Arquivo (`storage/logs/access.log`) | 30 dias | Falhas login > 5/min | ip, user_agent, rota, status |
| Jobs/Queue | Banco (`failed_jobs`) | 7 dias | Slack se > 10 falhas/hora | payload, exception, attempts |

---

## 19. Revisão de Segurança - Fase 13
**Executar APÓS todas as fases de construção, ANTES da documentação final.**
Checklist (Passo 5 - `references/codificacao-etapas.md`):
- [ ] SQL Injection (params bound, sem raw SQL com input)
- [ ] XSS (escape output, CSP, sanitize input rico)
- [ ] CSRF (tokens forms, SameSite cookies)
- [ ] Hash senhas (bcrypt/argon2, nunca plain/text)
- [ ] Auth/Session (expiração, rotação, secure flags)
- [ ] RBAC (policies em controllers/routes, testes negativos)
- [ ] Isolamento dados (company_id/tenant_id em TODAS queries)
- [ ] Arquivos sensíveis (`.env`, chaves, certificados fora de public/)
- [ ] Env vars (produção só via Secrets, nunca no código)
- [ ] Error messages (amigáveis usuário, stack trace só log)
- [ ] Logs protegidos (sem PII, senhas, tokens em log)
- [ ] Input validation (allowlist, tipos, tamanhos, formatos)
- [ ] Output sanitization (encode context: HTML, JS, SQL, URL)
- [ ] Uploads (MIME real, extensão, tamanho, storage privado, scan)
- [ ] APIs externas (timeout, validação resposta, secrets rotacionados)
- [ ] Secrets/Keys (rotação, escopo mínimo, não em repo)
- [ ] Rotas internas (protegidas por auth + permissão, sem enumeração)
- [ ] FSD/CLAUDE.md rules têm prioridade sobre defaults

---

## 20. Revisão de Qualidade - Fase 14
| Critério | Ferramenta/Comando | Threshold | Status |
|---|---|---|---|
| Lint | `npm run lint` / `./vendor/bin/pint` | 0 erros | ⏳ |
| Type check | `tsc --noEmit` / `phpstan analyse` | 0 erros | ⏳ |
| Testes unitários | `npm test` / `./vendor/bin/pest` | 100% pass | ⏳ |
| Testes feature | `./vendor/bin/pest --filter=Feature` | 100% pass | ⏳ |
| Cobertura | `--coverage` | > 80% linhas críticas | ⏳ |
| Build | `npm run build` / `composer install --no-dev` | Success | ⏳ |
| Acessibilidade | `axe-core` / manual WCAG 2.1 AA | 0 violações críticas | ⏳ |
| Performance | Lighthouse / Web Vitals | LCP < 2.5s, CLS < 0.1 | ⏳ |

---

## 21. Documentação e Entrega - Fase 15
- [ ] `docs/STATUS.md` = 100% concluído (todas as fases)
- [ ] `docs/ERROS.md` = atualizado com todos os erros (mesmo corrigidos)
- [ ] Arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) em **modo manutenção** (Passo 6)
- [ ] `docs/MANUTENCAO.md` e `docs/COMO-PEDIR-MUDANCAS.md` criados
- [ ] Variáveis de produção documentadas em `.env.example` (sem valores reais)

---

## 22. Checklist de Prontidão Técnica por Fase
*Extraído do FSD para o `docs/PLANO.md` — cada fase tem seus critérios.*

| Fase | Critérios de Pronto (obrigatórios para marcar concluída) |
|---|---|
| 1 - Estrutura Base | Projeto roda, lint/build/test passam, CI verde, `.env.example` completo |
| 2 - Banco | Migrations rodam limpo, seeders populam, factories funcionam, rollback ok |
| 3 - Auth | Login/logout/registro/recuperação/2FA testados, middleware bloqueia rotas privadas |
| 4 - Recursos Estruturais | Layout, menu, dashboard, componentes base funcionam em mobile/desktop |
| 5 - Entidades | Models, relationships, scopes, services, testes unitários passam |
| 6 - CRUDs | Create/Read/Update/Delete + filtros + export por entidade, testes feature passam |
| 7 - Fluxos Principais | Cada fluxo E2E testado (automatizado + manual), regras de negócio validadas |
| 8 - Relatórios | Geração correta, filtros, export, performance < threshold |
| 9 - Uploads | Upload/download/delete, validações, segurança, thumbnails/OCR |
| 10 - Exportações | Formatos, agendamento, performance, grandes volumes |
| 11 - APIs/Integrações | Contrato cumprido, retry, dead letter, monitoramento, testes de contrato |
| 12 - Logs/Contingência | Erros/auditoria/acesso/jobs logados, alertas funcionam, retenção ok |
| 13 - Segurança | Checklist Passo 5 = 100% ok, achados corrigidos ou aceitos com justificativa |
| 14 - Qualidade | Lint/Type/Tests/Build/Cobertura/A11y/Perf = thresholds atendidos |
| 15 - Entrega | Documentação de manutenção completa, variáveis de produção listadas |

---

## 23. Checklist de Qualidade por Fase
*Executar APÓS implementar cada fase, ANTES de marcar concluída no STATUS.md.*

| Verificação | Comando / Ação | Fase(s) |
|---|---|---|
| Lint zero erros | `npm run lint` / `./vendor/bin/pint --test` | Todas |
| Type check zero erros | `tsc --noEmit` / `phpstan analyse --level=5` | Todas |
| Testes passam | `npm test` / `./vendor/bin/pest` | 2-14 |
| Build success | `npm run build` / `composer install --no-dev` | 1, 15 |
| Servidor sobe local | `php artisan serve` / `npm run dev` | 1, 3-14 |
| Validação visual (se UI) | Screenshot + comparação DESIGN.md | 4, 6, 7, 10 |
| Responsividade | Chrome DevTools device toolbar (mobile/tablet/desktop) | 4, 6, 7 |
| Acessibilidade básica | Tab navigation, labels, contrastes, ARIA | 4, 6, 7 |
| Segurança fase | Checklist relevante do Passo 5 | 3, 5, 6, 7, 9, 11, 13 |
| Registrar ERROS.md | Todo erro (mesmo corrigido) | Todas |
| Atualizar STATUS.md | Fase, arquivos, testes, data, próxima | Todas |
| Commit claro | `Fase X: <resumo>` | Todas |

---

## 24. Checklist de Entrega
*Executar ANTES de entregar o sistema para ser publicado.*

- [ ] Todas as fases do PLANO.md = ✅ Concluída
- [ ] Revisão de Segurança (Fase 13) = 100% ok
- [ ] Revisão de Qualidade (Fase 14) = thresholds atendidos
- [ ] Documentação e Entrega (Fase 15) = 100% ok
- [ ] Arquivo de contexto em modo manutenção
- [ ] Checklist humano entregue ao cliente (o que testar + como)
- [ ] Rollback plan documentado (código + banco)

---

## 25. Regras de Segurança
*Consolidado do FSD para referência rápida durante codificação.*

1. **Nunca** confiar em input do usuário — validar SEMPRE (allowlist).
2. **Nunca** concatenar SQL — usar query builder/ORM com bindings.
3. **Nunca** exibir erro técnico ao usuário — log técnico, mensagem amigável.
4. **Sempre** hashear senhas (bcrypt/argon2) — nunca armazenar/plain text.
5. **Sempre** verificar permissão (policy/gate) ANTES de ação sensível.
6. **Sempre** filtrar por `company_id` / `tenant_id` em queries multi-tenant.
7. **Sempre** usar soft delete em entidades sensíveis.
8. **Sempre** auditar ações sensíveis (create/update/delete/login/export).
9. **Sempre** validar MIME real + extensão + tamanho em uploads.
10. **Sempre** armazenar uploads fora de `public/` (storage privado / S3).
11. **Sempre** sanitizar saída conforme contexto (HTML, JS, URL, SQL).
12. **Sempre** usar HTTPS em produção (HSTS, Secure cookies).
13. **Sempre** rate limiting em auth, APIs, formulários sensíveis.
14. **Sempre** rotacionar secrets periodicamente, escopo mínimo.
15. **Sempre** consultar `docs/ERROS.md` antes de corrigir erro semelhante.

---

## 26. Critérios de Aceitação Técnica e Funcional
*Derivados do PRD (seção Critérios de Aceitação) + FSD.*

| ID | Critério | Tipo | Como validar | Fase |
|---|---|---|---|---|
| CA-01 | Login com email/senha válidos redireciona para dashboard | Funcional | Teste automatizado + manual | 3 |
| CA-02 | Usuário sem permissão não acessa rota admin | Técnico | Teste feature (negativo) | 3 |
| CA-03 | CPF/CNPJ duplicado na mesma empresa bloqueia cadastro | Funcional | Teste unitário + feature | 5 |
| CA-04 | Relatório de vendas exporta CSV correto com 10k linhas < 30s | Técnico | Teste performance | 8 |
| CA-05 | Upload PDF > 10MB rejeitado com mensagem amigável | Funcional | Teste manual + automatizado | 9 |

---

## 27. Pontos Pendentes e Decisões Futuras
| Item | Descrição | Decisão necessária | Prazo / Blocker |
|---|---|---|---|
| <ex.: Pagamento recorrente> | Gateway não definido | Escolher: Stripe / Mercado Pago / Asaas | Antes Fase 11 |
| <ex.: App mobile> | React Native vs Flutter | Decidir stack mobile | Pós-v1 |

---

## 28. Conclusão
<Resumo final: sistema pronto para construção incremental, fases bem definidas, stack travada, decisões documentadas, validação aprovada. Próximo passo: executar `docs/PLANO.md` fase a fase.>

---

> **IMPORTANTE:** Este FSD deve passar pela **Validação (Passo 6)** antes de qualquer codificação. Use o prompt em `references/analise-docs.md` → "PROMPT — Validação do FSD (Passo 6)". Relatório deve conter: Resumo, Problemas Críticos, Problemas Importantes, Melhorias Recomendadas, Verificação Cobertura PRD, Verificação Decisões Técnicas, Verificação Design, Conclusão Final.