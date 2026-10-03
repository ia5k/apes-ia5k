# DECISOES_TECNICAS — Decisões Técnicas do Projeto

> **Projeto:** <nome>
> **Versão:** 0.1
> **Última atualização:** <data>
> **Status:** ⏳ Em elaboração / ✅ Definido
> **Base:** `PRD.md` + `docs/DESIGN.md`

---

## 16 Seções Obrigatórias
*Preencha todas. Se não souber, pergunte ao usuário. Use defaults do vocabulário apenas quando usuário não souber.*

| # | Decisão | Escolha | Justificativa / Detalhes |
|---|---|---|---|
| 1 | **Linguagem / Framework** | <ex.: PHP 8.3 + Laravel 11 / TypeScript + Next.js 14 / Python 3.12 + FastAPI> | <por quê: equipe, ecossistema, requisitos> |
| 2 | **Banco de Dados** | <ex.: MySQL 8 / PostgreSQL 15 / SQLite (dev)> | <por quê: ACID, JSON, full-text, custo> |
| 3 | **Desenvolvimento Local** | <ex.: Docker Compose / Laravel Sail / Docker / XAMPP / nativo> | <reprodutibilidade, paridade com produção> |
| 4 | **Hospedagem (Produção)** | <ex.: VPS / Vercel / AWS / DigitalOcean> | <custo, stack, DNS, SSL, backup> |
| 5 | **Organização de Pastas / Bootstrap** | <ex.: MVC padrão Laravel / Feature-based Next.js / Clean Architecture> | <estrutura definida no FSD Seção 5> |
| 6 | **Login / Autenticação** | <ex.: Email+senha (bcrypt/argon2), 2FA opcional, remember token, JWT se API> | <fluxo: login → dashboard, recuperação, expiração> |
| 7 | **Perfis de Usuário (RBAC)** | <ex.: Admin / Gestor / Operador / Cliente — permissões por policy/gate> | <matriz de permissões por recurso/ação> |
| 8 | **Auditoria** | <ex.: Sim — tabela `audits` (user_id, action, model, old/new, ip, ua, created_at)> | <quais ações: create/update/delete/login/export/print> |
| 9 | **Soft Delete (Exclusão Lógica)** | <ex.: Sim — `deleted_at` em todas entidades sensíveis, unique indexes com whereNull> | <recuperação, integridade referencial> |
| 10 | **Logs / Erros em Banco** | <ex.: Sim — tabela `error_logs` (exception, trace, user_id, url, context, severity, created_at)> | <retenção 90 dias, alerta Slack/Email se CRITICAL> |
| 11 | **Contingência de Erros Críticos em Arquivo** | <ex.: Sim — `storage/logs/critical.log` rotacionado diário, retenção 30 dias> | <fallback se banco indisponível> |
| 12 | **Uploads** | <ex.: Sim — S3/MinIO / local `storage/app/private`, MIME+ext validados, max 10MB, scan vírus> | <thumbnails imagens, OCR PDFs, nomes aleatórios> |
| 13 | **Exportações** | <ex.: Sim — CSV, XLSX, PDF; sob demanda + agendado (cron 06h); queue para >1k linhas> | <streaming para memória, headers UTF-8 BOM> |
| 14 | **APIs / Integrações Externas** | <ex.: WhatsApp Business (webhook+REST), Stripe, Correios — timeout 10s, retry 3x, DLQ> | <rate limits, secrets rotacionados, contratos versionados> |
| 15 | **Configurações Globais** | <ex.: Tabela `settings` (key, value, type, group), cache 1h, painel admin para editar> | <ex.: empresa_nome, smtp_*, paginacao_padrao, moeda> |
| 16 | **Outras Decisões** | <livre — ex.: fuso horário, locale, moeda, timezone BD, SSL, CDN, WebSockets> | <tudo que não couber acima> |

---

## Perguntas Ainda em Aberto
> IA deve perguntar ao usuário o que não estiver definido aqui. Não inventar.

- [ ] <pergunta técnica pendente 1>
- [ ] <pergunta técnica pendente 2>
- [ ] ...

---

## Validação Cruzada (Preencher após FSD)
- [ ] Todas as 16 decisões estão definidas (sem lacunas para IA "inventar")
- [ ] Decisões são coerentes com PRD (funcionalidades viáveis)
- [ ] Decisões são coerentes com DESIGN.md (stack suporta UI requerida)
- [ ] Decisões são coerentes entre si (ex.: hospedagem suporta linguagem/banco)

---

> **Regra:** Este documento deve estar **100% preenchido** antes de criar o FSD. O FSD consome estas decisões — se faltar algo, a IA vai inventar.