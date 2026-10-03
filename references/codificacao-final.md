# Referência APES IA5K — Codificação final: Documentação, manutenção e rollback

> **Arquivo de contexto do projeto:** `CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity.

# Grupo 10 — APES IA5K: Passo 6 (Documentação)

Extração metodológica minuciosa do capítulo `codificacao-11.txt` (Passo 6 — Documentação).

---

## 1. Visão geral do grupo

Este grupo cobre o **fechamento do projeto**: a preparação do sistema construído para **manutenção futura** (Passo 6). A metodologia termina na documentação; depois dela, o usuário publica o sistema na hospedagem que escolher (fora da metodologia).

- **Passo 6 — Documentação** (`codificacao-11.txt`): cria a documentação final de manutenção e coloca o arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity) em **"modo manutenção"**. O sistema já foi construído em fases, testado e passou pela revisão de segurança (Passo 5). Esta etapa NÃO cria novas funcionalidades. Ela responde à pergunta central: "Como alguém vai alterar este sistema depois?" (essa pessoa pode ser você, outro membro da equipe ou outra IA em um novo chat).

Posição no fluxo geral (segundo os capítulos): o Passo 6 é usado **depois da revisão de segurança** (Passo 5) e é o último passo da metodologia.

**Atenção específica da metodologia sobre modelos:** os prompts dos passos são "generalistas, sem stack fixa" e citam o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity). O passo deve ser executado **em um chat novo com raciocínio**.

---

## 2. Capítulo: `codificacao-11.txt` — Passo 6: Documentação

### 2.1. Objetivo do capítulo

Preparar o projeto para o futuro, criando documentação de manutenção que reduza o esforço de alterações futuras. Sem documentação, cada mudança vira uma investigação (a IA precisa reler arquivos, entender estrutura, descobrir onde cada coisa está, identificar padrões e evitar quebrar o que funciona). A documentação final funciona como **um manual do sistema pronto**.

### 2.2. Motivação e problema resolvido

- Sistemas continuam mudando depois de prontos: adicionar um campo; corrigir uma regra; mudar um texto; criar um relatório; alterar uma permissão; ajustar uma tela; trocar uma integração; corrigir um erro encontrado por um usuário.
- Sem documentação, a próxima alteração começa com perguntas como: Onde fica a tela de cadastro? Como o banco foi criado? Como rodo o projeto localmente? Qual arquivo controla as permissões? Como adiciono um campo novo? Como testo antes de publicar? Quais arquivos não devo mexer? Quais cuidados de segurança preciso manter?
- O prompt do passo resolve isso criando **documentos para manutenção**.

### 2.3. Conceito: Documentação de manutenção

Documentação de manutenção é um **conjunto de instruções que explica como o sistema foi organizado e como ele deve ser alterado no futuro**. Não é feita para o usuário final — é feita para quem vai **cuidar do sistema por dentro**. Analogia do carro: o motorista precisa saber dirigir, mas o mecânico precisa saber onde ficam as peças, qual óleo usar, quais cuidados tomar, como desmontar sem quebrar.

### 2.4. Quando usar

- Usar **depois da revisão de segurança** (Passo 5).
- NÃO serve para criar novas funcionalidades. Serve para documentar o que já foi construído e preparar o projeto para mudanças futuras.

### 2.5. O que será criado nesta etapa

A IA deve criar ou atualizar estes documentos (bloco "Copiar" da metodologia):

```
docs/MANUTENCAO.md
docs/COMO-PEDIR-MUDANCAS.md
CLAUDE.md ou AGENTS.md (arquivo de contexto)
docs/STATUS.md
```

### 2.6. Descrição dos arquivos principais

**`docs/MANUTENCAO.md`** — principal documento técnico para mudanças futuras. Deve explicar:
- o que o sistema faz;
- qual stack foi usada;
- como rodar localmente;
- como o projeto está organizado;
- como o banco de dados funciona;
- como adicionar telas, campos ou regras;
- como testar alterações;
- quais cuidados de segurança manter.

Deve ser **objetivo**: não precisa explicar cada linha de código, mas precisa orientar bem o suficiente para que uma pessoa ou uma IA consiga mexer no projeto sem começar do zero.

**`docs/COMO-PEDIR-MUDANCAS.md`** — voltado para o **usuário leigo**. Deve mostrar exemplos prontos de pedidos para fazer alterações futuras com IA. Exemplo de pedido-modelo dado pela metodologia (bloco "Copiar"):

```
Leia `docs/MANUTENCAO.md`, `docs/FSD.md` e `docs/STATUS.md`.

Quero adicionar o campo "telefone" ao cadastro de clientes.

Faça a alteração com cuidado:
- atualize o banco ou migration, se necessário;
- atualize o formulário;
- atualize a listagem;
- valide o campo;
- teste localmente;
- atualize `docs/STATUS.md`;
- registre erros em `docs/ERROS.md`, se houver.

No final, me diga como testar.
```

Contraste mostrado pela metodologia: em vez de dizer apenas "Coloque telefone no cadastro.", o usuário aprende a fazer um pedido melhor que orienta a IA a mexer nas partes certas.

**arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`)** — atualizado para **modo manutenção**. Durante a construção orientou a IA a criar o sistema; agora é ajustado para manutenção. Não significa apagar as regras anteriores; significa **reforçar o novo modo de trabalho**. A partir daqui o sistema não está mais começando do zero, então arquivo de contexto deve orientar a IA a:
- ler a documentação antes de alterar;
- não refazer o sistema;
- não mudar arquitetura sem necessidade;
- preservar funcionalidades existentes;
- testar antes de concluir;
- atualizar STATUS.md;
- registrar erros em ERROS.md;
- manter cuidados de segurança.

Motivo: uma IA em um chat futuro pode tentar "melhorar" demais o projeto e reescrever partes que não precisava. **O modo manutenção evita esse comportamento.**

### 2.7. Vocabulário técnico (tabela do capítulo)

| Termo | Explicação simples |
|---|---|
| Manutenção | Alterações feitas em um sistema depois que ele já foi construído. |
| Evolução | Melhorias ou novas funcionalidades adicionadas ao sistema com o tempo. |
| Documentação técnica | Explicação organizada sobre como o sistema funciona por dentro. |
| Modo manutenção | Forma de orientar a IA quando o sistema já está pronto e precisa apenas ser alterado. |
| Mapa de pastas | Explicação sobre o que fica em cada pasta do projeto. |
| Migration | Arquivo ou mecanismo usado para criar ou alterar a estrutura do banco de dados. |
| Arquivo de contexto | Arquivo que orienta a IA sobre como trabalhar naquele projeto. |
| Regressão | Quando uma alteração nova quebra algo que já funcionava antes. |

### 2.8. PROMPT DO PASSO 6 (bloco "Copiar" — transcrição VERBATIM)

**Título na metodologia: "Prompt do passo 6"** — precedido pelas notas: "Abaixo está uma versão generalista do prompt, sem stack fixa. Ela cita o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity). ATENÇÃO: Execute este prompt em um chat novo com raciocínio."

Texto integral do prompt:

---

Responda sempre em **português do Brasil**.

Você é responsável por deixar o projeto **fácil de manter, corrigir e evoluir** no futuro.

Sua missão é criar a documentação final de manutenção do sistema e atualizar o arquivo de contexto para que uma IA em chats futuros consiga trabalhar com segurança.

Não crie novas funcionalidades nesta etapa.

Não faça deploy nesta etapa.

## 1. Reconstruir o contexto

Leia integralmente, nesta ordem:

- arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`)
- `docs/FSD.md`
- `docs/DESIGN.md`
- `docs/INSUMOS.md`
- `docs/PLANO.md`
- `docs/STATUS.md`
- `docs/ERROS.md`

Depois, revise a estrutura atual do projeto e os arquivos principais do código.

Identifique:

- stack do projeto;
- arquitetura;
- ambiente de desenvolvimento;
- ambiente de produção;
- estrutura de pastas;
- comandos para instalar, rodar, testar, migrar banco, validar ou fazer build;
- banco de dados ou mecanismo de persistência, se houver;
- estratégia de autenticação, se houver;
- estratégia de autorização, se houver;
- principais módulos construídos;
- arquivos de configuração;
- dependências principais;
- pontos de segurança que precisam ser preservados;
- erros importantes registrados em `docs/ERROS.md`.

Não presuma PHP, MySQL, XAMPP, Laravel, Node.js, Python, Supabase, Firebase, Next.js ou qualquer outra tecnologia se isso não estiver definido no FSD, no arquivo de contexto ou no código do projeto.

## 2. Conferir se o projeto está pronto para documentação final

Antes de documentar, confira `docs/STATUS.md`.

Se ainda houver fases funcionais pendentes, avise o usuário que a documentação final idealmente deve ser feita depois da conclusão das fases.

Se a revisão de segurança ainda não foi executada, avise que esta documentação pode ficar incompleta e recomende executar primeiro o prompt do passo 5.

Se o usuário decidir continuar mesmo assim, registre no `docs/STATUS.md` que a documentação foi criada com pendências.

## 3. Criar `docs/MANUTENCAO.md`

Crie o arquivo `docs/MANUTENCAO.md`.

Ele deve ser claro, objetivo e útil para uma pessoa ou IA que precise alterar o sistema no futuro.

Inclua, no mínimo, estas seções:

### Visão geral

Explique:

- o que o sistema faz;
- para quem ele foi criado;
- quais problemas resolve;
- quais módulos principais existem.

### Stack e ambientes

Explique:

- linguagem;
- framework, se houver;
- banco de dados ou persistência;
- bibliotecas importantes;
- ambiente local;
- ambiente de produção;
- comandos principais.

### Como rodar localmente

Explique o passo a passo para iniciar o sistema no ambiente de desenvolvimento definido no FSD.

Inclua comandos quando existirem.

Não invente comandos. Use apenas os comandos reais da stack ou os definidos no projeto.

### Mapa de pastas

Explique as principais pastas e arquivos do projeto.

Para cada pasta importante, diga:

- o que ela guarda;
- quando mexer nela;
- cuidados importantes.

### Banco de dados e persistência

Se o projeto usar banco de dados ou outro mecanismo de persistência, explique:

- onde ficam migrations, schemas, models ou arquivos equivalentes;
- como criar ou aplicar alterações;
- como rodar migrations ou comandos equivalentes;
- onde ficam dados iniciais, seeders ou scripts;
- cuidados antes de alterar estrutura de dados.

Se o projeto não usar banco de dados, informe isso claramente.

### Autenticação, autorização e usuários

Se o sistema tiver login, perfis ou permissões, explique:

- como o login funciona de forma geral;
- quais perfis existem;
- onde as permissões são verificadas;
- cuidados ao criar novas telas ou rotas protegidas.

### Como adicionar uma nova tela

Explique, em passos curtos, como uma pessoa ou IA deve adicionar uma nova tela respeitando a arquitetura do projeto.

Inclua quais arquivos ou pastas normalmente precisam ser alterados.

### Como adicionar um novo campo

Explique, em passos curtos, como adicionar um campo a um cadastro existente.

Quando aplicável, mencione:

- alteração de banco ou schema;
- atualização de model ou equivalente;
- atualização de formulário;
- atualização de validação;
- atualização de listagem;
- atualização de testes;
- atualização da documentação.

### Como adicionar uma nova regra de negócio

Explique como alterar uma regra sem quebrar o sistema.

Oriente a IA a sempre conferir o FSD, localizar onde a regra é aplicada, alterar com cuidado e testar cenários principais e de erro.

### Como testar alterações

Explique:

- quais comandos de teste existem;
- como fazer testes manuais;
- quais fluxos principais devem ser testados;
- como verificar erros ou logs;
- quando atualizar `docs/ERROS.md`.

### Cuidados de segurança

Liste os cuidados de segurança que devem ser mantidos em qualquer alteração, conforme a stack do projeto.

Considere, quando aplicável:

- autenticação;
- autorização;
- controle de sessão;
- validação de entradas;
- proteção contra injeção;
- proteção contra XSS;
- proteção contra CSRF;
- isolamento de dados;
- proteção de arquivos sensíveis;
- logs;
- uploads;
- APIs externas;
- segredos e variáveis de ambiente.

### Como registrar progresso

Explique que toda alteração futura deve atualizar:

- `docs/STATUS.md`;
- `docs/ERROS.md`, se houver erro.

### O que não fazer

Inclua alertas como:

- não reescrever o sistema sem necessidade;
- não alterar stack sem decisão explícita;
- não remover segurança para "resolver rápido";
- não versionar segredos;
- não ignorar testes;
- não mexer em várias áreas sem explicar o impacto.

## 4. Criar `docs/COMO-PEDIR-MUDANCAS.md`

Crie o arquivo `docs/COMO-PEDIR-MUDANCAS.md`.

Esse arquivo deve ajudar uma pessoa leiga a pedir alterações futuras para uma IA.

Inclua:

- explicação simples sobre como pedir mudanças;
- orientação para sempre pedir que a IA leia `docs/MANUTENCAO.md`, `docs/FSD.md`, `docs/DESIGN.md`, `docs/STATUS.md` e `docs/ERROS.md`;
- modelos de prompts prontos;
- checklist antes de aceitar uma alteração.

Inclua exemplos de prompts para:

1. Adicionar um campo em um cadastro.
2. Criar uma nova tela.
3. Corrigir um erro.
4. Alterar uma regra de negócio.
5. Ajustar visual conforme o `docs/DESIGN.md`.
6. Criar um relatório ou filtro, se fizer sentido para o projeto.
7. Revisar segurança depois de uma mudança.
8. Preparar uma alteração para commit.

Use exemplos adaptados à stack e ao tipo de sistema construído.

Não use exemplos genéricos demais se o projeto permitir exemplos mais concretos.

## 5. Atualizar o arquivo de contexto para modo manutenção

Atualize o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) para o **modo manutenção**.

O arquivo de contexto deve orientar a IA em futuras mudanças.

Inclua:

- idioma: responder sempre em português do Brasil;
- stack e arquitetura do projeto;
- resumo da estrutura;
- documentos obrigatórios para ler antes de alterar;
- protocolo para mudanças futuras;
- regras de segurança;
- cuidados para não quebrar funcionalidades existentes;
- orientação para testar antes de concluir;
- orientação para atualizar `docs/STATUS.md`;
- orientação para registrar erros em `docs/ERROS.md`;
- orientação para fazer commit depois de alterações relevantes.

Inclua este protocolo:

Antes de qualquer alteração:
1. Ler docs/MANUTENCAO.md.
2. Ler docs/FSD.md.
3. Ler docs/DESIGN.md, se a alteração envolver interface.
4. Ler docs/STATUS.md.
5. Ler docs/ERROS.md.
6. Entender o pedido do usuário.
7. Explicar o plano antes de alterar arquivos.

Depois de qualquer alteração:
1. Testar o que foi alterado.
2. Atualizar docs/STATUS.md.
3. Registrar erro e solução em docs/ERROS.md, se houver.
4. Fazer commit ou entregar os comandos.
5. Explicar ao usuário como validar.

## 6. Atualizar `docs/STATUS.md`

Atualize `docs/STATUS.md` registrando:

- documentação final criada;
- `docs/MANUTENCAO.md` criado;
- `docs/COMO-PEDIR-MUDANCAS.md` criado;
- arquivo de contexto atualizado para modo manutenção;
- pendências, se houver;
- próximo passo recomendado.

## 7. Registrar erros, se houver

Se algum problema aparecer durante esta etapa, registre em `docs/ERROS.md`:

## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:

## 8. Versionar a documentação

Depois de criar e atualizar os documentos, verifique o Git:

`git status`

Confirme que nenhum segredo será versionado.

Depois faça commit com uma mensagem clara, por exemplo:

`git add .`
`git commit -m "Documentação final de manutenção"`

Se não puder executar o commit, entregue os comandos para o usuário copiar.

Lembre o usuário de fazer:

`git push`

## 9. Entregar ao usuário

Ao final, entregue:

1. Resumo do que foi criado.
2. Principais pontos do `docs/MANUTENCAO.md`.
3. Principais exemplos criados em `docs/COMO-PEDIR-MUDANCAS.md`.
4. Confirmação de atualização do arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`).
5. Confirmação de atualização do `docs/STATUS.md`.
6. Confirmação de atualização do `docs/ERROS.md`, se houve erro.
7. Confirmação de commit ou comandos para o usuário executar.
8. Próximo passo.

