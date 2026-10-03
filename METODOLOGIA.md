# A metodologia APES IA5K

Este documento explica a metodologia para pessoas. O agente de IA lê o `SKILL.md` e os prompts em `references/`; você lê este arquivo para entender o que o agente vai fazer, em que ordem e por quê.

---

## 1. O problema que ela resolve

Agentes de IA escrevem código rápido, mas erram de formas previsíveis:

- **Constroem tudo de uma vez.** Um pedido vira cinquenta arquivos, metade deles quebrados.
- **Inventam.** Funcionalidades que ninguém pediu, bibliotecas que não estavam no plano.
- **Esquecem.** No dia seguinte, num chat novo, não sabem mais o que foi decidido.
- **Não testam.** "Pronto" significa "o código existe", não "o sistema funciona".
- **Não registram.** O mesmo erro volta três vezes porque ninguém anotou a causa.

A APES IA5K ataca esses cinco problemas com uma ideia simples: **o projeto inteiro vive em documentos**, e o agente só escreve código depois de ler esses documentos, uma etapa por vez, testando e registrando cada passo.

---

## 2. Princípios

1. **Documento antes de código.** Se não está no PRD e no FSD, não existe. O agente não inventa.
2. **Uma etapa por vez.** Cada etapa do plano é construída, testada e registrada antes da próxima começar.
3. **Sistema criado não é sistema testado.** Toda etapa termina com testes automáticos e com um roteiro para você conferir com as próprias mãos.
4. **Tudo fica registrado.** O progresso vai para `docs/STATUS.md`; todo erro, mesmo já corrigido, vai para `docs/ERROS.md` com causa e correção.
5. **Quem decide a tecnologia é o FSD, não o improviso da IA.** Stack, banco e bibliotecas são escolhidos uma vez, por escrito.
6. **Chats separados por fase.** Cada fase começa num chat novo, que lê os documentos do zero. Isso impede que o contexto antigo contamine a próxima decisão.
7. **Linguagem simples para quem não programa.** Checklists e explicações são escritos para que qualquer pessoa entenda o que foi feito e consiga testar.

---

## 3. Visão geral do fluxo

```
FASE 1 — ANÁLISE (nenhuma linha de código)
  0 Chat de dúvidas
  1 Design System ............ docs/DESIGN.md
  2 Explorar a ideia
  3 PRD ...................... PRD.md
  4 Decisões técnicas ........ DECISOES_TECNICAS.md
  5 FSD ...................... docs/FSD.md
  6 Validar o FSD

FASE 2 — CODIFICAÇÃO
  0 Chat de ajuda
  1 Validar insumos .......... INSUMOS.md
  2 Preparar a estrutura ..... docs/PLANO.md, STATUS.md, ERROS.md, arquivo de contexto
  3 Git e GitHub
  4 Codificar em etapas ...... (repete: código → testes → registro → commit)
  5 Revisão de segurança
  6 Documentação de manutenção  docs/MANUTENCAO.md, docs/COMO-PEDIR-MUDANCAS.md
```

A metodologia termina na documentação. Publicar o sistema na hospedagem de sua escolha fica fora dela.

---

## 4. Fase 1 — Análise

Nesta fase o objetivo é decidir **o que** construir e **como** antes de gastar uma linha de código. Cada passo gera um documento que alimenta o próximo.

### Passo 0 — Chat de dúvidas
Um chat aberto, sem compromisso, para tirar dúvidas de vocabulário e de conceito antes de começar. Não gera documento.

### Passo 1 — Design System (`docs/DESIGN.md`)
Define como a interface vai parecer: cores, tipografia, espaçamentos, componentes, tom de voz. Vem primeiro porque influencia o PRD (o que é possível mostrar) e o FSD (quais componentes existem).

### Passo 2 — Explorar a ideia
O agente faz perguntas, aponta lacunas e sugere caminhos até a ideia ficar clara. É opcional: se você já sabe exatamente o que quer, pule para o PRD.

