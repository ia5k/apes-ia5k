# PLANO — Plano de Desenvolvimento em Etapas

> **Projeto:** <nome>
> **Última atualização:** <data>
> **Base:** `docs/FSD.md` (Seção 22 - Checklist de Prontidão Técnica por Fase)

---

## Regras Obrigatórias de Execução

1. **Uma fase por chat** — Cada execução do Prompt 04 (Codificar em etapas) constrói **exatamente uma fase**.
2. **Ordem fixa** — Seguir a numeração abaixo (extraída do FSD). Não pular, não reordenar.
3. **Validação antes de avançar** — Fase só é ✅ Concluída se **todos** os critérios da seção "Critérios de Pronto" forem atendidos + testes automatizados passarem + validação visual (se UI) + STATUS/ERROS atualizados + commit.
4. **Checklists obrigatórios** — Ao fim de cada fase, entregar:
   - Checklist 1: O que foi implementado (linguagem leiga)
   - Checklist 2: O que testar e como testar (ação → resultado; comandos)
   - Checklist 3: Regressão (o que não pode quebrar)
5. **Próxima fase = chat novo** com mesmo Prompt 04.

---

## Etapas do Desenvolvimento (Extraídas do FSD Seção 22)

| # | Fase | Objetivo (leigo) | Critérios de Pronto (resumo) | Status |
|---|---|---|---|---|
| 1 | **Estrutura Base do Projeto** | Criar a base do projeto: pastas, config, lint, CI, Git | Projeto roda (`serve`/`dev`), lint/build/test passam, CI verde, `.env.example` completo, GitHub conectado | ⬜ |
| 2 | **Banco de Dados e Migrations** | Criar tabelas, seeds, factories | Migrations rodam limpo (up/down), seeders populam, factories funcionam, rollback ok | ⬜ |
| 3 | **Autenticação e Controle de Acesso** | Login, logout, registro, recuperação, 2FA, perfis, middleware | Login/logout/registro/recuperação/2FA testados, middleware bloqueia rotas privadas, RBAC funciona | ⬜ |
| 4 | **Recursos Estruturais (UI Base)** | Layout, menu, dashboard, componentes base (tabelas, forms, modais, notificações) | Layout/menu/dashboard funcionam mobile/desktop, componentes reutilizáveis testados, validação visual OK | ⬜ |
| 5 | **Entidades Principais** | Models, relationships, scopes, services das entidades core | Models + relationships + scopes + services + testes unitários passam | ⬜ |
| 6 | **CRUDs das Entidades** | Create/Read/Update/Delete + filtros + export por entidade | CRUDs completos por entidade, testes feature passam, validação visual OK | ⬜ |
| 7 | **Fluxos Principais** | Implementar cada fluxo de negócio E2E | Cada fluxo testado (automatizado + manual), regras de negócio validadas | ⬜ |
| 8 | **Relatórios e Consultas** | Geração, filtros, export, performance | Relatórios corretos, export CSV/PDF, performance < threshold | ⬜ |
| 9 | **Uploads** (se houver) | Upload/download/delete, validações, segurança | Upload/download/delete funcionam, MIME/tamanho validados, storage privado, thumbnails/OCR | ⬜ |
| 10 | **Exportações** (se houver) | Formatos, agendamento, performance | Exportações corretas, agendamento funciona, grandes volumes < threshold | ⬜ |
| 11 | **APIs e Integrações** (se houver) | Contrato, retry, dead letter, monitoramento | Integração cumpre contrato, retry/DLQ funcionam, testes de contrato passam | ⬜ |
| 12 | **Logs e Contingência** | Erros, auditoria, acesso, jobs logados + alertas | Logs gravados corretamente, alertas disparam, retenção configurada | ⬜ |
| 13 | **Revisão de Segurança** | Checklist completo Passo 5 | 100% checklist OK, achados corrigidos ou aceitos com justificativa documentada | ⬜ |
| 14 | **Revisão de Qualidade** | Lint, Type, Tests, Build, Cobertura, A11y, Perf | Todos thresholds atendidos (ver FSD Seção 20) | ⬜ |
| 15 | **Documentação e Entrega** | Documentação de manutenção, guia de pedidos de mudança, variáveis de produção listadas | Arquivo de contexto em modo manutenção, `docs/MANUTENCAO.md` e `docs/COMO-PEDIR-MUDANCAS.md` criados, `.env.example` completo | ⬜ |

