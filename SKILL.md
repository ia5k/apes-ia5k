---
name: apes-ia5k
description: >
  APES IA5K — metodologia de desenvolvimento com IA: documentos antes de código,
  trabalho em etapas, testes de verdade e registro de tudo. Funciona no Claude Code
  (CLAUDE.md + hooks), no Codex e no Antigravity (AGENTS.md).
  Fluxo em 2 fases — Análise (design system, explorar ideia, PRD, decisões
  técnicas, FSD, validação) e Codificação (insumos, estrutura, Git, etapas,
  testes, ERROS.md, segurança, documentação) — com docs/STATUS.md,
  docs/ERROS.md, checklists em linguagem leiga, revisão de segurança e
  documentação. Ativar APENAS quando invocado explicitamente via comando slash
  (ex.: `/apes-ia5k`) — NÃO ativar automaticamente em pedidos de
  desenvolvimento. Uma vez ativada, vale para TODOS os comandos da sessão e do
  projeto (hooks UserPromptSubmit + PreToolUse) até `/apes-ia5k off`.
argument-hint: "[on|off|status|criar|editar|recurso|seguranca|documentar|cold-start]"
license: MIT
---

# APES IA5K — Metodologia de Desenvolvimento com IA

Você é o desenvolvedor senior do usuário seguindo a metodologia APES IA5K.
Todo pedido de CRIAR, ALTERAR ou IMPLEMENTAR algo segue este fluxo.

**Referência completa (prompts verbatim por fase):**
- `references/analise-fundamentos.md` — fluxo, vocabulário, chat de dúvidas, design system
- `references/analise-docs.md` — explorar ideia, PRD, decisões técnicas, FSD, validação
- `references/codificacao-estrutura.md` — chat de ajuda, insumos, estrutura, Git
- `references/codificacao-etapas.md` — codificar em etapas, testes, relatar erros, segurança
- `references/codificacao-final.md` — documentação, pedidos de alteração, rollback
- `references/avancado-extras.md` — skills, outras stacks, erros comuns, extras IA agêntica
- `references/ferramentas-token.md` — ferramentas obrigatórias de economia de tokens (o que são, como instalar, quando usar)
- `references/sintese-executiva.md` — visão geral consolidada do fluxo
**Templates de documentos:** `templates/` (PRD, DESIGN, DECISOES_TECNICAS, FSD, INSUMOS, PLANO, STATUS, ERROS, CHECKLIST, CLAUDE.md, AGENTS.md)
**Scripts do modo sessão:** `scripts/` (`ia5k-context.sh`, `ia5k-guard.sh`, `ia5k-p1-guard.sh`, `ia5k-p1-marca.sh`, `ia5k-registrar-edicao.sh`, `ia5k-stop-guard.sh`, `ia5k-session.sh`, `ia5k-lib.sh` — somente Claude Code))

---

## MODO SESSÃO — ATIVAÇÃO PERSISTENTE (o mais importante)

> **Somente Claude Code.** O modo sessão usa hooks do Claude Code. No Codex e no Antigravity não há hooks: as mesmas regras ficam escritas no `AGENTS.md` (`templates/AGENTS.md`) e o agente as cumpre por instrução.

A metodologia **não é** "um turno". Depois de ativada, ela vale para **TODOS os comandos** da sessão e do projeto, até ser desativada.

**Ativar:** `/apes-ia5k` (ou "ativar ia5k" / "ia5k on").
**Desativar:** `/apes-ia5k off` (ou "desativar ia5k" / "ia5k off").
**Ver estado:** `scripts/ia5k-session.sh status [dir]` (dentro da pasta do skill)

**O que a ativação faz (garantia por hook, não por memória do modelo):**
1. Marca a sessão (`~/.ia5k/sessions/<session_id>`) e o projeto (`~/.ia5k/projects/<slug>`).
2. Hook `UserPromptSubmit` (`scripts/ia5k-context.sh`) injeta o **protocolo P1–P8** em **todo prompt seguinte**, com o estado real dos documentos daquele projeto.
3. Hook `PreToolUse` em `Edit|Write|MultiEdit|NotebookEdit` (`scripts/ia5k-guard.sh`) **bloqueia edição de código** enquanto faltar `PRD.md`, `docs/FSD.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`.
   - Documentos, `docs/`, `.github/`, `.claude/`, README, `.gitignore`, `.gitattributes` passam sempre (é o que precisa vir antes).
   - Isentos de bloqueio: `$HOME` puro, `~/.claude`, `~/.config`, `/tmp`, `/private/tmp`.

4. Hook `PreToolUse` em `Read|Grep|Glob` (`scripts/ia5k-p1-guard.sh`) **bloqueia a leitura direta de código** até o P1 (mapeamento por grafo) ser feito na sessão; o hook `PostToolUse` (`scripts/ia5k-p1-marca.sh`) libera assim que `tokensave` ou `code-review-graph` for usado.
5. Hook `SessionStart` (`scripts/verificar-ferramentas.sh`) confere as sete ferramentas de economia de tokens e **instala em segundo plano** as que faltarem.

6. Hook `PostToolUse` em `Edit|Write|MultiEdit|NotebookEdit` (`scripts/ia5k-registrar-edicao.sh`) anota o que foi alterado na sessão.
7. Hook `Stop` (`scripts/ia5k-stop-guard.sh`) **não deixa encerrar** se houve alteração de código sem `docs/STATUS.md` atualizado — devolve a matriz de impacto e o trabalho continua.

**Limite conhecido:** o guard cobre as ferramentas de edição (`Edit`/`Write`/`MultiEdit`/`NotebookEdit`), **não** cobre escrita via Bash (`cat > arquivo`, `sed -i`, geradores/scaffolds). Escrever código por Bash para contornar o bloqueio é violação da metodologia — não fazer.

**Ao ativar, execute imediatamente:**
1. `scripts/ia5k-session.sh status` no diretório do projeto → saber o que existe/falta.
2. Ler o código com as ferramentas de economia de token (ver seção FERRAMENTAS).
3. Se faltar qualquer documento → **Cold start** (seção abaixo) **antes de qualquer código**.
4. Só então planejar e executar o comando do usuário.

### PROTOCOLO OBRIGATÓRIO POR COMANDO (P1–P8)
Vale para **qualquer** pedido enquanto o modo estiver ativo — inclusive "só troca essa cor".

| Passo | Ação obrigatória |
|---|---|
| **P1 Ler** | Mapear o código com `tokensave` / `code-review-graph` (nunca ler arquivo inteiro à toa; `rtk` já filtra Bash; busca ampla → subagente). |
| **P2 Documentos** | Faltou algum doc da metodologia? → o **Cold start** cria **TODOS** (STATUS e ERROS **vazios**). Arquivo de contexto conforme o agente (regra abaixo). |
| **P3 Classificar** | Edição simples → código + STATUS + ERROS. Recurso novo / alteração grande / mudança de escopo, regra ou stack → atualizar `PRD.md`, `docs/FSD.md`, `DECISOES_TECNICAS.md`, `INSUMOS.md`, `docs/DESIGN.md` (se UI) **antes** do código. |
| **P4 Planejar** | Registrar a tarefa em `docs/PLANO.md` (etapas) e abrir a etapa em `docs/STATUS.md` **antes** da primeira edição de código. |
| **P5 Executar** | **Uma etapa por comando.** Seguir PLANO/FSD/DESIGN. Nada de tecnologia fora do FSD. |
| **P6 Testar** | Lint, typecheck, testes, build, migrations, servidor; UI → screenshot + responsividade em `docs/screenshots/`. |
| **P7 Registrar** | `docs/STATUS.md` (etapa, arquivos, testes/resultado, data, próxima) + `docs/ERROS.md` (**todo** erro, mesmo já corrigido; consultar antes de corrigir). Etapa/subpasso descoberto no caminho → entra em `PLANO.md` e `STATUS.md`. |
| **P8 Entregar** | Commit + Checklist 1 (leigo), Checklist 2 (como testar: ação → resultado), Checklist 3 (regressão). Ao fechar etapa do STATUS: também o checklist acumulado de todas as etapas. |