Use esta frase final:

Documentação pronta. Próximo passo: o sistema está documentado e pronto para ser publicado na hospedagem que você escolher.

Lembre-se: esta etapa documenta o sistema para manutenção futura. Não crie novas funcionalidades e não faça deploy agora.

---

### 2.9. Prompts auxiliares do Passo 6 (transcrição VERBATIM)

**Título: "Prompt para pedir documentação mais simples"** — "Se a IA criar uma documentação técnica demais, use:"

---

Reescreva a documentação com linguagem mais simples.

O público é uma pessoa que pode não saber programar profundamente, mas vai usar uma IA para pedir alterações futuras.

Mantenha os termos técnicos necessários, mas explique cada um de forma breve.
Não remova informações importantes.

---

**Título: "Prompt para completar documentação incompleta"** — "Se a IA esquecer alguma seção importante, use:"

---

Revise `docs/MANUTENCAO.md`.

Confira se ele explica:
- visão geral do sistema;
- stack e ambientes;
- como rodar localmente;
- mapa de pastas;
- banco de dados ou persistência;
- autenticação e permissões, se houver;
- como adicionar tela;
- como adicionar campo;
- como alterar regra;
- como testar;
- cuidados de segurança;
- como atualizar STATUS.md e ERROS.md.

Complete o que estiver faltando.

---

**Título: "Prompt para revisar exemplos de mudanças futuras"** — "Se o arquivo COMO-PEDIR-MUDANCAS.md ficar genérico demais, use:"

---

Revise `docs/COMO-PEDIR-MUDANCAS.md`.

Os exemplos estão genéricos demais.

Adapte os exemplos ao sistema real descrito em `docs/FSD.md`.

Crie exemplos de pedidos para mudanças que façam sentido neste projeto.

---

### 2.10. Regras, avisos e boas práticas do Passo 6

- Etapa não cria novas funcionalidades e não faz deploy.
- Usar depois da revisão de segurança (Passo 5); se a revisão não foi feita, avisar e recomendar executar o prompt do passo 5 antes.
- Se houver fases funcionais pendentes, avisar que a documentação final idealmente deve vir depois da conclusão das fases.
- Se o usuário continuar mesmo assim, registrar em `docs/STATUS.md` que a documentação foi criada com pendências.
- MANUTENCAO.md deve ser objetivo e NÃO inventar comandos (usar apenas comandos reais da stack ou definidos no projeto).
- Modo manutenção evita que uma IA futura "melhore" demais e reescreva partes que não precisava.
- Sempre confirmar com `git status` que nenhum segredo será versionado antes do commit.
- O prompt cita o arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).

### 2.11. Erros comuns e como resolver (Passo 6)

- **Documentação técnica demais** → usar o prompt "Prompt para pedir documentação mais simples".
- **Seção importante faltando no MANUTENCAO.md** → usar o prompt "Prompt para completar documentação incompleta" (a lista de 12 seções funciona como checklist).
- **COMO-PEDIR-MUDANCAS.md genérico demais** → usar o prompt "Prompt para revisar exemplos de mudanças futuras" para adaptar os exemplos ao sistema real do FSD.

---

## 4. Itens acionáveis — documentos, pastas, comandos e prompts que um desenvolvedor precisa executar

### 4.1. Arquivos/pastas a criar ou atualizar (Passo 6)

- `docs/MANUTENCAO.md` (novo — seções mínimas listadas no prompt do passo 6).
- `docs/COMO-PEDIR-MUDANCAS.md` (novo — 8 tipos de exemplos de prompt).
- arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity) — atualizar para "modo manutenção", incluindo o protocolo antes/depois de qualquer alteração.
- `docs/STATUS.md` — atualizar com o que foi criado e pendências.
- `docs/ERROS.md` — registrar erros no formato `## <data> - <título curto do erro>` com Sintoma/Causa/Solução aplicada/Como evitar no futuro.

### 4.2. Prompts prontos para dar à IA (resumo)

1. **Prompt do passo 6** — criar documentação final de manutenção + modo manutenção no arquivo de contexto.
2. **Prompt para pedir documentação mais simples** — reescrever documentação com linguagem simples.
3. **Prompt para completar documentação incompleta** — conferir as 12 seções de MANUTENCAO.md e completar o que falta.
4. **Prompt para revisar exemplos de mudanças futuras** — adaptar exemplos de COMO-PEDIR-MUDANCAS.md ao sistema real do FSD.

### 4.3. Pontos-chave de segurança a reter

- Credenciais de banco/e-mail: nunca em docs, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), README, GitHub, prints, prompts públicos ou mensagens de grupo.
- Antes de rodar migrations em produção: backup + teste local + versão correta do PHP.

---

## 5. Avisos sobre conteúdo ausente

- O Passo 6 (`codificacao-11.txt`) não contém: workflows/código YAML, tabela de erros comuns estruturada (apenas prompts corretivos), nem comandos de publicação.

# Grupo 11 — Manutenção: Pedindo Alterações e Rollback

## 1. Visão geral do grupo

Este grupo cobre a **manutenção de sistemas já prontos** — a fase seguinte à construção, validação, segurança, documentação e publicação. A metodologia afirma: "um sistema não termina quando fica pronto". Depois que o sistema começa a ser usado, surgem novas necessidades (melhoria visual, ajuste de texto, nova regra, alteração em relatório, correção de permissão, melhoria de usabilidade).

O grupo é dividido em duas etapas:

1. **Pedindo alterações** (codificacao-13.txt): como pedir uma mudança para a IA sem bagunçar o projeto, sem pular documentação e sem transformar uma melhoria simples em uma reescrita desnecessária.
2. **Rollback: como voltar uma versão do sistema com segurança** (codificacao-14.txt): como desfazer uma alteração e retornar o sistema para um estado anterior, usando Git, GitHub, produção e banco de dados, com um caminho seguro para iniciantes.

O fio condutor é: **conduzir a IA com cuidado** (leitura de documentação, limite de escopo, plano antes de agir, atualização de documentação, commit) e **nunca improvisar** rollback (investigar antes, planejar, testar, documentar e versionar).

---

# Capítulo: codificacao-13.txt — "Pedindo uma alteração depois do sistema pronto"

## 2.1 Objetivo do capítulo

Mostrar, por meio de um exemplo real, como pedir uma alteração à IA após a conclusão do sistema — de forma controlada, sem bagunçar o projeto, sem pular documentação e sem transformar uma melhoria simples em uma reescrita desnecessária. O exemplo usa um sistema financeiro concluído cujo Dashboard (tela principal de visão geral) deve ficar "mais elegante, moderno e bonito, sem alterar regras de negócio".