### Passo 3 — PRD (`PRD.md`)
O **Product Requirements Document** descreve **o que** o sistema faz, em linguagem de negócio: objetivo, público, funcionalidades, regras, o que fica fora do escopo, critérios de aceite. Sem tecnologia.

### Passo 4 — Decisões técnicas (`DECISOES_TECNICAS.md`)
Fixa por escrito as escolhas técnicas: linguagem, framework, banco, ambiente local, hospedagem, autenticação, perfis e permissões, auditoria, exclusão lógica, logs, organização de pastas e demais itens do template (16 seções). Cada decisão tem uma justificativa.

### Passo 5 — FSD (`docs/FSD.md`)
O **Functional Specification Document** junta PRD, Design e Decisões técnicas numa especificação completa: entidades e campos, telas, fluxos, rotas, permissões, validações, mensagens de erro, critérios de pronto e a lista de etapas de construção. É o documento que o agente segue durante toda a codificação.

### Passo 6 — Validar o FSD
Um chat novo, com outro olhar, procura contradições, buracos e ambiguidades no FSD antes que eles virem código. O FSD só é considerado pronto depois dessa validação.

---

## 5. Fase 2 — Codificação

### Passo 0 — Chat de ajuda
Um chat de apoio para dúvidas durante a construção (ex.: "o que é uma migration?"), separado dos chats que constroem.

### Passo 1 — Validar insumos (`INSUMOS.md`)
Confere se tudo que o código vai precisar existe e é coerente: documentos completos, credenciais e variáveis de ambiente listadas, integrações externas definidas, imagens e textos disponíveis.

### Passo 2 — Preparar a estrutura
Cria o esqueleto do projeto e os documentos vivos:

| Documento | Para que serve |
|---|---|
| `docs/PLANO.md` | As etapas de construção, extraídas do FSD, com dependências e critérios de pronto. |
| `docs/STATUS.md` | A memória de progresso: o que foi feito, testado, quando, e qual a próxima etapa. Nasce vazio. |
| `docs/ERROS.md` | A memória técnica: cada erro com causa e correção. Nasce vazio. |
| Arquivo de contexto | `CLAUDE.md` (Claude Code) ou `AGENTS.md` (Codex, Antigravity): stack, regras e protocolo que todo chat lê primeiro. |

### Passo 3 — Git e GitHub
Repositório criado, `.gitignore` protegendo segredos, primeiro commit. A partir daqui, cada etapa concluída vira um commit, o que permite voltar atrás com segurança.

### Passo 4 — Codificar em etapas
O coração da metodologia. Para **cada** etapa do `PLANO.md`, num chat novo:

1. O agente lê o arquivo de contexto, `PLANO.md`, `STATUS.md`, `ERROS.md`, `FSD.md` e `DESIGN.md`.
2. Implementa **somente** aquela etapa, conforme o FSD.
3. Roda os testes automáticos (lint, verificação de tipos, testes, build) e sobe o sistema.
4. Se há interface, confere visualmente contra o `DESIGN.md`, em celular e computador.
5. Registra em `STATUS.md` e `ERROS.md`.
6. Faz o commit.
7. Entrega os checklists (seção 7) e **para**. A próxima etapa só começa com um novo pedido.

As etapas típicas de um sistema: estrutura base, banco de dados, autenticação, interface base, entidades, cadastros (CRUDs), fluxos principais, relatórios, uploads, exportações, integrações, logs, revisão de segurança, revisão de qualidade, documentação e entrega.

### Passo 5 — Revisão de segurança
Feita uma vez, depois que todas as etapas estiverem prontas, num chat novo. Percorre um checklist: injeção de SQL, XSS, CSRF, senhas e hashes, sessão, perfis e permissões, isolamento de dados entre usuários, arquivos sensíveis, variáveis de ambiente, mensagens de erro, logs, validação de entrada, uploads, APIs externas, segredos no código e rotas internas. Cada achado é classificado (crítico, alto, médio, baixo). O agente corrige o que é seguro corrigir e pergunta antes de mudar regra de negócio, fluxo, dados ou arquitetura.

### Passo 6 — Documentação de manutenção
O sistema passa do modo construção para o modo manutenção:

- `docs/MANUTENCAO.md`: como rodar localmente, mapa de pastas, banco de dados, autenticação, como adicionar uma tela, um campo ou uma regra, como testar, cuidados de segurança, o que não fazer.
- `docs/COMO-PEDIR-MUDANCAS.md`: como pedir alterações daqui para frente sem quebrar o que existe.
- O arquivo de contexto é atualizado para o modo manutenção.

---

## 6. Fluxos especiais

| Situação | O que acontece |
|---|---|
| **Edição simples** (bug pequeno, ajuste de texto ou cor) | Corrige direto, atualiza `STATUS.md` e `ERROS.md`, entrega os checklists. Não mexe no PRD. |
| **Recurso novo ou mudança grande** | Atualiza PRD, FSD e demais documentos **antes** do código, abre uma nova etapa no plano e segue etapa por etapa. |
| **Projeto que já tem código, sem documentos** (cold start) | O agente lê o projeto **inteiro**, sem amostragem, e escreve todos os documentos a partir do que encontrou, apontando a origem de cada afirmação. O que não dá para deduzir vira "PENDENTE — confirmar com o usuário". Só então atende o pedido. |
| **Pedido de alteração com o sistema pronto** | Explicar o objetivo, dizer o tipo (visual, funcional, técnica, regra), avisar o que **não** pode mudar, pedir plano antes de executar. |
| **Rollback** | Código volta com Git (`git revert` ou volta para uma tag). Banco só volta com análise, backup e cuidado. Antes, nove perguntas: o problema está no código, na interface, na regra? O banco mudou? Já foi para o GitHub? Já está em produção? Usuários criaram dados depois? Existe backup? Existe uma tag anterior boa? |
| **Erro durante a codificação** | Consultar `ERROS.md` antes de corrigir (o erro pode já ter acontecido), investigar a causa, corrigir, registrar. Nunca "corrigir" apagando o teste. |

---

## 7. Os checklists de entrega

Ao fim de cada etapa o agente entrega, em linguagem simples:

1. **O que foi feito.** Para quem não programa entender.
2. **O que testar e como.** Ação → resultado esperado (ex.: "Clique em *Salvar* com o e-mail vazio → aparece *Informe o e-mail*").
3. **Regressão.** O que já funcionava e precisa continuar funcionando.

Ao concluir uma etapa do `STATUS.md`, vem também o checklist acumulado de todas as etapas já feitas.

---

## 8. A matriz de impacto

Toda mudança é classificada pelo que ela afeta, não pelo tamanho aparente do pedido. Cada linha diz qual documento precisa ser atualizado:

| A mudança mexe em... | Atualizar |
|---|---|
| Funcionalidade nova, alterada ou removida; regra de negócio | `PRD.md` + `docs/FSD.md` |
| Entidade, tabela, campo, migration, rota, endpoint, tela, fluxo | `docs/FSD.md` |
| Stack, banco, biblioteca, hospedagem, autenticação, perfil, permissão | `DECISOES_TECNICAS.md` |
| Variável de ambiente, configuração, integração externa, dependência | `INSUMOS.md` + `DECISOES_TECNICAS.md` |
| Cor, fonte, espaçamento, componente, padrão visual | `docs/DESIGN.md` |
| Etapa nova descoberta no caminho | `docs/PLANO.md` |
| Jeito de rodar, testar ou contribuir | Arquivo de contexto |

Ao fechar cada tarefa, o agente diz quais documentos atualizou e, para os que não atualizou, por que não precisou.

---

## 9. O protocolo P1–P8 (a cada pedido)

Enquanto a metodologia está ativa, todo pedido segue a mesma sequência:

| Passo | O que o agente faz |
|---|---|
| **P1 Ler** | Mapeia o código relevante antes de opinar ou editar, sem ler arquivos inteiros à toa. |
| **P2 Documentos** | Se falta algum documento, faz o cold start antes de qualquer código. |
| **P3 Classificar** | Aplica a matriz de impacto; recurso novo atualiza os documentos antes do código. |
| **P4 Planejar** | Registra a tarefa no `PLANO.md` e abre a etapa no `STATUS.md`. |
| **P5 Executar** | Uma etapa, conforme FSD e DESIGN. Nada fora do FSD. |
| **P6 Testar** | Lint, tipos, testes, build, servidor; conferência visual se houver tela. |
| **P7 Registrar** | `STATUS.md`, `ERROS.md` e todo documento que a matriz apontar. |
| **P8 Entregar** | Commit + os três checklists. |

---

## 10. Como as regras são garantidas em cada agente

| | Claude Code | Codex | Antigravity |
|---|---|---|---|
| Arquivo de contexto | `CLAUDE.md` | `AGENTS.md` | `AGENTS.md` |
| Ativação | `/apes-ia5k` (vale para a sessão e o projeto até `/apes-ia5k off`) | Pedir "use a skill apes-ia5k" | Pedir "use a skill apes-ia5k" |
| Protocolo injetado em todo pedido | Sim, por hook | Escrito no `AGENTS.md` | Escrito no `AGENTS.md` |
| Bloqueio de código sem documentos | Sim, por hook | Por instrução | Por instrução |
| Cobrança do `STATUS.md` antes de encerrar | Sim, por hook | Por instrução | Por instrução |

**Projeto usado com mais de um agente:** mantenha o conteúdo em `AGENTS.md` e deixe no `CLAUDE.md` apenas a linha `@AGENTS.md`. O Claude Code importa o arquivo e todos leem as mesmas regras.

### Os hooks do Claude Code

| Hook | Script | Função |
|---|---|---|
| `UserPromptSubmit` | `ia5k-context.sh` | Liga e desliga o modo e injeta o protocolo com o estado real dos documentos. |
| `PreToolUse` (edição) | `ia5k-guard.sh` | Bloqueia edição de código enquanto faltar `PRD.md`, `docs/FSD.md`, `docs/PLANO.md`, `docs/STATUS.md` ou `docs/ERROS.md`. |
| `PreToolUse` (leitura) | `ia5k-p1-guard.sh` | Exige o mapeamento do código por grafo antes de ler arquivo por arquivo (só se o `tokensave` estiver instalado). |
| `PostToolUse` | `ia5k-p1-marca.sh`, `ia5k-registrar-edicao.sh` | Marca que o mapeamento foi feito e anota os arquivos alterados. |
| `Stop` | `ia5k-stop-guard.sh` | Não deixa encerrar se houve código alterado sem `STATUS.md` atualizado. |
| `SessionStart` | `verificar-ferramentas.sh` | Confere as ferramentas de economia de tokens e instala as que faltarem em segundo plano. |

O estado do modo fica em `~/.ia5k/`. Limite conhecido: os hooks cobrem as ferramentas de edição do Claude Code, não a escrita feita por comandos de terminal.

---

## 11. Ferramentas de economia de tokens (opcionais)

A metodologia funciona sem elas, mas fica mais barata com elas: `tokensave` e `code-review-graph` (mapeiam o código em grafo, para o agente não ler arquivos inteiros), `rtk` (filtra a saída do terminal), `graphify` (transforma documentos longos em grafo) e `tokenoptim`. Detalhes de instalação e uso em `references/ferramentas-token.md`.

---

## 12. Glossário rápido

| Termo | Significado |
|---|---|
| PRD | Documento de requisitos do produto: o que o sistema faz. |
| FSD | Especificação funcional: como cada parte funciona, em detalhe. |
| Etapa / fase | Um pedaço do sistema construído e testado de uma vez. |
| Arquivo de contexto | `CLAUDE.md` ou `AGENTS.md`: as regras que o agente lê primeiro. |
| Cold start | Primeira vez da metodologia num projeto que já tem código. |
| Regressão | Algo que funcionava e parou de funcionar depois de uma mudança. |
| CRUD | Criar, ler, atualizar e excluir registros (um cadastro completo). |
| Migration | Script versionado que cria ou altera tabelas do banco. |
| Rollback | Voltar o sistema para uma versão anterior. |