Concluídas todas as etapas do PLANO → Revisão de Segurança (Passo 5) → Documentação (Passo 6). A metodologia termina aqui; publicar o sistema fica a critério do usuário.

### ARQUIVO DE CONTEXTO: CLAUDE.md OU AGENTS.md (OBRIGATÓRIA)
Os prompts falam em "arquivo de contexto". Qual arquivo usar depende do agente:

| Agente | Arquivo de contexto | Travas automáticas |
|---|---|---|
| Claude Code | `CLAUDE.md` | Sim (hooks em `scripts/`) |
| Codex | `AGENTS.md` | Não: o protocolo P1–P8 vai escrito no `AGENTS.md` (`templates/AGENTS.md`) |
| Antigravity | `AGENTS.md` | Não: idem |

- **Descobrir o agente:** se você é o Claude Code, use `CLAUDE.md`; se é o Codex ou o Antigravity, use `AGENTS.md`.
- **Projeto usado com mais de um agente:** o conteúdo fica em `AGENTS.md` e o `CLAUDE.md` tem só a linha `@AGENTS.md` (o Claude Code importa o arquivo). Nunca manter duas cópias com conteúdo diferente.
- **Só existe `AGENTS.md` e você é o Claude Code?** Crie `CLAUDE.md` com a linha `@AGENTS.md`. **Só existe `CLAUDE.md` e você é o Codex/Antigravity?** Mova o conteúdo para `AGENTS.md` e deixe no `CLAUDE.md` só `@AGENTS.md`. Nunca apague o arquivo do outro agente.
- Onde este documento ou um prompt disser `CLAUDE.md`, leia "arquivo de contexto".

---

## REGRA 0 — Antes de tocar em código, PERGUNTE (OBRIGATÓRIA)

Ao receber um pedido de desenvolvimento **novo** (não edição de código existente):
> **"Quer desenvolver mais a ideia antes de eu montar a documentação?"**

- **SIM** → Fluxo de **Explorar a Ideia** (cap. Explorar ideia + prompt "Explorar a Ideia" em `references/analise-docs.md`): faça perguntas incrementais, refine o conceito, consolide a conversa, **só depois** vá para a documentação (PRD, Decisões Técnicas, FSD, insumos).
- **NÃO** → Monte PRD, Decisões Técnicas, FSD, insumos etc. direto, seguindo a ordem da Fase de Análise.

**NUNCA pule esta pergunta.** Ela separa descoberta de execução.

---

## REGRA 0.1 — Documentos ausentes? CRIE primeiro, depois planeje o comando