**Cenário do exemplo:** o sistema financeiro já estava concluído. A alteração envolve principalmente: layout, Bootstrap, ícones, menu, nome do sistema e organização visual. **Não** é mudança de banco de dados, **não** é nova funcionalidade financeira, **não** é alteração de regra de negócio — é uma **melhoria de interface** (front-end).

## 2.2 Passos EXATOS na ordem (ciclo completo da alteração)

O capítulo apresenta o ciclo completo de manutenção com IA:

1. **Pedir alteração com contexto** (ler documentação + objetivo + escopo).
2. **Limitar o escopo** (dizer o que pode e o que não pode ser alterado).
3. **Pedir plano antes de alterar.**
4. **Revisar proposta visual** (imagem/modelo do layout).
5. **Ajustar com base em imagens ou preferências** (segundo prompt).
6. **Aplicar alteração** (após aprovação).
7. **Conferir documentação** (alinhamento de documentação).
8. **Verificar necessidade de commit.**

## 2.3 PROMPTS COMPLETOS (transcrição verbatim)

### Prompt do índice — Exemplo de pedido vago que deve ser evitado

> Copiar
>
> Deixe o dashboard mais bonito.

O livro explica que esse pedido é compreensível, mas vago demais: a IA pode tentar mudar muitas coisas ao mesmo tempo, alterar arquivos desnecessários, mexer no back-end, trocar bibliotecas, mudar regras de negócio ou ignorar a documentação do projeto.

### Primeiro prompt: pedido principal de alteração