---

## Dependências entre Fases

```
Fase 1 (Estrutura)
    │
    ├─── Fase 2 (Banco) ──────────────────┐
    │                                     │
    ├─── Fase 3 (Auth) ◄──────────────────┤
    │           │                         │
    │           ▼                         │
    ├─── Fase 4 (UI Base) ────────────────┤
    │           │                         │
    │           ▼                         │
    ├─── Fase 5 (Entidades) ──────────────┤
    │           │                         │
    │           ▼                         │
    ├─── Fase 6 (CRUDs) ──────────────────┤
    │           │                         │
    │           ▼                         │
    ├─── Fase 7 (Fluxos) ─────────────────┤
    │           │                         │
    │           ├─── Fase 8 (Relatórios) ─┤
    │           ├─── Fase 9 (Uploads) ────┤
    │           ├─── Fase 10 (Exports) ───┤
    │           └─── Fase 11 (APIs) ──────┤
    │                                     │
    └─────────────────────────────────────┘
                        │
                        ▼
               Fase 12 (Logs/Contingência)
                        │
                        ▼
               Fase 13 (Segurança)  ◄── OBRIGATÓRIA antes de 14/15
                        │
                        ▼
               Fase 14 (Qualidade)
                        │
                        ▼
               Fase 15 (Documentação e Entrega)
```

---

## Modelo de Registro no STATUS.md (por fase)

```markdown
## Fase X: <Nome da Fase> — <data>
**Status:** ✅ Concluída / 🔄 Em andamento / ❌ Bloqueada

### Arquivos alterados/criados
- `caminho/arquivo.ext` — <breve descrição>

### Testes executados
| Tipo | Comando | Resultado |
|---|---|---|
| Lint | `npm run lint` | ✅ 0 erros |
| Type check | `tsc --noEmit` | ✅ 0 erros |
| Unitários | `npm test` | ✅ 42/42 pass |
| Feature | `npm run test:feature` | ✅ 18/18 pass |
| Build | `npm run build` | ✅ Success |
| Servidor local | `npm run dev` | ✅ Rodando em localhost:3000 |
| Visual (se UI) | Screenshot + DESIGN.md | ✅ Conforme |

### Validação Visual (se aplicável)
- Screenshot salvo em: `docs/screenshots/fase-X-<nome>.png`
- Responsividade: Mobile ✅ / Tablet ✅ / Desktop ✅
- Acessibilidade básica: Tab nav ✅ / Labels ✅ / Contraste ✅ / ARIA ✅

### Erros registrados (ver ERROS.md)
- ERRO-XXX: <resumo>

### Checklist de Pronto (FSD Seção 22)
- [ ] Critério 1
- [ ] Critério 2
- [ ] ...

### Próxima fase
Fase X+1: <Nome>
```

---

## Ordem de Execução no Chat

**Para iniciar cada fase:**
1. Ler `docs/PLANO.md` → identificar próxima fase ⬜
2. Ler `docs/STATUS.md` → confirmar fase anterior ✅
3. Ler `docs/FSD.md` → seção correspondente à fase
4. Ler `docs/DESIGN.md` (se fase tem UI)
5. Ler `CLAUDE.md` → stack, regras, comandos
6. Executar Prompt 04 (Codificar em etapas) para **essa fase apenas**
7. Ao terminar: atualizar STATUS, ERROS, commit, entregar checklists, **parar**
8. Próxima fase = **novo chat** com mesmo Prompt 04

---

## Comandos de Referência Rápida

| Ação | Comando (exemplo Laravel) | Comando (exemplo Next.js) |
|---|---|---|
| Instalar deps | `composer install` | `npm ci` |
| Rodar local | `php artisan serve` | `npm run dev` |
| Lint | `./vendor/bin/pint --test` | `npm run lint` |
| Type check | `phpstan analyse --level=5` | `tsc --noEmit` |
| Testes | `./vendor/bin/pest` | `npm test` |
| Build | `composer install --no-dev` | `npm run build` |
| Migrations | `php artisan migrate --seed` | `npx prisma migrate dev` |
| Screenshot (Playwright) | `npx playwright test --project=chromium` | `npx playwright test --project=chromium` |

> **Adapte** os comandos acima à stack definida no FSD/DECISOES_TECNICAS. Registre os comandos reais no `CLAUDE.md` (modo construção → manutenção).