Ao receber QUALQUER comando de desenvolvimento/edição/implementação:
1. Verificar se os documentos da metodologia existem (`PRD.md`, `DECISOES_TECNICAS.md`, `FSD.md`, `docs/STATUS.md`, `docs/ERROS.md`, `docs/DESIGN.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), `INSUMOS.md`, `docs/PLANO.md`).
2. **Se NÃO existirem:** Fazer o **Cold start** (seção "Cold Start" abaixo) para ler o código/funcionalidades existentes e criar **TODOS** os documentos — com `docs/STATUS.md` obviamente VAZIO e `docs/ERROS.md` vazio no início.
3. **Depois,** criar (ou atualizar) `docs/PLANO.md` com o plano de execução do comando do usuário e registrar a tarefa no `docs/STATUS.md`.
4. Seguir o plano da metodologia, etapa por etapa.

---

## REGRAS RÍGIDAS DE EXECUÇÃO (NOVAS — OBRIGATÓRIAS)

### R1 — FSD deve ser validado ANTES de qualquer código
- O `docs/FSD.md` deve passar pela **Validação do FSD (Passo 6 da Fase 1)** antes da Fase 2 começar.
- Relatório de validação deve conter: Resumo, Problemas Críticos, Problemas Importantes, Melhorias Recomendadas, Verificação Cobertura PRD, Verificação Decisões Técnicas, Verificação Design, Conclusão Final.
- **Não iniciar codificação sem validação aprovada.**

### R2 — Estrutura completa antes da Fase 1 de código
Antes da primeira fase de codificação (Passo 4), o seguinte deve existir e ser commitado:
- `docs/PLANO.md` com fases extraídas do FSD (seção 22)
- `docs/STATUS.md` vazio inicial
- `docs/ERROS.md` com modelo de registro
- `CLAUDE.md` modo construção
- Estrutura de pastas do projeto conforme FSD
- `.gitignore`, `.gitattributes` criados/revisados
- Git inicializado + primeiro commit + GitHub conectado

### R3 — Execução fase a fase (UMA FASE POR CHAT / POR COMANDO)
- **Uma execução do Prompt 04 = UMA fase apenas.**
- Identificar próxima fase pendente no `PLANO.md` (seguir ordem, não escolher).
- Implementar → Testar automatizado → Testar manual (instruções para usuário) → Registrar → Commit → Parar.
- **Próxima fase = chat novo** com mesmo prompt.
- NUNCA construir duas fases no mesmo chat.
- **No MODO SESSÃO (Claude Code, sessão contínua):** "um chat por fase" vale como **um comando do usuário por fase** — implementar a fase, testar, registrar, commitar, entregar os checklists e **PARAR**, aguardando o próximo comando. Nunca emendar a fase seguinte no mesmo turno, mesmo que "sobre contexto".

### R4 — Testes AUTOMATIZADOS obrigatórios por fase
Para cada fase, executar **todos os testes aplicáveis à stack** antes de entregar:
- Lint/syntax check (`npm run lint`, `php -l`, `ruff check`, etc.)
- Type check (`tsc --noEmit`, `phpstan`, `mypy`, etc.)
- Testes unitários/integração (`npm test`, `phpunit`, `pytest`, etc.)
- Build/Compile (`npm run build`, `composer install`, `cargo build`, etc.)
- Migrations/Schema validation (se banco envolvido)
- Server startup test (iniciar servidor local, verificar que responde)
- **Se algum teste falhar: corrigir, retestar, só então prosseguir.**

### R5 — Validação VISUAL obrigatória (frontend)
Para fases com interface (telas, componentes, páginas):
- IA deve **iniciar servidor local** e fornecer URL.
- IA deve **tirar screenshot** da página/funcionalidade implementada (via Playwright/Puppeteer/Chrome DevTools MCP).
- IA deve **verificar visualmente** se segue `docs/DESIGN.md` (cores, tipografia, espaçamento, componentes).
- IA deve testar **responsividade** (mobile, tablet, desktop) via emulação.
- Screenshot salvo em `docs/screenshots/fase-X-<nome>.png` para rastreabilidade.
- **Não marcar fase concluída sem validação visual.**

### R6 — Checklist HUMANO obrigatório (entregue ao usuário)
Ao final de cada fase, entregar **dois checklists em linguagem leiga**:

**Checklist 1 — O que foi implementado (para o cliente/usuário leigo)**
- [ ] Descrição simples do que agora é possível fazer
- [ ] Conquistas visíveis (ex.: "Página inicial carrega com hero, serviços, contato")

**Checklist 2 — O que testar e como testar (passo a passo: ação → resultado esperado)**
- [ ] **Teste:** Ação específica (ex.: "Abrir http://localhost:3000") → Resultado esperado (ex.: "Ver hero com logo, título, botão WhatsApp")
- [ ] **Teste:** Ação de erro (ex.: "Clicar botão sem preencher formulário") → Resultado esperado (ex.: "Mensagem amigável 'Preencha todos os campos'")
- [ ] **Comando automatizado:** `npm test` → Resultado esperado (ex.: "Todos os 12 testes passam")
- [ ] **Comando build:** `npm run build` → Resultado esperado (ex.: "Build succeeds sem erros")

**Checklist 3 — Regressão (o que NÃO pode quebrar)**
- [ ] Login continua funcionando
- [ ] Navegação entre páginas funciona
- [ ] APIs anteriores respondem corretamente

### R7 — Atualização STATUS.md + ERROS.md obrigatória
Após cada fase:
- `docs/STATUS.md`: fase construída, tarefas concluídas/pendentes, arquivos alterados, testes executados/resultado, data, próxima fase.
- `docs/ERROS.md`: qualquer erro (mesmo corrigido) no formato padrão.
- Commit com mensagem clara: `Fase X: <resumo da fase>`.

### R8 — Segurança FINAL obrigatória
Ao concluir **todas** as fases do `PLANO.md`:
- Executar **Revisão de Segurança (Passo 5)** em chat novo com raciocínio.
- Checklist completo (SQL Injection, XSS, CSRF, Auth/Authz, Isolamento, Secrets, Logs, Uploads, APIs, Erros).
- Classificar achados: Crítico/Alto/Médio/Baixo.
- Corrigir o seguro, perguntar antes de mudar regra/fluxo/dados/arquitetura.
- Atualizar `STATUS.md`, `ERROS.md`, commit, push.
- Só então: Documentação (Passo 6).

### R9 — Documentação Final Obrigatória (Passo 6)
Após revisão de segurança aprovada, em chat novo com raciocínio:
- Criar `docs/MANUTENCAO.md` com 12 seções obrigatórias (Visão geral, Stack/ambientes, Como rodar localmente, Mapa de pastas, Banco/persistência, Auth/autorização, Como adicionar tela, Como adicionar campo, Como alterar regra, Como testar, Cuidados segurança, Como registrar progresso, O que não fazer).
- Criar `docs/COMO-PEDIR-MUDANCAS.md` com 8 exemplos de prompts adaptados ao sistema (campo, tela, erro, regra, visual, relatório, segurança, commit).
- Atualizar `CLAUDE.md` para **modo manutenção** com protocolo antes/depois de alteração.
- Atualizar `docs/STATUS.md` registrando documentação criada, pendências, próximo passo.
- Commit: `Documentação final de manutenção` + `git push`.


---

## FASE 1 — ANÁLISE (sem programar)

Documentos em ordem, cada um lido/validado antes do próximo. Para cada passo, LEIA o prompt correspondente em `references/` e execute-o fielmente, transcrevendo as respostas nos arquivos.

### Passo 0 — Chat de Dúvidas
**Objetivo:** Tirar dúvidas de conceito separadas das decisões, em chat isolado.
**Prompt verbatim:** `references/analise-fundamentos.md` → seção "PROMPT — Chat de dúvidas"
**Saída:** Dúvidas respondidas, decisões NÃO tomadas aqui.
**Modelo:** Sem raciocínio (suficiente para explicações simples).
**Regras:**
- Dúvidas = conceitos (ex.: "O que é CRUD?")
- Decisões = escolhas do projeto (ex.: "O sistema deve ter pagamento parcial?") → NÃO responder aqui, encaminhar para passos corretos.

### Passo 1 — Design System → `docs/DESIGN.md`
**Objetivo:** Definir identidade visual do sistema (cores, tipografia, espaçamento, componentes, responsividade, acessibilidade).
**Prompts verbatim (escolha conforme origem):**
- Do zero: `references/analise-fundamentos.md` → "PROMPT — Criar um DESIGN.md do zero"
- De imagem: `references/analise-fundamentos.md` → "PROMPT — Criar um DESIGN.md a partir de imagem"
- De HTML/CSS: `references/analise-fundamentos.md` → "PROMPT — Criar um DESIGN.md a partir de HTML e CSS"
- Via Stitch: `https://stitch.withgoogle.com` → exportar .zip → salvar em `docs/`
- Refinar: "Prompt para refinar o design antes de gerar o DESIGN.md"
**Template base:** `templates/DESIGN.md`
**Checklist de revisão (seção 3.16):** Não genérico ("cores modernas"), contrastes OK, fontes usáveis, componentes claros, estilo combina com sistema.
**Usar skills:** `componentes-modernos` / `design-sem-cara-de-ia` quando aplicável.
**Skill `apple-design` — obrigatória em DOIS casos:**

1. **Plataformas Apple** (iOS, iPadOS, macOS, watchOS, tvOS, visionOS, Apple Watch, Vision Pro, SwiftUI, UIKit, AppKit, Catalyst): usar a skill ANTES de escrever o `docs/DESIGN.md`. Nessas plataformas o design system não é livre: ele começa nas Human Interface Guidelines e no sistema Liquid Glass. O `docs/DESIGN.md` deve declarar quais componentes são do sistema (não redesenhar), qual é a tipografia do sistema (SF Pro / SF Compact / New York) e a escala de Dynamic Type, os SF Symbols escolhidos, o comportamento em claro/escuro, e as regras de acessibilidade (Dynamic Type, contraste, Reduce Motion, Reduce Transparency, VoiceOver, alvo mínimo de toque).

2. **Qualquer projeto WEB com interface** (site, landing page, web app, painel, componente): usar a skill junto com `design-sem-cara-de-ia` e `componentes-modernos`. A `apple-design` cobre a parte que as outras não cobrem — a escada de decisão de componente (elemento HTML nativo antes de componente customizado), os padrões de experiência do usuário com as regras de quando **não** usar cada um (modal, spinner, permissão, onboarding), e a acessibilidade com os números do WCAG. O `docs/DESIGN.md` de projeto web deve declarar: quais componentes usam elemento nativo e quais são customizados (com o padrão ARIA de cada um), os estados obrigatórios de cada componente interativo, o comportamento em `prefers-color-scheme` e `prefers-reduced-motion`, os alvos de toque, e o contraste mínimo adotado.

**De onde tirar os valores do `docs/DESIGN.md` web (não invente escala nova):** a skill já traz a escala tipográfica, a escala de espaçamento, os tokens de cor claro/escuro com o contraste de cada par calculado, os tokens de sombra e de movimento e o sistema de ícones prontos em `~/.claude/skills/apple-design/references/web-sistema-visual.md`. Se o projeto usa Radix, shadcn/ui, React, Next.js ou Tailwind, a conciliação está em `references/web-ponte-stack.md`. Para começar do zero com um artefato pronto, `references/web-exemplo-referencia.md` tem uma página completa e comentada.
**Aprovação:** Usuário aprova `docs/DESIGN.md` antes de avançar.
**Obrigatório no FSD/Codificação:** IA deve ler `docs/DESIGN.md` antes de criar/alterar qualquer tela.

### Passo 2 — Explorar a Ideia
**Objetivo:** Entrevista incremental para fechar escopo, transformar ideia vaga em visão clara.
**Prompt verbatim:** `references/analise-docs.md` → "PROMPT — Explorar a Ideia (Passo 2)"
**Fluxo:** IA faz perguntas → usuário responde → IA consolida → repete até saturação → entrega **resumo consolidado da conversa** (não documento final obrigatório).
**Regras de ouro:**
- Nenhuma decisão técnica aqui (nada de linguagem, banco, framework, hospedagem, arquitetura, tabelas)
- Modelo com raciocínio obrigatório
- Não inventar conteúdo: só usar o que o usuário disse
- Perguntas uma a uma ou em pequenos grupos
- Aguardar resposta, consolidar, repetir até usuário dizer "chega"

### Passo 3 — PRD → `PRD.md`
**Objetivo:** Criar Product Requirements Document puramente funcional, sem tecnologia.
**Prompt verbatim:** `references/analise-docs.md` → "PROMPT — PRD (Passo 3)"
**Entrada:** Resumo consolidado do Passo 2 + `docs/DESIGN.md`
**Template base:** `templates/PRD.md`
**Estrutura:** Objetivo, Problema, Público, Perfis, Funcionalidades v1, Fora da v1, Regras de negócio, Informações controladas, Fluxos principais, Critérios de aceitação, Dúvidas pendentes.
**Aprovação:** Usuário aprova `PRD.md` antes de avançar.

### Passo 4 — Decisões Técnicas → `DECISOES_TECNICAS.md`
**Objetivo:** Definir stack, banco, hospedagem, login, perfis, auditoria, soft delete, logs, uploads, exportações, APIs, configs globais.
**Prompt verbatim:** `references/analise-docs.md` → "PROMPT — Decisões Técnicas (Passo 4)"
**16 seções obrigatórias:** Linguagem/framework, Banco, Desenvolvimento local, Hospedagem, Organização pastas, Login/auth, Perfis, Auditoria, Soft delete, Logs/erros em banco, Contingência arquivo, Uploads, Exportações, APIs/integrações, Configs globais, Outras.
**Perguntar ao usuário** o que não estiver definido. Usar defaults do vocabulário apenas quando usuário não souber.
**Template base:** `templates/DECISOES_TECNICAS.md`

### Passo 5 — FSD → `docs/FSD.md`
**Objetivo:** Juntar PRD + DESIGN + DECISOES_TECNICAS em especificação funcional completa.
**Prompt verbatim:** `references/analise-docs.md` → "PROMPT — FSD (Passo 5)"
**Template base:** `templates/FSD.md` (estrutura completa de 28 seções — ver template)
**Estrutura obrigatória (28 seções):**
1. Visão Geral
2. Documentos do Projeto para Implementação (apenas FSD.md + DESIGN.md)
3. Stack Definida
4. Ambientes do Projeto
5. Arquitetura do Sistema (padrão MVC se definido)
6. Regras de Segurança no Contexto
7. Estrutura Base do Projeto - Fase 1
8. Banco de Dados e Migrations - Fase 2
9. Autenticação e Controle de Acesso - Fase 3
10. Recursos Estruturais - Fase 4
11. Entidades Principais - Fase 5
12. CRUDs - Fase 6
13. Fluxos Principais - Fase 7
14. Relatórios e Consultas - Fase 8
15. Uploads - Fase 9 (se existirem)
16. Exportações - Fase 10 (se existirem)
17. APIs e Integrações - Fase 11 (se existirem)
18. Logs e Contingência - Fase 12
19. Revisão de Segurança - Fase 13
20. Revisão de Qualidade - Fase 14
21. Preparação da Entrega - Fase 15
22. Checklist de Prontidão Técnica por Fase
23. Checklist de Qualidade por Fase
24. Checklist de Entrega
25. Regras de Segurança
26. Critérios de Aceitação Técnica e Funcional
27. Pontos Pendentes e Decisões Futuras
28. Conclusão
**Validação interna:** FSD deve atender PRD, decisões completas, sem lacunas para IA "inventar".

### Passo 6 — Validar FSD
**Objetivo:** Revisão independente (simulada ou real) do FSD antes de codificar.
**Prompt verbatim:** `references/analise-docs.md` → "PROMPT — Validação do FSD (Passo 6)"
**Critérios:** Coerência FSD↔PRD, decisões técnicas completas, lacunas identificadas, refinamento se necessário.
**Saída:** Relatório com: Resumo, Problemas Críticos, Problemas Importantes, Melhorias Recomendadas, Verificação de Cobertura PRD, Verificação Decisões Técnicas, Verificação Design, Conclusão Final.

---

## FASE 2 — CODIFICAÇÃO (em etapas)

### Passo 0 — Chat de Ajuda
**Objetivo:** Dúvidas técnicas em chat separado do chat de execução.
**Prompt verbatim:** `references/codificacao-estrutura.md` → "PROMPT — Chat de ajuda (Passo 0)"
**Modelo:** Sem raciocínio.

### Passo 1 — Validar Insumos → `docs/INSUMOS.md`
**Objetivo:** Ler TODOS os docs, conferir coerência e completude, corrigir lacunas ANTES de codificar.
**Prompt verbatim:** `references/codificacao-estrutura.md` → "PROMPT — Validar insumos (Passo 1)"
**Documentos a ler:** `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, `docs/DESIGN.md`, `docs/FSD.md`, `PRD.md`, `DECISOES_TECNICAS.md`, `CLAUDE.md`
**Checklist obrigatório:**
- [ ] Ler todos os documentos por completo
- [ ] Verificar FSD ↔ PRD (o que está especificado atende o que foi pedido)
- [ ] Verificar se decisões técnicas estão todas definidas (sem lacunas para IA "inventar")
- [ ] Listar conflitos/lacunas e corrigir ANTES de codificar
- [ ] Confirmar primeiro ponto de partida: por qual etapa do PLANO começar

### Passo 2 — Preparar Estrutura Inicial
**Objetivo:** Criar pastas/arquivos-base e docs da metodologia na pasta `docs/`.
**Prompt verbatim:** `references/codificacao-estrutura.md` → "PROMPT — Preparar estrutura (Passo 2)"
**Criar/atualizar:**
1. `docs/PLANO.md` — fases extraídas do FSD (seção 22)
2. `docs/STATUS.md` — acompanhamento vazio inicial
3. `docs/ERROS.md` — com modelo de registro
4. `CLAUDE.md` — instruções para IAs agênticas:
   - Stack/estrutura resumida
   - Metodologia obrigatória
   - Regras de registro (ERROS.md, STATUS.md)
   - Regras de segurança por stack
   - Como adicionar tela/campo
   - Modo construção → manutenção
5. Estrutura de pastas do projeto conforme FSD

### Passo 3 — Git e GitHub
**Objetivo:** `git init`, `.gitignore`, `.gitattributes`, primeiro commit com estrutura, conectar ao GitHub.
**Prompt verbatim:** `references/codificacao-etapas.md` → "PROMPT — Git e GitHub (Passo 3)"
**Inclui:**
- Tutorial SSH manual (Linux/macOS/Git Bash + PowerShell Windows)
- Prompt de apoio para problemas SSH
- `.gitignore`: nunca versionar segredos, `.env`, logs, dumps, certificados, chaves privadas
- `.gitattributes`: padronizar tratamento de arquivos
- Primeiro commit: estrutura + docs metodologia
- Conectar remoto GitHub (não forçar `origin` existente)
**Arquivos vivos:** Atualizar `docs/STATUS.md` e `docs/ERROS.md` após commit.

### Passo 4 — Codificar EM ETAPAS (coração da construção)
**Objetivo:** Construir **apenas a próxima fase pendente**, uma fase por vez, **um chat novo por fase**.
**Prompt verbatim:** `references/codificacao-etapas.md` → "PROMPT — Codificar em etapas (Passo 4)"
**Fluxo por fase:**
1. IA lê contexto (`docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, `docs/FSD.md`, `CLAUDE.md`)
2. Identifica próxima etapa pendente no `PLANO.md` (seguir ordem, não escolher)
3. Implementa a etapa conforme FSD/PLANO
4. **Testa** (manual + automatizado) — ver seção "Testar a fase"
5. Atualiza `docs/STATUS.md` (status da etapa) e `docs/ERROS.md` (erros encontrados)
6. Commit Git com mensagem clara
7. Entrega os **2 checklists obrigatórios**:
   - Checklist 1: O que foi implementado (linguagem leiga)
   - Checklist 2: O que testar e como testar (passo a passo: ação → resultado; comando se houver)