> ATENÇÃO: Execute este prompt em um chat novo. Não é necessário raciocínio.
>
> Leia os seguintes arquivos de documentação do projeto para entender o contexto atual:
> - arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
> - `docs/MANUTENCAO.md`
> - `docs/FSD.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Objetivo:
> Quero deixar a interface do Dashboard mais elegante, moderna e bonita. Atue como um designer especialista em UI/UX (interfaces de sistemas web) e desenvolvedor front-end.
>
> Instruções específicas de design:
> 1. Melhore o layout visual do Dashboard usando as classes do Bootstrap já existentes no projeto (ajuste espaçamentos, cores de cartões, tipografia, se necessário).
> 2. Adicione ícones contextuais nos blocos de informação (KPIs) e menus. Use a biblioteca Font Awesome (verifique no FSD esta biblioteca já está inclusa ou se precisa ser instalada).
> 3. Corrija a exibição do nome do sistema no topo/menu para incluir um espaço, ficando exatamente assim: "Finanças Simples".
>
> Atenção:
> Esta é uma alteração puramente visual e de interface (Front-end). Não há necessidade de alterar tabelas do banco de dados ou regras de negócio nos controladores (Back-end), a menos que seja estritamente necessário para passar as variáveis de contagem para a View.
>
> Próximo passo:
> Antes de alterar qualquer arquivo, crie e me apresente um plano de implementação detalhado listando quais arquivos de visualização (views/css/layouts) serão modificados e o que será feito em cada um. Aguarde minha aprovação para avançar.
>
> Se possível me apresente uma imagem com o modelo do layout para aprovação.

**Por que esse prompt é bom** (o que ele informa à IA): quais arquivos consultar; qual o objetivo da alteração; qual papel a IA deve assumir; quais recursos visuais usar; qual texto precisa ser corrigido; que a mudança é de front-end; que banco de dados não deve ser alterado; que regras de negócio não devem ser alteradas; que a IA deve apresentar um plano antes de agir.

### Frase de proteção de escopo (bloco "Copiar" dentro da seção "A importância de limitar o escopo")

> Copiar
>
> Esta é uma alteração puramente visual e de interface (Front-end).

"Escopo é o limite do que será feito." Esta frase protege o projeto, orientando a IA a não mexer em tabelas, regras financeiras, controladores ou banco de dados sem necessidade.

### Segundo prompt: ajuste com base nas imagens

> Nota do livro: "Observe que para este exemplo é necessário anexar o print da tela."
>
> Copiar
>
> Veja as imagens anexas. Acho que estas opções poderiam ficar em uma NavBar conforme estava descrito no plano apresentado.

**Por que funciona:** não abre novo escopo; não diz "Refaça tudo" (pedido que deve ser evitado — citado como bloco "Copiar" negativo); aponta um ajuste específico ("colocar as opções em uma NavBar") e conecta o pedido ao plano já apresentado, ajudando a IA a manter continuidade.

### Terceiro prompt: alinhamento de documentação

> Copiar
>
> ## Alinhamento de documentação
> Com essas alterações aplicadas, talvez seja necessário alterar alguns arquivos de configuração e contexto.
>
> Verifique se é necessário alterar os arquivos MANUTENCAO.md, INSUMOS.md, FSD.md, o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), DESIGN.md ou outros arquivos da pasta `docs/` para deixar tudo pronto para alterações futuras.

**Explicação do livro:** a palavra importante é **"Verifique"** — a IA deve analisar a necessidade, não alterar automaticamente tudo sem critério. Exemplos de impacto a considerar: se Font Awesome foi adicionado, isso pode entrar na documentação; se o layout do Dashboard mudou, registrar no STATUS; se o padrão visual mudou, afeta o DESIGN; se a manutenção futura precisa saber da nova estrutura, entra no MANUTENCAO; se o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) orienta a IA sobre padrões visuais, talvez precise ser atualizado.

### Quarto prompt: verificar commit

> Copiar
>
> Verifique se é necessário fazer um commit.

"Esse pedido fecha o ciclo da alteração." Commit é o registro da mudança no Git; depois de uma alteração real, normalmente é recomendado registrar a mudança com mensagem clara.

### Exemplo de pedido ruim (evitar)

> Copiar
>
> Melhore o dashboard e pronto.

Esse tipo de pedido é muito menos seguro que o ciclo completo descrito acima.

### Prompt de apoio para testar a alteração

> Copiar
>
> Crie um roteiro de teste manual para validar esta alteração.
>
> Considere:
> - o que mudou na interface;
> - o que não deveria ter mudado;
> - quais telas preciso abrir;
> - quais ações preciso executar;
> - qual resultado esperado;
> - como identificar se algo quebrou.
>
> Explique em linguagem simples.

Esse prompt ajuda a validar a alteração **antes do commit ou antes do próximo deploy**.

## 2.4 Modelos/estruturas de documentos citados

Arquivos de documentação que o pedido de alteração deve mandar a IA ler:

- arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) (no primeiro prompt; também citado na documentação do terceiro prompt)
- `docs/MANUTENCAO.md` — explica como o sistema foi organizado e como deve ser mantido
- `docs/FSD.md` — mostra as regras e decisões do sistema
- `docs/STATUS.md` — mostra o estado atual do projeto
- `docs/ERROS.md` — mostra problemas anteriores e soluções aplicadas
- `docs/INSUMOS.md` — citado no terceiro prompt (alinhamento de documentação)
- `docs/DESIGN.md` — citado no terceiro prompt (alinhamento de documentação)

Função de cada arquivo, segundo o livro:
- `docs/MANUTENCAO.md` explica como o sistema foi organizado e como deve ser mantido.
- `docs/FSD.md` mostra as regras e decisões do sistema.
- `docs/STATUS.md` mostra o estado atual do projeto.
- `docs/ERROS.md` mostra problemas anteriores e soluções aplicadas.

## 2.5 Modelo geral para pedidos de alteração (estrutura reutilizável)

Com base no exemplo, um bom pedido de alteração deve dizer:

- **qual documentação a IA deve ler;**
- **qual é o objetivo da mudança;**
- **o que pode ser alterado;**
- **o que não deve ser alterado;**
- **quando a IA deve pedir aprovação;**
- **se a documentação precisa ser atualizada;**
- **se deve haver commit.**

Estrutura passo a passo do modelo geral:
1. Leia a documentação.
2. Explique o objetivo.
3. Diga o tipo de alteração.
4. Liste instruções específicas.
5. Diga o que não deve ser alterado.
6. Peça plano antes da execução, se necessário.
7. Peça atualização de documentação.
8. Peça verificação de commit.

## 2.6 Quando pedir plano antes de alterar

Peça plano antes de alterar quando:
- a mudança mexe em várias telas;
- a mudança pode afetar back-end;
- a mudança envolve banco de dados;
- a mudança altera permissões;
- a mudança altera fluxo do usuário;
- a mudança envolve deploy;
- a mudança pode quebrar algo existente;
- você ainda não tem certeza do melhor caminho.

Para alterações pequenas (ex.: corrigir um texto simples), talvez não seja necessário um plano detalhado. Mas, quando houver dúvida, peça o plano. Em alterações de sistemas prontos, o ideal é: **primeiro a IA propõe, depois o usuário aprova, só então ela implementa.**

## 2.7 Checklist para pedidos de alteração (transcrito)

> Copiar
>
> [ ] Informei quais documentos a IA deve ler.
> [ ] Expliquei o objetivo da alteração.
> [ ] Defini se é alteração visual, funcional, técnica ou de regra.
> [ ] Avisei o que não deve ser alterado.
> [ ] Pedi plano antes de executar, se necessário.
> [ ] Pedi para preservar regras do FSD.
> [ ] Pedi para manter documentação atualizada.
> [ ] Pedi para verificar necessidade de commit.
> [ ] Testei depois da alteração.

## 2.8 Vocabulário especializado (tabela Termo/Explicação)

| Termo | Explicação simples |
|---|---|
| Manutenção | Alteração feita em um sistema depois que ele já foi construído. |
| Dashboard | Tela principal que mostra informações importantes do sistema. |
| KPI | Indicador visual que resume uma informação importante, como saldo, total ou quantidade. |
| Front-end | Parte visual do sistema, que o usuário vê e usa. |
| Back-end | Parte interna do sistema, onde ficam regras, processamento e acesso ao banco. |
| View | Arquivo responsável por exibir uma tela ou parte visual do sistema. |
| Layout | Organização visual dos elementos na tela. |
| Navbar | Barra de navegação, geralmente usada no topo do sistema. |
| Bootstrap | Biblioteca CSS que ajuda a criar telas responsivas e organizadas. |
| Font Awesome | Biblioteca de ícones usada em sites e sistemas. |
| Commit | Registro de uma alteração no Git. |

## 2.9 Regras, avisos, boas práticas e armadilhas

- **Regra:** mesmo para alteração visual, conduzir a IA com cuidado — um pedido bom diz: documentação a ler, objetivo, o que pode ser alterado, o que não deve ser alterado, quando pedir aprovação, se a documentação precisa ser atualizada e se deve haver commit.
- **Regra:** a IA deve ler a documentação antes de alterar, mesmo em sistema pronto ("não alterar arquivos no escuro"); isso evita repetir erros, ignorar regras ou alterar partes erradas.
- **Regra:** limitar o escopo no prompt (ex.: "Esta é uma alteração puramente visual e de interface (Front-end)").
- **Regra:** a IA deve apresentar um plano antes de agir quando a alteração puder afetar várias partes. "Primeiro ela deve propor. Depois o usuário aprova. Só então ela implementa."
- **Regra:** documentação e Git fazem parte da manutenção — alterou o sistema, confira documentação e commit.
- **Aviso/armadilha:** pedidos vagos ("Deixe o dashboard mais bonito") fazem a IA mudar muitas coisas ao mesmo tempo, alterar arquivos desnecessários, mexer no back-end, trocar bibliotecas, mudar regras de negócio ou ignorar a documentação.
- **Boas práticas do segundo prompt:** não abrir novo escopo; apontar ajuste específico; conectar ao plano já apresentado para manter continuidade.
- **Boas práticas do terceiro prompt:** usar a palavra "Verifique" — a IA deve analisar a necessidade, não alterar documentos automaticamente sem critério.

## 2.10 Erros comuns e como resolver

| Erro comum | Como resolver |
|---|---|
| Pedido vago ("Deixe o dashboard mais bonito") | Seguir o modelo geral: documentação, objetivo, tipo de alteração, instruções específicas, o que NÃO alterar, plano antes, atualização de documentação, commit. |
| IA altera arquivos imediatamente sem proposta | Pedir plano de implementação antes de qualquer alteração e aguardar aprovação. |
| IA mexe em banco/regras de negócio em mudança visual | Incluir a frase de proteção de escopo ("alteração puramente visual e de interface (Front-end)"). |
| IA ignora decisões já tomadas | Obrigar a leitura prévia de arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), `docs/MANUTENCAO.md`, `docs/FSD.md`, `docs/STATUS.md`, `docs/ERROS.md`. |
| Documentação fica desatualizada após a mudança | Usar o prompt de alinhamento de documentação (verificar MANUTENCAO, INSUMOS, FSD, AGENTS, DESIGN e demais `docs/`). |
| Alteração aplicada sem registro | Prompt "Verifique se é necessário fazer um commit." |
| Alteração publicada sem validação | Pedir roteiro de teste manual antes do commit ou deploy. |

---

# Capítulo: codificacao-14.txt — "Rollback: como voltar uma versão do sistema com segurança"

## 3.1 Objetivo do capítulo

Ensinar a pensar em rollback usando Git, GitHub, produção e banco de dados — sem ensinar todos os comandos avançados do Git, mas mostrando um **caminho seguro para iniciantes pedirem ajuda à IA e evitarem decisões perigosas**. Ideia central: **"Voltar código é uma coisa. Voltar banco de dados é outra."** Código, telas, arquivos e documentação normalmente podem ser revertidos com Git; banco de dados exige muito mais cuidado, porque pode conter dados reais criados por usuários.

**Cenário:** o sistema financeiro estava pronto e publicado. Foi pedida uma melhoria no Dashboard; a IA fez a alteração, o usuário testou, publicou e tudo parecia certo. Dias depois, os usuários finais disseram "A versão anterior era melhor" / "A nova tela ficou bonita, mas dificultou o uso" / "Depois da alteração, alguns usuários ficaram confusos". Agora é preciso voltar à versão anterior.

## 3.2 Passos EXATOS na ordem

**Antes de tudo — não entre em pânico.** O pedido "Volte tudo como era antes." é perigoso, porque "tudo" pode incluir código, banco, dados reais, arquivos enviados por usuários e configuração de produção. O correto é investigar primeiro. Antes de qualquer rollback, responda:

- O problema está apenas no código?
- O problema está na interface?
- O problema está em regra de negócio?
- O banco de dados foi alterado?
- A alteração já foi enviada ao GitHub?
- A alteração já foi publicada em produção?
- Usuários reais criaram dados depois da alteração?
- Existe backup antes da publicação?
- Existe uma tag de versão anterior?

Essas perguntas **definem a estratégia**.

**Fluxo de rollback quando a alteração foi apenas código/documentação (sem banco):**
1. Listar commits do histórico (ex.: `git log --oneline`).
2. Conferir detalhes do commit que introduziu a alteração (`git show --stat <hash>`, `git show <hash>`).
3. Ver histórico organizado (`git log --oneline --decorate --graph --all`).
4. Pedir à IA análise do histórico e plano (prompt "listar commits").
5. Escolher o commit/tag da versão boa.
6. Executar rollback com `git revert` (cria novo commit que desfaz a alteração, preservando o histórico).
7. Se já enviado ao GitHub: `git revert <hash>` + `git push`.
8. Se já publicado em produção: reverter localmente, testar localmente, commitar, enviar ao GitHub, executar novo deploy, testar produção.
9. Documentar (STATUS.md e, se fizer sentido, ERROS.md).
10. Testar depois do rollback.

**Fluxo quando há banco de dados:**
- **Só local:** analisar; opções: reverter código com Git, desfazer migration local, recriar banco local, restaurar backup local, rodar novamente as migrations da versão anterior. Usuário deve confirmar antes de apagar/recriar banco.
- **Em produção:** análise de risco e escolha de estratégia (reverter só código; migration corretiva; restaurar backup; correção para frente). Nada de comandos destrutivos sem confirmação explícita.

## 3.3 PROMPTS COMPLETOS (transcrição verbatim)

### Prompt para pedir ajuda à IA para listar commits

> Copiar
>
> Leia `docs/STATUS.md` e me ajude a analisar o histórico do Git antes de qualquer rollback.
>
> Primeiro, liste os commits recentes usando:
>
> git log --oneline --decorate --graph --all
>
> Depois explique em linguagem simples:
>
> 1. qual é o commit atual;
> 2. quais são os commits mais recentes;
> 3. quais tags existem, se houver;
> 4. qual commit provavelmente introduziu a alteração que quero desfazer;
> 5. qual commit ou tag parece representar a versão boa anterior;
> 6. qual comando de rollback seria mais seguro;
> 7. quais riscos devo considerar antes de executar.
>
> Não faça rollback ainda.
> Apenas analise o histórico e apresente um plano.

### Prompt para pedir rollback de código por commit

> Use este prompt quando a alteração envolveu apenas código e documentação.
>
> Copiar
>
> Leia antes de agir:
>
> - `docs/MANUTENCAO.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Preciso fazer rollback da última alteração.
>
> Cenário:
> - A alteração já foi concluída.
> - A alteração foi registrada em commit.
> - A alteração não agradou os usuários finais.
> - Quero voltar o código e a documentação para o estado anterior a essa alteração.
> - Não houve alteração de banco de dados.
>
> Antes de executar qualquer comando, analise o histórico do Git e me apresente um plano seguro.
>
> Verifique:
> 1. qual commit introduziu a alteração;
> 2. quais arquivos foram alterados;
> 3. se a alteração já foi enviada ao GitHub;
> 4. se a alteração já foi publicada em produção;
> 5. se o rollback pode ser feito com `git revert`;
> 6. quais testes devem ser feitos depois.
>
> Não use `git reset --hard` sem minha autorização explícita.
>
> Depois de aprovado, faça o rollback criando um novo commit de reversão, atualize `docs/STATUS.md`, registre o ocorrido em `docs/ERROS.md` se fizer sentido e me diga como testar.