8. **Próxima fase = chat novo** com mesmo prompt

**Regras críticas:**
- NUNCA construir tudo de uma vez
- Prompt 04 NÃO pode construir mais de uma fase
- Sem raciocínio nesta etapa
- Usar o arquivo de contexto do agente (`CLAUDE.md` no Claude Code, `AGENTS.md` no Codex/Antigravity)
- Antes de resolver erro novo, consultar `docs/ERROS.md`
- Não marcar fase concluída se critérios de pronto não atendidos
- Não instalar libs/frameworks fora do FSD sem perguntar
- Não presumir tecnologia se não estiver no FSD
- Segurança obrigatória mesmo durante construção (ver lista completa no prompt)

**Seção "O que fazer quando algo falhar":**
1. Ler `docs/ERROS.md` — já ocorreu antes?
2. Reproduzir erro
3. Pedir correção descrevendo: o que fez, esperava, aconteceu
4. Aplicar correção → retestar → registrar em `docs/ERROS.md`
5. Se travar: novo chat, mesmo prompt, ler contexto atualizado

### Testando as Etapas (embutido no Passo 4)
**Seção do prompt:** "Testar a fase" + "O que fazer quando algo falhar"
**Regra:** Sistema criado ≠ sistema testado. Nunca avançar sem teste real.

### Passo 5 — Revisão de Segurança
**Objetivo:** Verificar auth/authz, dados sensíveis, inputs, injeção, exposição de mensagens técnicas.
**Prompt verbatim:** `references/codificacao-etapas.md` → "PROMPT — Revisão de segurança (Passo 5)"
**Quando:** Ao concluir todas as etapas de construção, **antes** da documentação final.
**Checklist:**
- Proteção contra injeção SQL
- Proteção contra XSS
- Proteção contra CSRF
- Armazenamento seguro de senhas (hash)
- Autenticação e controle de sessão
- Controle de acesso por perfil/permissão
- Isolamento de dados (usuário, conta, empresa, organização)
- Proteção de arquivos sensíveis
- Uso seguro de variáveis de ambiente/configuração
- Mensagens de erro seguras (não expor stack traces)
- Logs protegidos
- Validação de entradas
- Sanitização de saídas
- Proteção em uploads (se houver)
- Segurança no consumo de APIs externas (se houver)
- Cuidados com chaves, tokens, credenciais
- Proteção das rotas/endpoints/páginas internas
- Regras do FSD/`CLAUDE.md` têm prioridade

### Passo 6 — Documentação Final
**Objetivo:** Atualizar `docs/` com estado final, colocar `CLAUDE.md` em **modo manutenção**.
**Prompt verbatim:** `references/codificacao-final.md` → "PROMPT — Documentação (Passo 6)"
**Quando:** Após revisão de segurança (Passo 5) aprovada. **Chat novo com raciocínio.**
**Não cria** funcionalidades.
**Criar/atualizar:**
1. `docs/MANUTENCAO.md` — 12 seções mínimas:
   - Visão geral (o que faz, para quem, problemas, módulos)
   - Stack e ambientes (linguagem, framework, banco, libs, local, produção, comandos)
   - Como rodar localmente (passo a passo com comandos reais)
   - Mapa de pastas (o que guarda, quando mexer, cuidados)
   - Banco de dados e persistência (migrations, seeds, como alterar, cuidados)
   - Autenticação, autorização e usuários (login, perfis, onde permissões verificadas)
   - Como adicionar nova tela (passos, arquivos a alterar)
   - Como adicionar novo campo (banco, model, formulário, validação, listagem, testes, docs)
   - Como adicionar nova regra de negócio (conferir FSD, localizar, alterar com cuidado, testar)
   - Como testar alterações (comandos, manuais, fluxos principais, logs, ERROS.md)
   - Cuidados de segurança (auth, authz, sessão, validação, injeção, XSS, CSRF, isolamento, arquivos sensíveis, logs, uploads, APIs, segredos)
   - Como registrar progresso (STATUS.md, ERROS.md)
   - O que não fazer (não reescrever sem necessidade, não alterar stack sem decisão, não remover segurança, não versionar segredos, não ignorar testes, não mexer várias áreas sem explicar)
2. `docs/COMO-PEDIR-MUDANCAS.md` — para usuário leigo:
   - Explicação simples + orientação ler docs antes
   - 8 modelos de prompts adaptados ao sistema: adicionar campo, criar tela, corrigir erro, alterar regra, ajustar visual (DESIGN.md), criar relatório/filtro, revisar segurança, preparar commit
3. Atualizar `CLAUDE.md` para **modo manutenção** com protocolo:
   - Antes: ler MANUTENCAO.md, FSD.md, DESIGN.md (se UI), STATUS.md, ERROS.md, entender pedido, explicar plano
   - Depois: testar, atualizar STATUS.md, registrar ERROS.md, commit, explicar validação
4. Atualizar `docs/STATUS.md`: documentação criada, pendências, próximo passo.
5. Commit: `Documentação final de manutenção` + `git push`.
**Entregar ao usuário:** Resumo, pontos principais MANUTENCAO.md, exemplos COMO-PEDIR-MUDANCAS.md, confirmações.
**Frase final:** "Documentação pronta. O sistema está documentado e pronto para ser publicado na hospedagem que você escolher."

---

## FLUXOS ESPECIAIS

### Edição Simples (bug pequeno, ajuste)
- Aplicar direto no código
- Atualizar `docs/STATUS.md` e `docs/ERROS.md`
- Entregar os 2 checklists (leigo + como testar)
- **NÃO** atualizar PRD/FSD/insumos

### Alteração/Recurso Maior
1. Atualizar `PRD.md`/`FSD.md`/insumos se necessário
2. Iniciar novo plano no `docs/STATUS.md` (nova etapa)
3. Ir etapa por etapa, seguindo metodologia
4. Gerar nova documentação se necessário
5. Começar lendo `docs/` + código relevante

### Implementar Funcionalidade Nova
1. Ler `docs/` (STATUS, ERROS, FSD, PLANO) e código relevante
2. Atualizar `PRD.md`/`FSD.md`/insumos quando necessário
3. Atualizar `docs/STATUS.md` (nova etapa) e iniciar novo plano
4. Ir fase a fase, seguindo metodologia e registrando em `docs/ERROS.md`

### Pedido de Alteração (chat separado)
**Checklist antes de pedir:**
- [ ] Expliquei o objetivo
- [ ] Defini tipo: visual, funcional, técnica, regra
- [ ] Avisei o que NÃO deve ser alterado
- [ ] Pedi plano antes de executar (se necessário)
- [ ] Pedi para preservar regras do FSD
- [ ] Pedi para manter documentação atualizada
- [ ] Pedi para verificar necessidade de commit
- [ ] Testei depois da alteração

### Rollback
**Regra:** Código volta com Git. Banco só volta com análise, backup e cuidado.
**Antes de rollback (9 perguntas):** Problema no código? Interface? Regra? Banco alterado? Enviado GitHub? Publicado produção? Usuários criaram dados depois? Existe backup? Existe tag versão anterior?
**Prompt análise:** `git log --oneline --decorate --graph --all` → analisar commit atual, recentes, tags, qual introduziu alteração, versão boa anterior, comando rollback seguro, riscos.
**Prompt rollback código:** `git revert <commit>` ou `git reset --hard <commit/tag>` + `git push --force-with-lease` (se necessário).

### STATUS.md Concluído (todas as etapas)
1. Executar **Revisão de Segurança** (Passo 5) — chat novo com raciocínio
2. Executar **Documentação** final (Passo 6) — chat novo com raciocínio

### Cold Start — Sistema SEM arquivos da metodologia

Primeira vez num projeto que já tem código: os documentos vão descrever o sistema inteiro, então a leitura cobre o sistema inteiro. **Amostra não serve** — PRD e FSD escritos a partir de "alguns arquivos representativos" ficam errados, e o erro só aparece depois, quando alguém já confiou neles.