### Prompt para rollback quando já foi para produção

> Copiar
>
> Preciso fazer rollback da última alteração que já foi publicada em produção.
>
> Leia:
>
> - `docs/MANUTENCAO.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
> - configuração de deploy do projeto
>
> Cenário:
> - A alteração foi publicada em produção.
> - Os usuários finais não gostaram da alteração.
> - Quero voltar o código para a versão anterior.
> - Não houve alteração de banco de dados.
>
> Antes de alterar qualquer coisa, apresente um plano com:
>
> 1. commit que será revertido;
> 2. arquivos afetados;
> 3. comando Git recomendado;
> 4. testes locais necessários;
> 5. passos para enviar ao GitHub;
> 6. passos para publicar novamente em produção;
> 7. checklist pós-deploy.
>
> Use preferencialmente `git revert`, não `git reset --hard`.
>
> Depois de aprovado, faça o rollback, atualize a documentação viva e oriente o novo deploy.

### Prompt para criar tag depois de uma versão estável

> Copiar
>
> O sistema foi testado e esta versão está estável.
>
> Quero criar uma tag de versão no Git.
>
> Antes de executar, verifique:
>
> 1. se não há alterações pendentes;
> 2. qual é o último commit;
> 3. qual nome de tag faz sentido;
> 4. se a tag já existe;
> 5. se o GitHub deve receber essa tag.
>
> Sugira uma tag no formato `vX.Y.Z` e explique o significado.
>
> Depois de aprovado, crie a tag e envie para o GitHub.

### Prompt para voltar usando uma tag

> Copiar
>
> Preciso voltar o sistema para a versão marcada pela tag `v1.0.0`.
>
> Leia:
>
> - `docs/MANUTENCAO.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Antes de executar qualquer comando, explique a estratégia mais segura para um usuário iniciante.
>
> Verifique:
>
> 1. qual é a versão atual;
> 2. qual commit está associado à tag `v1.0.0`;
> 3. quais commits existem depois dessa tag;
> 4. se é melhor usar `git revert` dos commits posteriores ou criar uma branch a partir da tag;
> 5. se a alteração já foi enviada ao GitHub;
> 6. se a alteração já foi publicada em produção;
> 7. se houve mudança de banco de dados.
>
> Não execute `git reset --hard` nem `git push --force` sem minha autorização explícita.
>
> Apresente o plano antes de alterar arquivos.

### Prompt para rollback com banco alterado apenas localmente

> Copiar
>
> Preciso fazer rollback da última alteração que mexeu no banco de dados, mas apenas no ambiente local.
>
> Leia:
>
> - `docs/MANUTENCAO.md`
> - `docs/FSD.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Cenário:
> - A alteração não foi publicada em produção.
> - O banco de produção não foi alterado.
> - A alteração foi testada apenas na minha máquina local.
> - Quero voltar o código e o banco local para o estado anterior.
>
> Antes de executar qualquer comando, analise:
>
> 1. quais commits alteraram o código;
> 2. quais migrations, schemas, seeders ou scripts foram criados ou alterados;
> 3. se existe comando seguro de rollback da stack;
> 4. se é melhor recriar o banco local;
> 5. se há dados locais importantes que precisam de backup;
> 6. quais testes devem ser feitos depois.
>
> Não apague banco nem dados sem minha confirmação.
>
> Apresente um plano seguro primeiro.

### Prompt para rollback com banco alterado em produção

> Copiar
>
> Preciso fazer rollback da última alteração que já foi publicada em produção e alterou o banco de dados.
>
> Leia:
>
> - `docs/MANUTENCAO.md`
> - `docs/FSD.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
> - documentação de deploy e banco do projeto
>
> Cenário:
> - A alteração foi publicada em produção.
> - O banco de produção foi alterado.
> - Usuários finais podem ter criado ou alterado dados depois da publicação.
> - A alteração não agradou e precisamos regredir com segurança.
>
> Antes de executar qualquer comando, faça uma análise de risco.
>
> Verifique:
>
> 1. quais commits fazem parte da alteração;
> 2. quais migrations, schemas, seeders, scripts ou alterações de banco foram aplicados;
> 3. se o código anterior é compatível com o banco atual;
> 4. se existem dados novos que podem ser perdidos;
> 5. se há backup de produção antes da alteração;
> 6. se é melhor reverter apenas código;
> 7. se é melhor criar uma migration corretiva;
> 8. se é necessário restaurar backup;
> 9. se é melhor aplicar uma correção para frente;
> 10. quais testes devem ser feitos antes e depois.
>
> Não apague dados.
> Não restaure backup.
> Não rode migration destrutiva.
> Não execute comandos em produção sem minha confirmação explícita.
>
> Apresente um plano seguro, com riscos, vantagens e desvantagens de cada opção.

### Prompt para documentar rollback