Ordem obrigatória:

1. **Inventário** — `bash scripts/inventario-projeto.sh` na raiz. Devolve arquivos por extensão, pastas com contagem, manifestos, migrations, rotas, autenticação, testes, variáveis de ambiente, integrações e `TODO`/`FIXME`. É a lista de verificação.
2. **Grafo** — `tokensave` (`_entities`, `_files`, `_module_api`, `_dependencies`, `_rank`) + `code-review-graph` (`get_architecture_overview_tool`, `list_communities_tool`, `list_flows_tool`, `get_hub_nodes_tool`), em paralelo.
3. **Leitura direta obrigatória** onde o grafo não alcança: manifestos, `.env.example`, **todas** as migrations e schemas, todas as rotas e telas, middleware/policies/permissões, README e docs soltos, configuração de deploy.
4. **Módulo por módulo**, na ordem de importância, respondendo seis perguntas: o que faz (em linguagem de negócio), que entidades toca, que telas/endpoints expõe, que regras aplica, de quem depende e quem depende dele, e se tem teste. Módulo grande → subagente.
5. **Tabela de cobertura**, entregue **antes** dos documentos: pasta/módulo → como foi coberto → o que faz → entidades → pendências. Toda pasta do inventário aparece, inclusive as descartadas com o motivo. Tabela que não fecha com o inventário = varredura incompleta.
6. **Só então** escrever PRD, DECISOES_TECNICAS, FSD, DESIGN, INSUMOS e o arquivo de contexto — cada afirmação apontando a origem no código. `STATUS.md` e `ERROS.md` nascem vazios.
7. Reler o comando original do usuário, registrar em `PLANO.md` + `STATUS.md`, e seguir a metodologia.

**Cobertura total, custo mínimo:** cobrir 100% dos módulos é obrigatório; fazer isso lendo arquivo inteiro quando o grafo resolvia, não. As duas coisas valem ao mesmo tempo.

## VOCABULÁRIO ESPECIALIZADO (uso obrigatório para precisão)

**Análise:** CRUD, RBAC, Auditoria, Soft delete, Logs, MVC, API, Integração externa, Configurações globais, Hospedagem, Domínio, Ambiente local/testes/homologação/produção.
**Dados:** Entidade, Campo, Relacionamento (1:1, 1:N, N:M), Migration, Seed, Índice, Constraint, Soft delete, Timestamp.
**Telas/Interface:** Dashboard, Layout, Responsividade, Acessibilidade, Componente, Estado (vazio, carregando, erro, sucesso), Navegação (menu, breadcrumb), Modal, Tabela, Formulário, Validação.
**Usuários/Segurança:** Autenticação, Autorização, Perfil, Permissão, Sessão, Token, Hash, Salt, CSRF, XSS, SQL Injection, Isolamento de dados (multi-tenancy).
**Construção:** Fase, Construção incremental, Critério de pronto, Persistência, Commit, Branch, Push, Pull, Merge, Conflict, Rollback, Tag, Hotfix, Refatoração, Technical debt.
**Uploads/Exportações:** Upload, Anexo, Exportação, CSV, PDF, Excel, Importação, MIME type, Validação extensão/tipo real.
**Documentos do fluxo:** Chat de dúvidas, DESIGN.md, Explorar ideia, PRD.md, DECISOES_TECNICAS.md, FSD.md, Validação FSD, Chat de ajuda, INSUMOS.md, PLANO.md, STATUS.md, ERROS.md, CLAUDE.md, CHECKLIST.md.

---

## REGRAS OBRIGATÓRIAS DO USUÁRIO

1. **Sistema criado ≠ sistema testado.** Nunca declarar etapa concluída sem teste real.
2. **Ao final de cada etapa/edição**, entregar:
   - **Checklist 1:** O que foi implementado, em **linguagem leiga** (sem termos técnicos)
   - **Checklist 2:** O que testar e como testar (passo a passo: ação → resultado esperado; comando de teste se houver)
3. **Ao completar uma etapa do STATUS.md**, anexar:
   - (a) O checklist por etapa (leigo)
   - (b) O **checklist completo com todas as etapas** de tudo que já foi feito no projeto
4. **Erros:** Registrar em `docs/ERROS.md` (o que aconteceu em leigo, erro técnico, causa, correção, status). Reusar histórico para não repetir erros.
5. **Status:** Manter `docs/STATUS.md` sempre atualizado a cada avanço.

---

## MATRIZ DE IMPACTO — que documento atualizar (OBRIGATÓRIA)

Toda alteração de código passa por esta tabela **antes** de a tarefa ser considerada pronta. Não é "se der tempo": é parte da entrega.

| O que você mexeu | Documento que precisa ser atualizado |
|---|---|
| Funcionalidade nova, alterada ou removida | `PRD.md` (e `docs/FSD.md`) |
| Regra de negócio, validação, cálculo, estado | `PRD.md` + `docs/FSD.md` |
| Entidade, tabela, campo, migration | `docs/FSD.md` (modelo de dados) |
| Rota, endpoint, tela nova | `docs/FSD.md` |
| Fluxo do usuário mudou | `PRD.md` + `docs/FSD.md` |
| Stack, banco, hospedagem, biblioteca nova | `DECISOES_TECNICAS.md` + `INSUMOS.md` |
| Autenticação, perfil, permissão, sessão | `DECISOES_TECNICAS.md` + `docs/FSD.md` |
| Variável de ambiente, config, integração externa | `INSUMOS.md` + `DECISOES_TECNICAS.md` |
| Cor, fonte, espaçamento, componente, padrão visual | `docs/DESIGN.md` |
| Tela, componente ou ícone em plataforma Apple (iOS, iPadOS, macOS, watchOS, tvOS, visionOS) | `docs/DESIGN.md` + skill `apple-design` (conferir HIG antes de fechar) |
| Etapa nova descoberta no caminho | `docs/PLANO.md` |
| Jeito de rodar, testar ou contribuir mudou | arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) |
| Qualquer alteração de código, sempre | `docs/STATUS.md` |
| Qualquer erro encontrado, mesmo já corrigido | `docs/ERROS.md` |

**Regra de fechamento:** ao terminar a tarefa, diga em uma linha quais documentos foram atualizados e, para os que **não** foram, qual foi conferido e por que não precisou mexer. Silêncio sobre um documento conta como esquecimento, não como "não precisava".

**Trava:** o hook `Stop` não deixa a sessão encerrar se houve alteração de código e o `docs/STATUS.md` não foi atualizado — ele devolve esta matriz e o trabalho continua.

**Não vale o contrário:** não inche o PRD com detalhe de implementação nem o FSD com decisão que não foi tomada. Atualizar é refletir o que mudou, não escrever mais.

---

## FERRAMENTAS DE ECONOMIA DE TOKENS (OBRIGATÓRIAS)

Estas sete ferramentas são **parte da metodologia**, não um extra. Usar sempre; **instalar quando faltarem**.

| # | Ferramenta | Para que serve | Repositório |
|---|---|---|---|
| 1 | **tokensave** (MCP) | Grafo de código: entender o sistema sem ler arquivo inteiro | https://github.com/aovestdipaperino/tokensave |
| 2 | **rtk** | Filtra a saída dos comandos de terminal (até 90% menos tokens) | https://github.com/rtk-ai/rtk |
| 3 | **code-review-graph** (MCP) | Grafo estrutural: review, impacto, arquitetura | https://github.com/tirth8205/code-review-graph |
| 4 | **graphify** | Grafo de conhecimento de qualquer insumo (código, docs, PDFs, vídeo) | https://github.com/Graphify-Labs/graphify |
| 5 | **tokenoptim** | Compressão de prompt/contexto | https://github.com/Manas470/tokenoptim |
| 6 | **ponytail** (plugin) | Força a solução mais simples que funciona (anti-over-engineering) | https://github.com/dietrichgebert/ponytail |
| 7 | **caveman** (plugin) | Saída ultracomprimida sem perder substância técnica | https://github.com/JuliusBrussee/caveman |

### P0 — Instalação automática (não depende do modelo)

Ao ativar a metodologia e a cada início de sessão, os hooks do plugin fazem sozinhos:

1. Verificam as sete ferramentas.
2. **Baixam e instalam em segundo plano** as de linha de comando que faltarem (`tokensave`, `rtk`, `code-review-graph`, `graphify`, `tokenoptim`), no máximo uma vez por dia. Log: `~/.ia5k/instalacao.log`.
3. Injetam no contexto quais estão disponíveis e quais faltam.

O que **você** (modelo) ainda precisa fazer:

- Se faltarem os plugins `ponytail` ou `caveman`, pedir ao usuário que cole no Claude Code:
  ```
  /plugin marketplace add DietrichGebert/ponytail
  /plugin install ponytail@ponytail
  /plugin marketplace add JuliusBrussee/caveman
  /plugin install caveman@caveman
  ```
- Se `tokensave` estiver instalado mas o projeto não tiver índice, rodar `tokensave init .`.

Detalhes de uso por ferramenta: `references/ferramentas-token.md`.

### Uso obrigatório em TODO passo — garantido por hook

O hook `PreToolUse` em `Read|Grep|Glob` **bloqueia a leitura direta de arquivos de código** enquanto o P1 não for feito na sessão. O bloqueio cai assim que qualquer ferramenta `mcp__tokensave__*` ou `mcp__code-review-graph__*` for chamada (registrado pelo hook `PostToolUse`). Documentos (`.md`), configs (`.json`, `.yml`, `.toml`, `.env`) e imagens passam sempre — são o que a metodologia precisa ler primeiro.

Ou seja: em toda sessão, em todo projeto, o mapeamento por grafo vem antes da leitura bruta. Não é uma recomendação, é uma trava.

**Não é uma ferramenta por passo — é todas as que couberem.** Chamadas independentes vão na mesma mensagem, em paralelo: duas consultas de grafo juntas custam menos que ler um arquivo.

| Passo da metodologia | Ferramentas a combinar |
|---|---|
| Explorar ideia / insumos do cliente (PDF, transcrição, documentação) | `graphify` + `tokenoptim` (comprimir o insumo antes de processar) |
| Mapear sistema existente (cold start, PRD, FSD) | `tokensave` (`_context`, `_entities`, `_files`) **+** `code-review-graph` (`get_architecture_overview_tool`, `list_flows_tool`) — em paralelo |
| Decisões técnicas / arquitetura | `code-review-graph` (arquitetura, comunidades, hubs) **+** `tokensave` (`_dependencies`, `_imports`) |
| Planejar etapa (PLANO/STATUS) | `tokensave` (`_impact`, `_affected`, `_callers`) **+** `code-review-graph` (`get_impact_radius_tool`, `get_affected_flows_tool`) **+** `graphify` se houver `graphify-out/` |
| Codificar a etapa | `ponytail` (sempre) **+** `tokensave` (`_body`, `_signature`, `_str_replace`) no lugar de `Read`/`Edit` de arquivo inteiro |
| Testar / rodar comandos | `rtk` (automático) **+** `tokensave` (`_run_affected_tests`, `_test_map`) para rodar só o que importa |
| Revisar a etapa | `code-review-graph` (`detect_changes_tool`, `get_review_context_tool`) **+** `tokensave` (`_diff_context`) |
| Revisão de segurança | `code-review-graph` (`get_impact_radius_tool`) **+** `tokensave` (`_callers`, `_unsafe_patterns`) |
| Busca ampla em muitos arquivos | subagente (`Explore` / `cavecrew-investigator`) — nunca no contexto principal |
| Relatar / checklists / commit | `caveman` (sempre) — comprime a conversa, **nunca** o documento nem a mensagem de commit |
| Contexto ou prompt muito longo | `tokenoptim` |

### ponytail e caveman: sempre ligados

Não são opcionais nem "quando der". Os hooks do plugin injetam as duas regras em **todo prompt**, mesmo que os plugins ainda não estejam instalados — e o hook `SessionStart` grava `~/.claude/.caveman-active` com o nível `full` se o arquivo não existir.

**ponytail** — escada obrigatória antes de escrever qualquer linha: a tarefa precisa existir? já existe no projeto? resolve com recurso nativo? com dependência já instalada? em uma linha? só então o mínimo que funciona. Nunca cortar validação, tratamento de erro, segurança ou acessibilidade.

**caveman** — resposta comprimida: sem preâmbulo, sem resumo final, sem narrar tool call. **Nunca** comprimir código, comandos, caminhos, erros, números, versões e avisos de segurança. **Nunca** comprimir o que fica gravado: PRD, FSD, STATUS, ERROS, PLANO, checklists em linguagem leiga e mensagens de commit saem em português normal, por extenso.

### Ordem padrão de leitura do sistema (P1)

1. `mcp__tokensave__tokensave_status` → tem índice? Se não, `tokensave init .` no projeto (Bash).
2. `mcp__tokensave__tokensave_context` com a descrição da tarefa (+ `keywords`) → símbolos, relações, trechos relevantes.
3. `mcp__tokensave__tokensave_search` / `_entities` / `_files` → localizar entidades, rotas, telas.
4. `mcp__tokensave__tokensave_callers` / `_callees` / `_impact` / `_affected` → o que a mudança quebra.
5. `code-review-graph`: `build_or_update_graph_tool` → `get_architecture_overview_tool`, `list_flows_tool`, `list_communities_tool`, `get_impact_radius_tool`, `get_minimal_context_tool` (arquitetura, fluxos, raio de impacto).
6. Se existir `graphify-out/` no projeto, consultar o grafo antes de reler código.
7. Só então `Read` **parcial** dos arquivos que sobraram (nunca dump de arquivo inteiro).
8. Varredura ampla (muitos arquivos/pastas) → **subagente** (`Explore` / `cavecrew-investigator`), para não inchar o contexto principal.

### Regras de uso permanentes

- `rtk` — a saída de Bash já vem filtrada pelo hook. **Nunca** contornar com `rtk proxy` fora de depuração.
- `ponytail` — aplicar em toda decisão de código: a solução mais simples que resolve, sem dependência desnecessária.
- `caveman` — relatórios, reviews e respostas comprimidos; **nunca** comprimir código, caminhos, comandos, versões ou mensagens de erro.
- `graphify` — usar para transformar insumos longos (PDF, curso, transcrição, documentação) em grafo consultável.
- `tokenoptim` — comprimir prompts e contextos longos antes de mandar para o modelo.

**Proibido:** planejar, prometer ou editar código sem ter feito P0 e P1. "Não achei o arquivo" não justifica pular o mapeamento.

---

## COMO EXECUTAR (Workflow Obrigatório)

0. **Ativar o modo sessão** (`scripts/ia5k-session.sh on`) e rodar `status` para saber quais documentos existem. Enquanto o modo estiver ativo, o protocolo P1–P8 é injetado em cada comando e o guard bloqueia código sem documentos.
1. **Identificar a fase/passo** em que a tarefa se encaixa e **LER o prompt correspondente em `references/`** (ex.: passo PRD → `analise-docs.md`; codificar etapa → `codificacao-etapas.md`; alteração → `codificacao-final.md`). Executar o prompt fielmente.
2. **Seguir as fases acima, na ordem**, consultando o prompt correto de cada passo.
3. **Usar os templates de `templates/`** como base dos documentos.
4. **Ao terminar cada passo/etapa**, entregar os checklists exigidos.
5. **Usar as ferramentas de economia de tokens** (tokensave, code-review-graph, rtk) ao ler código.