> Copiar
>
> Documente o rollback realizado.
>
> Atualize `docs/STATUS.md` com:
>
> - alteração revertida;
> - motivo do rollback;
> - estratégia usada;
> - impacto em código;
> - impacto em banco de dados, se houve;
> - impacto em produção, se houve;
> - testes feitos;
> - versão ativa após o rollback;
> - próximos cuidados.
>
> Se o rollback foi causado por erro, rejeição dos usuários ou problema relevante, registre também em `docs/ERROS.md` com:
>
> - Sintoma:
> - Causa:
> - Solução aplicada:
> - Como evitar no futuro:

### Prompt para sugerir próxima tag

> Copiar
>
> Quero criar uma tag para marcar a versão atual do sistema.
>
> Leia `docs/STATUS.md` e o histórico recente do Git.
>
> Verifique:
> 1. se a versão atual está estável;
> 2. qual foi a última tag;
> 3. se houve mudança grande, recurso novo ou correção pequena;
> 4. qual deveria ser o próximo número de versão;
> 5. qual mensagem descritiva usar.
>
> Não crie a tag ainda.
> Primeiro me apresente a sugestão e aguarde aprovação.

### Exemplo de pedido perigoso (evitar)

> Copiar
>
> Volte tudo como era antes.

Esse pedido é perigoso porque "tudo" pode incluir código, banco, dados reais, arquivos enviados por usuários e configuração de produção. O correto é investigar primeiro.

## 3.4 Comandos Git citados

- `git log --oneline` — lista resumida dos commits. Cada linha tem: identificador curto (hash) + mensagem. Ex.:
  ```
  h7i8j9k Ajusta documentação de manutenção
  d4e5f6g Melhora visual do Dashboard
  a1b2c3d Sistema pronto e publicado
  ```
- `git revert <hash>` — ex.: `git revert d4e5f6g`. Cria um novo commit desfazendo o commit escolhido (não apaga o histórico). Ex.: novo commit `h7i8j9k Reverte melhoria visual do Dashboard`.
- `git show --stat <hash>` — resumo dos arquivos modificados (mais fácil para iniciantes, não despeja o conteúdo).
- `git show <hash>` — alterações detalhadas.
- `git log --oneline --decorate --graph --all` — histórico resumido incluindo branches e tags. Ex.:
  ```
  * h7i8j9k (HEAD -> main) Ajusta documentação de manutenção
  * d4e5f6g (tag: v1.1.0) Melhora visual do Dashboard
  * a1b2c3d (tag: v1.0.0) Sistema pronto e publicado
  ```
  `HEAD -> main` indica onde você está agora; `tag: v1.0.0` / `tag: v1.1.0` mostram versões marcadas.
- Quando o commit já foi enviado ao GitHub: `git revert d4e5f6g` + `git push`.
- **Evitar:** `git reset --hard` e `git push --force` (podem causar confusão, principalmente quando o repositório já está no GitHub ou quando outras pessoas usam o projeto). O `git reset` é "voltar o histórico local para outro ponto. Pode ser perigoso se usado sem cuidado."
- Criar tag: `git tag -a v1.0.0 -m "Versão inicial publicada"` + `git push origin v1.0.0` (ex.: `git tag -a v1.1.0 -m "Melhoria visual do dashboard"` + `git push origin v1.1.0`).
- Olhar o projeto como estava em uma tag: `git checkout v1.0.0` — deixa o Git em estado **detached HEAD**, que confunde iniciantes; por isso, pedir ajuda à IA antes de usar.

## 3.5 Modelos/estruturas de documentos citados

- `docs/STATUS.md` — registrar: qual alteração foi revertida; por que foi revertida; qual estratégia foi usada; se afetou produção; se afetou banco; quais testes foram feitos; qual versão ficou ativa depois.
- `docs/ERROS.md` — registrar se a alteração causou problema relevante (formato: Sintoma / Causa / Solução aplicada / Como evitar no futuro).
- `docs/MANUTENCAO.md` — lido em praticamente todos os prompts de rollback.
- `docs/FSD.md` — lido nos prompts de rollback com banco (local e produção).
- Configuração de deploy do projeto e documentação de deploy e banco do projeto — citadas nos prompts de produção.

**Exemplo de registro em `docs/ERROS.md` (bloco "Copiar"):**

> ## 2026-07-03 - Rollback da melhoria visual do Dashboard
>
> - Sintoma:
> Usuários finais relataram dificuldade de navegação com a nova versão do Dashboard.
>
> - Causa:
> A nova organização visual reduziu a clareza das opções principais.
>
> - Solução aplicada:
> Foi feito rollback do commit da melhoria visual usando git revert e nova publicação em produção.
>
> - Como evitar no futuro:
> Validar mudanças visuais com usuários antes de publicar em produção.

## 3.6 Estratégias de rollback

**Regra principal do rollback:**

> Copiar
>
> Nunca faça rollback de banco de dados em produção sem backup e análise do impacto.

**Estratégia recomendada para iniciantes:**
- Para desfazer uma mudança já registrada e compartilhada, prefira `git revert`.
- Para marcar versões estáveis, use tags.
- Para voltar produção, faça novo deploy da versão revertida.
- Para banco de dados, analise separadamente.
- Isso evita apagar histórico e reduz riscos.

**Estratégias para banco local** (dependem da stack; decisão depende do projeto; usuário deve confirmar antes de apagar ou recriar banco):
- rodar rollback da última migration;
- recriar banco local;
- restaurar backup local;
- apagar apenas tabelas de teste;
- voltar código com `git revert`;
- remover migration não desejada, se ela nunca foi compartilhada;
- ajustar STATUS.md e ERROS.md.

**Possíveis estratégias em produção:**
- **Estratégia 1 — reverter apenas o código e manter o banco:** quando a nova alteração no banco não atrapalha a versão anterior (ex.: campo novo opcional que o código antigo ignora). Boa opção quando o banco novo é compatível com o código anterior.
- **Estratégia 2 — criar uma migration corretiva:** em vez de restaurar backup, criar nova migration que desfaz a mudança com segurança (ex.: marcar a coluna como descontinuada ou remover apenas se não houver dados importantes). "Remover dados em produção deve ser evitado sem análise."
- **Estratégia 3 — restaurar backup de produção:** opção mais pesada, necessária se a alteração corrompeu dados ou tornou o sistema inutilizável. Antes, avaliar: qual backup será usado; qual horário do backup; quais dados serão perdidos; se é possível exportar dados recentes antes; se usuários devem ser avisados; se existe janela de manutenção; como validar depois. Restaurar backup pode apagar dados criados depois do backup.
- **Estratégia 4 — correção para frente:** criar uma nova correção que restaure a experiência anterior sem desfazer o banco (ex.: a tela nova não agradou, o banco mudou mas não quebrou nada → voltar o layout anterior mantendo o banco). Reduz risco de perda de dados.

**O que evitar em rollback de produção:**
- rodar comandos destrutivos sem backup;
- apagar colunas com dados reais;
- restaurar backup sem avaliar perda de dados;
- usar `git reset --hard` e `push --force` sem entender impacto;
- publicar código antigo incompatível com banco novo;
- fazer deploy sem testar localmente;
- não avisar usuários quando houver risco;
- não registrar o ocorrido em STATUS.md e ERROS.md.

## 3.7 Checklists (transcritos)

### Checklist antes de escolher o commit

> Copiar
>
> [ ] Identifiquei o commit atual.
> [ ] Identifiquei o commit que introduziu a alteração ruim.
> [ ] Identifiquei o commit ou tag da versão boa anterior.
> [ ] Verifiquei quais arquivos foram alterados.
> [ ] Confirmei se houve alteração de banco de dados.
> [ ] Confirmei se a alteração já foi enviada ao GitHub.
> [ ] Confirmei se a alteração já foi publicada em produção.
> [ ] Pedi um plano antes de executar comandos.