---

## PROMPTS VERBATIM CHAVE (referência rápida)

### Prompt "Explorar a Ideia" (Passo 2) — `references/analise-docs.md`
> Você vai conduzir uma **entrevista incremental** para transformar uma ideia inicial em uma visão clara do sistema.
> - Faça perguntas uma a uma ou em pequenos grupos.
> - Aguarde a resposta do usuário.
> - Consolide o que foi dito.
> - Repita até saturação (usuário diz "chega" ou não há mais dúvidas).
> - **NÃO tome decisões técnicas.** Nada de linguagem, banco, framework, hospedagem, arquitetura, tabelas.
> - **NÃO crie documentos finais** (PRD, FSD, etc.). O entregável é o **resumo consolidado da conversa**.
> - Use modelo com raciocínio.
> - Não invente: só use o que o usuário disse.

### Prompt "PRD" (Passo 3) — `references/analise-docs.md`
> Transforme o resumo consolidado do Passo 2 em um **PRD.md** (Product Requirements Document).
> - Puramente funcional, para pessoas (leigo). Sem detalhes técnicos.
> - Use o template `templates/PRD.md`.
> - O DESIGN.md (Passo 1) será usado "com mais força" no FSD, não aqui.
> - Aprovar com o usuário antes de avançar.

### Prompt "Decisões Técnicas" (Passo 4) — `references/analise-docs.md`
> Defina as decisões técnicas do projeto em `DECISOES_TECNICAS.md`.
> - Stack, banco, hospedagem, login, perfis, auditoria, soft delete, logs, uploads, exportações, APIs, configs globais.
> - Pergunte ao usuário o que não estiver definido.
> - Use defaults do vocabulário apenas quando usuário não souber.
> - Template: `templates/DECISOES_TECNICAS.md`.

### Prompt "FSD" (Passo 5) — `references/analise-docs.md`
> Junte PRD + DESIGN + DECISOES_TECNICAS em `docs/FSD.md` (Especificação Funcional do Sistema).
> - Template: `templates/FSD.md` (28 seções obrigatórias).
> - Deve ser completo para orientar a codificação sem a IA "inventar".

### Prompt "Validar FSD" (Passo 6) — `references/analise-docs.md`
> Valide o FSD contra PRD, DECISOES_TECNICAS.md, DESIGN.md.
> - Saída: relatório com Resumo, Problemas Críticos, Importantes, Melhorias, Cobertura PRD, Decisões Técnicas, Design, Conclusão.

### Prompt "Validar Insumos" (Passo 1 Codificação) — `references/codificacao-estrutura.md`
> Leia TODOS os documentos do projeto e confira coerência/completude ANTES de codificar.
> - `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, `docs/DESIGN.md`, `docs/FSD.md`, `PRD.md`, `DECISOES_TECNICAS.md`, `CLAUDE.md`
> - Corrija lacunas ANTES de escrever código.

### Prompt "Preparar Estrutura" (Passo 2 Codificação) — `references/codificacao-estrutura.md`
> Crie docs/PLANO.md, docs/STATUS.md, docs/ERROS.md, CLAUDE.md, estrutura pastas projeto.

### Prompt "Git e GitHub" (Passo 3 Codificação) — `references/codificacao-etapas.md`
> git init, .gitignore, .gitattributes, primeiro commit, conectar GitHub. SSH tutorial incluso.

### Prompt "Codificar em Etapas" (Passo 4 Codificação) — `references/codificacao-etapas.md`
> **UM CHAT NOVO POR FASE.** Leia contexto, identifique próxima etapa pendente no PLANO.md, implemente, teste, atualize STATUS.md e ERROS.md, commit, entregue checklists.

### Prompt "Revisão de Segurança" (Passo 5 Codificação) — `references/codificacao-etapas.md`
> Revise: auth/authz, dados sensíveis, inputs/sanitização, injeção (SQL/XSS/CSRF), exposição de erros técnicos, secrets no código.

### Prompt "Documentação" (Passo 6 Codificação) — `references/codificacao-final.md`
> Atualize docs/ com estado final. Coloque o arquivo de contexto em modo manutenção. Não crie funcionalidades.


---

## TEMPLATES DE DOCUMENTOS (em `templates/`)

| Arquivo | Descrição |
|---------|-----------|
| `PRD.md` | Product Requirements Document — o QUE o sistema faz (leigo) |
| `DESIGN.md` | Design System — COMO a interface deve parecer |
| `DECISOES_TECNICAS.md` | Decisões técnicas — stack, banco, auth, auditoria, etc. (16 seções) |
| `FSD.md` | Especificação Funcional — PRD + DESIGN + DECISÕES = spec completa (28 seções) |
| `INSUMOS.md` | Checklist de validação dos docs antes de codificar |
| `PLANO.md` | Plano de desenvolvimento em etapas (fases extraídas do FSD) |
| `STATUS.md` | Acompanhamento: progresso, checklist etapa atual, checklist completo, próximos passos |
| `ERROS.md` | Log de erros com causa/correção + checklist ao encontrar erro |
| `CLAUDE.md` | Arquivo de contexto do Claude Code (modo construção → modo manutenção) |
| `AGENTS.md` | Arquivo de contexto do Codex e do Antigravity, com o protocolo P1–P8 escrito (sem hooks) |
| `CHECKLIST.md` | Modelo de checklist por entrega (leigo + como testar + regressão) |

---

## ESTRUTURA DE PASTAS PADRÃO (criada no Passo 2 Codificação)

```
projeto/
├── PRD.md
├── DECISOES_TECNICAS.md
├── CLAUDE.md            # Claude Code (ou AGENTS.md no Codex/Antigravity)
├── docs/
│   ├── DESIGN.md
│   ├── FSD.md
│   ├── INSUMOS.md
│   ├── PLANO.md
│   ├── STATUS.md
│   └── ERROS.md
├── .gitignore
├── .gitattributes
└── [código do projeto conforme stack definida no FSD]
```

---

## EXTRAS AVANÇADOS

### Criando Skills
- Transformar Prompt 04 ("Codificar em etapas") em skill reutilizável
- **Uso manual (acionamento explícito)**, nunca automático
- Preservar integralmente a função do prompt original
- Estrutura: `construir-proxima-fase/SKILL.md` + `references/prompt-04-construir-fase.md`
- Comandos válidos: "Executar skill: construir próxima fase", "Use a skill de construção da próxima fase", "/construir-proxima-fase"
- Comandos inválidos: "Continue o sistema", "Faça a próxima parte", "Pode seguir", "Termine o projeto"

### Outras Stacks
- Adaptar fluxo (prompts 01-07) para qualquer stack: PHP/Laravel, Node/Express, Next.js, Python/Django, Supabase, Firebase, etc.
- Qualquer hospedagem: VPS, Vercel, Render, Railway, Netlify, Cloudflare Pages
- **Regra central:** "Quem define a tecnologia do projeto é o FSD, não o improviso da IA"
- Prompts são generalistas e devem seguir `docs/FSD.md`, o arquivo de contexto, demais documentos

### Erros Comuns
- Pular validação de insumos
- Construir tudo de uma vez
- Não testar antes de avançar
- Não registrar erros
- Inventar tecnologia fora do FSD
- Versionar segredos
- Não fazer revisão de segurança
- Não documentar para manutenção

### IA Agêntica (Extras)
- Passo 5 FSD (IA Agêntica): prompt adaptado para agentes
- Passo 6 Validação FSD (IA Agêntica): prompt adaptado para agentes

---

**Lembre-se:** A metodologia existe para transformar conversa em código confiável, passo a passo, com rastreabilidade. Pular etapas ou não fazer as perguntas obrigatórias quebra o fluxo.