"Essa etapa evita que você reverta o commit errado."

### Checklist antes de fazer rollback

> Copiar
>
> [ ] Sei qual alteração precisa ser revertida.
> [ ] Sei qual commit ou tag representa a versão boa.
> [ ] Sei se a alteração foi enviada ao GitHub.
> [ ] Sei se a alteração foi publicada em produção.
> [ ] Sei se houve alteração de banco de dados.
> [ ] Sei se usuários criaram dados depois da alteração.
> [ ] Existe backup, se produção estiver envolvida.
> [ ] A IA apresentou plano antes de executar.
> [ ] Não há comando destrutivo sem confirmação.
> [ ] Sei como testar depois do rollback.

### Checklist depois do rollback

> Copiar
>
> [ ] O código voltou ao comportamento esperado.
> [ ] A interface voltou ao estado desejado.
> [ ] O banco continua compatível.
> [ ] O sistema abre localmente.
> [ ] Os principais fluxos funcionam.
> [ ] O Git tem commit do rollback.
> [ ] O GitHub recebeu o rollback.
> [ ] Produção foi atualizada, se necessário.
> [ ] Produção foi testada.
> [ ] STATUS.md foi atualizado.
> [ ] ERROS.md foi atualizado, se necessário.
> [ ] Uma tag de versão foi criada, se fizer sentido.

## 3.8 Sugestão de rotina com tags

Criar tags em versões importantes facilita rollback no futuro. Exemplo de rotina:

> v1.0.0 - primeira versão publicada
> v1.1.0 - melhoria no dashboard
> v1.2.0 - novo relatório mensal
> v1.2.1 - correção pequena

**Padrão simples:** `vMAIOR.MENOR.CORRECAO`

- MAIOR: mudança grande;
- MENOR: novo recurso ou melhoria;
- CORRECAO: ajuste pequeno ou correção.

Exemplos:
- `v1.0.0` — primeira versão estável.
- `v1.1.0` — nova melhoria ou recurso.
- `v1.1.1` — correção pequena.

## 3.9 Vocabulário especializado (tabela Termo/Explicação)

| Termo | Explicação simples |
|---|---|
| Rollback | Voltar o sistema para uma versão anterior. |
| Regressão | Retorno para um estado anterior, geralmente porque uma mudança não funcionou bem. |
| Commit | Registro de uma alteração no Git. |
| Hash do commit | Código identificador de um commit. |
| Tag | Nome dado a uma versão importante do projeto, como v1.0.0. |
| Produção | Ambiente usado pelos usuários reais. |
| Banco de dados | Local onde o sistema guarda informações. |
| Migration | Arquivo ou mecanismo usado para alterar a estrutura do banco. |
| Backup | Cópia de segurança usada para recuperar dados. |
| Revert | Criar um novo commit que desfaz alterações anteriores. |
| Reset | Voltar o histórico local para outro ponto. Pode ser perigoso se usado sem cuidado. |

## 3.10 Erros comuns e como resolver

| Erro comum | Como resolver |
|---|---|
| Pedir "Volte tudo como era antes." | Investigar primeiro (responder as 9 perguntas da seção "Antes de tudo: não entre em pânico") antes de qualquer rollback. |
| Rollback de banco em produção sem backup/análise | Regra principal: nunca faça rollback de banco em produção sem backup e análise do impacto. |
| Reverter o commit errado | Usar o checklist "antes de escolher o commit"; conferir com `git show --stat <hash>` qual commit introduziu a alteração. |
| Apagar histórico (git reset --hard / push --force) | Preferir `git revert`; nunca usar `git reset --hard` sem autorização explícita; para iniciantes a orientação mais segura é `git revert` + novo commit + `git push`. |
| Achar que produção volta sozinha com rollback local | A produção não volta sozinha só porque você fez rollback no Git local — é preciso publicar novamente a versão revertida (deploy). |
| Restaurar backup antigo e perder dados criados depois | Avaliar perda de dados antes; considerar exportar dados recentes; considerar estratégias de migration corretiva ou correção para frente. |
| Banco novo incompatível com código antigo | Analisar compatibilidade código x banco; escolher entre reverter só código, migration corretiva, restaurar backup ou correção para frente. |
| Rollback sem documentar | Documentar em STATUS.md (alteração revertida, motivo, estratégia, impactos, testes, versão ativa) e em ERROS.md (Sintoma/Causa/Solução/Como evitar). |
| Tags desatualizadas ou inexistentes | Usar o prompt "sugerir próxima tag"; padrão vMAIOR.MENOR.CORRECAO; criar tag após versões estáveis. |

## 3.11 Fechamento do capítulo (mensagens-chave)

- Rollback não é sinal de fracasso; é parte normal da manutenção de sistemas.
- A regra principal: **Código pode voltar com Git. Banco de dados só volta com análise, backup e cuidado.**
- Rollback não deve ser improvisado. Rollback deve ser **planejado, testado, documentado e versionado.**

---

# 4. Itens acionáveis (documentos, pastas, comandos e prompts que o desenvolvedor precisa executar)

**Documentos/pastas que devem existir no projeto** (referenciados pelos prompts):
- arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) (raiz)
- `docs/MANUTENCAO.md`
- `docs/FSD.md`
- `docs/STATUS.md`
- `docs/ERROS.md`
- `docs/INSUMOS.md` (citado no alinhamento de documentação)
- `docs/DESIGN.md` (citado no alinhamento de documentação)
- Configuração de deploy do projeto e documentação de deploy/banco do projeto (usados nos prompts de rollback em produção).

**Comandos Git para o fluxo de manutenção/rollback:**
- `git log --oneline`
- `git show --stat <hash>`
- `git show <hash>`
- `git log --oneline --decorate --graph --all`
- `git revert <hash>` (com `git push` se já enviado ao GitHub)
- `git tag -a <versão> -m "<mensagem>"` + `git push origin <versão>`
- `git checkout <tag>` — cuidado: detached HEAD (pedir ajuda à IA)
- Evitar: `git reset --hard`, `git push --force` (sem autorização explícita).

**Prompts a executar (na ordem de uso):**

Para pedir alteração (cap. 13):
1. Primeiro prompt: pedido principal de alteração (chat novo, sem raciocínio; anexar print no segundo prompt).
2. Segundo prompt: ajuste com base nas imagens (com print da tela anexado).
3. Terceiro prompt: alinhamento de documentação.
4. Quarto prompt: verificar commit.
5. Prompt de apoio: roteiro de teste manual.

Para rollback (cap. 14):
1. Prompt para pedir ajuda à IA para listar commits.
2. Prompt para pedir rollback de código por commit (alteração apenas código/documentação).
3. Prompt para rollback quando já foi para produção.
4. Prompt para criar tag depois de uma versão estável.
5. Prompt para voltar usando uma tag.
6. Prompt para rollback com banco alterado apenas localmente.
7. Prompt para rollback com banco alterado em produção.
8. Prompt para documentar rollback.
9. Prompt para sugerir próxima tag.

**Rotina sugerida:** criar tag após cada versão estável (`vMAIOR.MENOR.CORRECAO`), documentar rollback em STATUS.md e ERROS.md, testar localmente antes de qualquer deploy de rollback, e avisar usuários quando houver risco em produção.

---

# 5. Notas sobre conteúdo ausente

- **Não presente neste grupo:** comandos avançados de Git (o capítulo 14 declara explicitamente que o objetivo não é ensinar todos os comandos avançados do Git); nenhum capítulo traz um template de arquivo pronto para STATUS.md/ERROS.md (apenas listas de campos e um exemplo de entrada de ERROS.md); não há checklists na forma de arquivo — todos os checklists aparecem como listas no texto (transcritos acima).

