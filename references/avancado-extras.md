# Referência APES IA5K — Avançado: skills, outras stacks, erros comuns e extras

# Grupo 12 — Criando Skills e Outras Stacks

Capítulos analisados:
- `codificacao-15.txt` — **Criando Skills**
- `codificacao-16.txt` — **Outras stacks**

---

## 1. Visão geral do grupo

Este grupo pertence à **fase de codificação** do fluxo da metodologia e cobre dois temas de suporte que tornam o processo principal reutilizável e portátil:

1. **Criando Skills (capítulo 15)** — mostra como transformar um prompt repetitivo (especificamente o **prompt 04 — "Passo 4 - Codificando em etapas"**, chamado de "o coração da construção do sistema") em uma **skill reutilizável** da IA. O objetivo é eliminar o trabalho manual de copiar e colar o prompt 04 a cada fase, sem mudar a metodologia nem o comportamento do prompt original. A skill é deliberadamente de **uso manual (acionamento explícito)**, nunca automática, porque construir uma fase altera arquivos, executa comandos, atualiza documentação e faz commit.

2. **Outras stacks (capítulo 16)** — explica como adaptar o fluxo (prompts 01 a 06) para qualquer stack (PHP puro, Laravel, Node.js, Next.js, Python, Django, Supabase, Firebase etc.) e qualquer hospedagem (VPS, Vercel, Render, Railway, Netlify, Cloudflare Pages etc.). A regra central: **"Quem define a tecnologia do projeto é o FSD, não o improviso da IA."** Os prompts já são generalistas e devem seguir o que está no `docs/FSD.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) e demais documentos. Não se trocam nomes de tecnologias soltos nos prompts; a IA lê a documentação e segue a stack definida.

**Posição no fluxo**: são capítulos de capacitação/ajuste da fase de codificação — o 15 otimiza a repetição do prompt 04; o 16 garante que todo o fluxo funcione fora do cenário padrão (PHP + MySQL) sem perder a disciplina (validar insumos, preparar projeto, Git, construir em fases, testar, revisar segurança, documentar).

---

## 2. Capítulo 1: `codificacao-15.txt` — Criando Skills

### 2.1 Objetivo do capítulo

Apresentar uma alternativa a copiar e colar o prompt 04 a cada fase: **transformar esse prompt em uma skill** reutilizável. A skill **não muda o método** — apenas empacota o prompt de construção para facilitar o uso. A skill deve ser acionada **apenas por comando explícito do usuário** (uso manual), nunca automaticamente.

### 2.2 Passos exatos na ordem

1. **Contextualização**: o prompt 04 ("Passo 4 - Codificando em etapas") é usado várias vezes durante a codificação; ele lê o contexto, identifica a próxima fase pendente, constrói apenas essa fase, testa, atualiza arquivos vivos, registra erros e orienta o próximo passo.
2. **Entender o que é uma skill**: conjunto reutilizável de instruções que ensina a IA a executar uma tarefa específica; um "manual pequeno para tarefa recorrente".
3. **Verificar repositórios públicos** de skills prontas (GitHub, documentações oficiais, comunidades, fóruns, materiais compartilhados) — **com cuidado**: skill de terceiro pode conter instruções ruins, comandos perigosos, padrões inseguros; ler o conteúdo antes de usar e validar (checklist de verificação abaixo).
4. **Definir o acionamento**: esta skill é de uso manual, acionada apenas quando o usuário escrever um comando claro (ex.: "Executar skill: construir próxima fase").
5. **Preservar os recursos do prompt original**: não simplificar demais, não remover segurança, não deixar de atualizar documentação, não mudar a função do prompt.
6. **Estruturar a skill**: criar a pasta `construir-proxima-fase/` com `SKILL.md` e `references/prompt-04-construir-fase.md` (o prompt original completo fica como referência; o SKILL.md instrui a IA a seguir aquele conteúdo integralmente).
7. **Atenção**: a IA **não deve reescrever o prompt original de forma livre** — "Transformar o prompt em skill não é reimaginar o prompt; é empacotar o mesmo fluxo para reutilização."
8. **Executar o prompt de criação da skill** (prompt completo transcrito abaixo) em um chat novo na IA codificadora com acesso à pasta desejada; salvar o prompt do passo 4 como `04-construir-fase.md` em `docs/` e anexá-lo ao prompt.
9. **Instalar a skill**: direto, se a ferramenta permitir; senão, criar a pasta e entregar instruções de instalação manual.
10. **Reiniciar/validar** a skill: algumas ferramentas só carregam novas skills em nova sessão (fechar e abrir, novo chat, conferir pasta, nome e descrição).
11. **Usar a skill** com comando explícito em um chat novo (ex.: "Executar skill: construir próxima fase" ou slash command `/construir-proxima-fase`).
12. **Evitar comandos vagos** ("Continue o sistema", "Faça a próxima parte", "Pode seguir", "Termine o projeto") — menos seguros; preferir sempre o comando explícito.

### 2.3 Prompts completos (VERBATIM)

#### Índice de prompts — título do bloco: "Prompt para criar e instalar a skill"

**Instruções que antecedem o prompt (transcritas):**

> Use o prompt abaixo em um chat novo na IA codificadora com acesso à pasta onde você deseja criar a skill.
>
> Salve o prompt do passo 4 em um arquivo chamado: `04-construir-fase.md` na pasta `docs/`.
>
> Anexe este arquivo ao do prompt abaixo.
>
> Se a ferramenta permitir instalar a skill diretamente, ela deve instalar.
>
> Se não permitir, ela deve criar a pasta da skill e entregar instruções claras para instalação manual.

**Prompt completo (bloco "Copiar"):**

> Responda sempre em português do Brasil.
>
> Você é especialista em criação de skills para IA e em organização de fluxos de desenvolvimento assistido por IA.
>
> Leia e use o arquivo `docs/04-construir-fase.md` como prompt de referência. Ao criar a skill mova este arquivo para a pasta correta.
>
> Sua missão é transformar esse prompt em uma skill reutilizável, sem perder nenhum recurso e sem alterar a função original do prompt.
>
> ## Objetivo da skill
>
> Criar uma skill para executar o fluxo do prompt `04-construir-fase.md`, usado na etapa:
>
> "Passo 4 - Codificando em etapas"
>
> Essa skill deve permitir que o usuário construa a próxima fase pendente do projeto sem precisar copiar e colar o prompt completo toda vez.
>
> ## Regra mais importante
>
> A skill deve preservar integralmente a função do prompt original.
>
> Não remova etapas.
> Não simplifique o fluxo.
> Não altere a finalidade.
> Não transforme em um prompt genérico.
> Não remova regras de segurança.
> Não remova atualização de `docs/STATUS.md`.
> Não remova registro em `docs/ERROS.md`.
> Não remova a regra de construir apenas uma fase por vez.
> Não remova testes.
> Não remova versionamento.
> Não remova orientação ao usuário leigo.
>
> Se precisar adaptar o texto para o formato de skill, faça apenas adaptações estruturais, sem mudar o comportamento original.
>
> ## Acionamento da skill
>
> Esta skill deve ser acionada apenas quando o usuário pedir explicitamente.
>
> Ela não deve ser usada automaticamente para dúvidas, explicações, conversas gerais, revisão de texto, planejamento, análise ou qualquer outro pedido.
>
> Use como comando principal de acionamento:
>
> Executar skill: construir próxima fase
>
> Também aceite variações muito próximas, como:
>
> - Use a skill de construção da próxima fase.
> - Rodar skill de construir fase.
> - Ou como Slash command se for permitido `/construir-proxima-fase`
>
> A descrição da skill deve deixar claro que ela só deve ser usada mediante comando explícito do usuário.
>
> ## Estrutura esperada da skill
>
> Crie a skill com uma estrutura parecida com esta:
>
> ```text
> construir-proxima-fase/
> ├── SKILL.md
> └── references/
>  └── prompt-04-construir-fase.md
> ```
>
> O arquivo `references/prompt-04-construir-fase.md` deve conter o conteúdo completo do prompt original anexado.
>
> O arquivo `SKILL.md` deve:
>
> 1. ter frontmatter válido;
> 2. usar nome em minúsculas;
> 3. descrever que a skill só deve ser acionada por comando explícito;
> 4. orientar a IA a carregar e seguir integralmente `references/prompt-04-construir-fase.md`;
> 5. reforçar que a skill constrói apenas a próxima fase pendente;
> 6. reforçar que deve ler os arquivos do projeto;
> 7. reforçar que deve atualizar arquivos vivos;
> 8. reforçar que deve testar;
> 9. reforçar que deve fazer commit ou entregar comandos;
> 10. reforçar que não deve avançar para a próxima fase no mesmo chat.
>
> ## Nome sugerido da skill
>
> Use este nome para a skill: construir-proxima-fase
>
> ## Descrição sugerida
>
> A descrição deve deixar claro que a skill é de uso explícito.
>
> Sugestão de descrição, que pode ser melhorada sem mudar o sentido:
>
> ```text
> executar o fluxo de codificação em etapas do prompt 04-construir-fase. usar somente quando o usuário pedir explicitamente com comandos como "executar skill: construir próxima fase" ou "usar a skill de construção da próxima fase". a skill lê o contexto do projeto, identifica a próxima fase pendente, constrói apenas essa fase, testa, atualiza status e erros, versiona e orienta o usuário. não usar para dúvidas, explicações, planejamento ou tarefas gerais.
> ```
>
> ## Conteúdo obrigatório do SKILL.md
>
> O `SKILL.md` deve orientar a IA a:
>
> - confirmar que o usuário pediu explicitamente a execução da skill;
> - ler o arquivo de referência `references/prompt-04-construir-fase.md`;
> - seguir o prompt original integralmente;
> - trabalhar dentro da pasta do projeto do usuário;
> - ler o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), conforme existir;
> - ler `docs/FSD.md`;
> - ler `docs/DESIGN.md`;
> - ler `docs/INSUMOS.md`;
> - ler `docs/PLANO.md`;
> - ler `docs/STATUS.md`;
> - ler `docs/ERROS.md`;
> - identificar a próxima fase pendente;
> - construir apenas uma fase;
> - respeitar a stack definida no FSD;
> - respeitar o design definido no DESIGN.md;
> - aplicar segurança adequada à stack;
> - testar o que for possível;
> - atualizar `docs/STATUS.md`;
> - registrar erros em `docs/ERROS.md`;
> - fazer commit ou entregar comandos;
> - orientar o usuário com testes manuais;
> - encerrar sem avançar para outra fase.
>
> ## Instalação
>
> Se o ambiente permitir instalar a skill diretamente, instale a skill.
>
> Se o ambiente não permitir instalação direta, faça o seguinte:
>
> 1. crie a pasta da skill;
> 2. crie os arquivos necessários;
> 3. valide a estrutura;
> 4. compacte a skill, se aplicável;
> 5. entregue instruções claras para o usuário instalar manualmente.
>
> ## Validação
>
> Depois de criar a skill, verifique:
>
> - se `SKILL.md` existe;
> - se `references/prompt-04-construir-fase.md` existe;
> - se o prompt original foi preservado;
> - se a descrição restringe o uso a comando explícito;
> - se a skill não removeu nenhuma etapa do fluxo;
> - se a skill não alterou a função original;
> - se há exemplo de uso.
>
> ## Exemplo de uso
>
> Ao final, entregue exemplos como:
>
> ```text
> Executar skill: construir próxima fase
> ```
>
> E explique que o usuário deve usar esse comando em um chat novo quando quiser construir a próxima fase do projeto.
>
> ## Saída esperada
>
> Ao final, entregue:
>
> 1. resumo da skill criada;
> 2. estrutura de arquivos criada;
> 3. confirmação de que o prompt original foi preservado;
> 4. confirmação de que a skill só deve ser acionada por comando explícito;
> 5. instruções de instalação, se necessário;
> 6. exemplos de uso;
> 7. próximos passos para testar a skill.

#### Blocos de comando de acionamento da skill (exemplos no capítulo)

**Comando principal (bloco "Copiar"):**
> Executar skill: construir próxima fase

**Comando alternativo (bloco "Copiar"):**
> Use a skill de construção da próxima fase.

**Slash command (bloco "Copiar"):**
> /construir-proxima-fase

**Definição dada no capítulo:** "Slash command é um comando iniciado com barra `/`. Ele funciona como um atalho para executar uma ação específica. Nem toda ferramenta usa slash commands do mesmo jeito. Por isso, o comando em texto continua sendo a opção mais universal."

**Estrutura da skill (bloco "Copiar"):**
> construir-proxima-fase/
> ├── SKILL.md
> └── references/
>  └── prompt-04-construir-fase.md

**Comandos que o usuário NÃO deve usar (comandos vagos, menos seguros):**
> Continue o sistema.
> Faça a próxima parte.
> Pode seguir.
> Termine o projeto.

**Comando preferido sempre (bloco "Copiar"):**
> Executar skill: construir próxima fase

### 2.4 Modelos/estruturas de documentos citados

- **Pasta da skill**: `construir-proxima-fase/` contendo:
  - `SKILL.md` — arquivo principal de instruções (com frontmatter válido, nome em minúsculas, descrição de acionamento explícito e instrução de seguir integralmente a referência).
  - `references/prompt-04-construir-fase.md` — o prompt original completo (o "prompt 04") guardado como referência.
- **Arquivo fonte do prompt**: `docs/04-construir-fase.md` (o prompt do passo 4 salvo; o prompt de criação move esse arquivo para a pasta correta da skill).
- **Documentos do projeto que a skill deve ler** (arquivos vivos): o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`) (conforme existir), `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`.

### 2.5 Regras, avisos, boas práticas e armadilhas

- **Regra principal**: "A skill deve facilitar o uso do prompt, não mudar o comportamento do prompt." / "Se a skill preservar o fluxo original, ela se torna uma forma prática de repetir a construção em etapas com mais consistência."
- **Não reescrever o prompt de forma livre**: "Transformar o prompt em skill não é reimaginar o prompt. Transformar o prompt em skill é empacotar o mesmo fluxo para reutilização."
- A skill deve manter **todos** os recursos do prompt original: não simplificar demais, não remover segurança, não deixar de atualizar documentação, não mudar a função do prompt.
- **Acionamento manual obrigatório**: a skill não deve ser acionada sozinha; construir uma fase altera arquivos, executa comandos, atualiza documentação e faz commit — por isso nunca deve disparar em conversa comum.
- **Cuidado com skills de terceiros**: podem conter instruções ruins, comandos perigosos, padrões inseguros ou regras incompatíveis. Verificar se a skill: altera arquivos automaticamente; executa comandos no terminal; mexe em banco de dados; envia dados para serviços externos; exige chaves de API; ignora regras de segurança; contradiz o FSD do projeto; combina com a ferramenta em uso. "Skill pronta também precisa ser validada. Use skills de terceiros como ponto de partida, não como verdade absoluta." Em dúvida, pedir para a IA explicar o que a skill faz antes de instalar ou executar.
- **Armadilha pós-instalação**: algumas ferramentas só carregam novas skills em nova sessão. Se a skill não aparecer ou não responder: feche e abra a ferramenta; abra um novo chat; confira se foi instalada na pasta correta; verifique nome e descrição.
- **Não usar comandos vagos** ("Continue o sistema", "Faça a próxima parte", "Pode seguir", "Termine o projeto") — são menos seguros; preferir o comando explícito.
- **Não usar a skill para outra tarefa**: "A skill é específica para construir a próxima fase pendente do projeto. Não use para outra tarefa."

### 2.6 Checklists mencionados

**Checklist de validação da skill (após criá-la)** — dentro do prompt de criação, verificar:
- se `SKILL.md` existe;
- se `references/prompt-04-construir-fase.md` existe;
- se o prompt original foi preservado;
- se a descrição restringe o uso a comando explícito;
- se a skill não removeu nenhuma etapa do fluxo;
- se a skill não alterou a função original;
- se há exemplo de uso.

**Checklist de verificação de skill de terceiros** (antes de usar): altera arquivos automaticamente; executa comandos no terminal; mexe em banco de dados; envia dados para serviços externos; exige chaves de API; ignora regras de segurança; contradiz o FSD; combina com a ferramenta.

### 2.7 Vocabulário especializado / tabela de termos

| Termo | Explicação simples |
|---|---|
| Skill | Conjunto reutilizável de instruções para a IA executar uma tarefa específica. |
| Comando explícito | Pedido claro feito pelo usuário para acionar uma ação. |
| Prompt original | Texto completo usado antes de virar skill. |
| Instalar skill | Disponibilizar a skill para a IA usar em novas conversas. |
| SKILL.md | Arquivo principal de instruções de uma skill. |
| Recurso da skill | Arquivo extra usado pela skill, como uma referência ou template. |
| Acionamento | Momento em que a IA decide usar uma skill. |
| Fluxo repetitivo | Processo que precisa ser executado várias vezes. |

**Termos definidos no texto corrido:**
- **Skill**: "um conjunto reutilizável de instruções que ensina a IA a executar uma tarefa específica... um manual pequeno, feito para uma tarefa recorrente."
- **Slash command**: "comando iniciado com barra `/`. Ele funciona como um atalho para executar uma ação específica."

### 2.8 Erros comuns e como resolver

- **Skill não aparece / não responde após instalar** → reiniciar: fechar e abrir a ferramenta, abrir novo chat, conferir a pasta de instalação, verificar nome e descrição. (Algumas ferramentas só carregam novas skills ao iniciar nova sessão.)
- **Usar comandos vagos em vez do comando explícito** → risco de a IA não acionar o fluxo completo; usar sempre "Executar skill: construir próxima fase".
- **Usar a skill para outra tarefa** → a skill é exclusiva para construir a próxima fase pendente.
- **Usar skill de terceiros sem validar** → pode conter comandos perigosos ou padrões inseguros; ler e validar antes, pedir à IA para explicar o que ela faz.

---

## 3. Capítulo 2: `codificacao-16.txt` — Outras stacks

### 3.1 Objetivo do capítulo

Mostrar como adaptar o fluxo completo da metodologia (prompts 01 a 06) para **qualquer stack e qualquer hospedagem**, sem perder a organização nem a disciplina. A boa notícia: não é preciso reescrever tudo do zero — os prompts principais já são **generalistas** e devem seguir o que está definido no `docs/FSD.md`, no arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) e nos demais documentos. **Regra principal: "Quem define a tecnologia do projeto é o FSD, não o improviso da IA."** Trocar nomes de tecnologias soltos nos prompts é erro; a IA deve ler a documentação do projeto e seguir a stack definida.

### 3.2 Passos exatos na ordem

1. **Reconhecer o problema**: projetos podem usar PHP puro, Laravel, Node.js, Next.js, Python, Django, Supabase, Firebase etc., e serem publicados em VPS, Vercel, Render, Railway, Netlify, Cloudflare Pages ou outros provedores. O erro seria resolver trocando palavras soltas nos prompts (ex.: trocar "PHP" por "Node.js"); cada stack tem sua própria forma de organizar arquivos, instalar dependências, rodar, testar, criar banco e publicar.
2. **Entender o que "adaptar o fluxo" significa**: manter a mesma lógica de trabalho (validar insumos → preparar projeto → configurar Git e GitHub → construir uma fase por vez → testar → revisar segurança → documentar), mudando apenas os detalhes técnicos (comandos, estrutura de pastas, bibliotecas, persistência, autenticação, estratégia de deploy).
3. **Conhecer o que não muda com a stack**: princípios independentes de tecnologia (lista abaixo).
4. **Conhecer o que muda por stack**: estrutura de pastas, comandos, banco de dados, segurança, deploy.
5. **Verificar se o FSD está pronto para a stack** (usar o "Prompt para verificar se o FSD está pronto para outra stack") — antes de pedir para a IA codificar.
6. **Adaptar cada prompt conforme a stack** (01 a 06: orientações específicas por prompt).
8. **Pesquisar documentação oficial** quando necessário (prompt "Prompt para pedir pesquisa oficial").
9. **Rodar o checklist de adaptação** antes de começar projeto com stack diferente.
10. **Usar o "Prompt para pedir adaptação completa do fluxo"** quando quiser revisar/adaptar os prompts salvos para um cenário específico.
11. **Aplicar a mesma estratégia na fase de análise**: pontos essenciais (arquitetura, banco, autenticação, MCP, filas, webhooks, soft delete, painel administrativo, multiusuário, multiempresa etc.) devem aparecer no FSD/DESIGN desde a análise, não improvisados na codificação.
12. **Evitar o que não se deve fazer** (lista de proibições).

### 3.3 Prompts completos (VERBATIM)

#### Prompt 1 — "Prompt para verificar se o FSD está pronto para outra stack"

**Instrução que antecede (transcrita):** "Use este prompt quando quiser conferir se o FSD está claro o suficiente para uma stack específica."

**Prompt completo (bloco "Copiar"):**

> Responda sempre em português do Brasil.
>
> Leia `docs/FSD.md` e verifique se ele está pronto para orientar a codificação com a stack definida.
>
> Analise se o FSD informa claramente:
>
> - linguagem principal;
> - framework, se houver;
> - banco de dados ou persistência;
> - ambiente de desenvolvimento;
> - ambiente de produção;
> - comandos para instalar, rodar, testar e fazer build;
> - estratégia de autenticação;
> - estratégia de autorização;
> - estrutura de pastas esperada;
> - estratégia de deploy;
> - dependências importantes;
> - restrições técnicas;
> - cuidados de segurança.
>
> Não escreva código.
>
> Entregue:
>
> 1. O que está claro.
> 2. O que está incompleto.
> 3. O que pode gerar dúvida para a IA codificadora.
> 4. Perguntas objetivas que preciso responder.
> 5. Sugestão de ajustes no FSD para deixá-lo pronto para codificação.

"Esse prompt ajuda antes de começar a construção."

#### Bloco de referência — "Como adaptar os prompts 01 a 06"

Os prompts 01 a 06 já são generalistas e devem sempre seguir (bloco "Copiar"):

> docs/FSD.md
> docs/DESIGN.md
> docs/INSUMOS.md
> docs/PLANO.md
> docs/STATUS.md
> docs/ERROS.md
> arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)


#### Bloco — "Checklist para adaptar o fluxo"

**Instrução que antecede (transcrita):** "Use este checklist antes de começar um projeto com stack diferente:"

**Checklist completo (bloco "Copiar"):**

> [ ] O FSD define a linguagem principal.
> [ ] O FSD define o framework, se houver.
> [ ] O FSD define banco de dados ou persistência.
> [ ] O FSD define ambiente local.
> [ ] O FSD define ambiente de produção.
> [ ] O FSD define estratégia de deploy.
> [ ] O FSD define comandos principais.
> [ ] O FSD define autenticação e autorização.
> [ ] O FSD define cuidados de segurança.
> [ ] O prompt 01 está validando a stack real.
> [ ] O prompt 02 está criando a estrutura correta.
> [ ] O prompt 03 está gerando .gitignore adequado.
> [ ] O prompt 04 está usando comandos da stack real.
> [ ] O prompt 05 está revisando segurança da stack real.
> [ ] O prompt 06 está documentando a stack real.

#### Prompt 3 — "Prompt para pedir adaptação completa do fluxo"

**Instruções que antecedem (transcritas):** "Se você quiser adaptar tudo para um cenário específico, pode usar esse fluxo. Salve os prompts em arquivos .md numerados. Exemplos: `01-validar-insumos.md`, `02-planejar-e-preparar.md`, `03-inicializar-git.md`, `04-construir-fase.md`, `05-revisao-seguranca.md`, `06-documentacao-final.md`. Coloque esse prompts em uma pasta chamada `prompts\` no seu projeto. Execute o prompt abaixo."

**Prompt completo (bloco "Copiar"):**

> Responda sempre em português do Brasil.
>
> Quero adaptar o fluxo de codificação com IA deste projeto para a stack e hospedagem definidas em `docs/FSD.md`.
>
> Leia:
>
> - `docs/FSD.md`
> - `docs/DESIGN.md`
> - `docs/PLANO.md`
> - arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
> - `prompts\`
>
> Analise se os prompts que estão na pasta `prompts\` precisam de algum ajuste para esta stack.
>
> Para cada prompt, informe:
>
> 1. Se pode ser usado como está.
> 2. O que precisa ser adaptado.
> 3. O motivo.
> 4. A versão corrigida do trecho, se necessário.
>
> Não altere código do projeto.
> Não faça deploy.
> Apenas revise a compatibilidade do fluxo.

"Esse pedido é útil quando o usuário está em dúvida se o fluxo combina com o projeto."

#### Blocos "Copiar" menores (regras/templates citados no capítulo)

**Regra de estrutura de pastas:**
> PHP puro pode usar app/, public/, config/, database/.
> Laravel usa app/, routes/, resources/, database/, public/.
> Next.js pode usar app/, pages/, components/, public/.
> Django pode usar manage.py, apps, templates, static, migrations.
> Node.js com Express pode usar src/, routes/, controllers/, services/.

"Por isso, os prompts não devem mandar a IA criar uma estrutura fixa se o FSD definiu outra. O correto é pedir: **Siga a estrutura definida no FSD e no arquivo de contexto.**"

**Exemplos de comandos que mudam (blocos "Copiar" individuais):**
> composer install
> npm install
> php artisan migrate
> python manage.py migrate
> npm run build

"A IA deve descobrir os comandos pelo FSD, pela documentação do projeto ou pelos arquivos reais, como `package.json`, `composer.json`, `pyproject.toml`, `requirements.txt` ou equivalentes."

**Regra de banco de dados (bloco "Copiar"):**
> Crie migrations, schemas, scripts ou mecanismos equivalentes conforme a stack definida no FSD.

**Regra de segurança (bloco "Copiar"):**
> Aplique as práticas de segurança compatíveis com a stack do projeto.

**Exemplos de banco por stack (texto corrido):**
- Laravel usa migrations próprias.
- Django usa migrations do framework.
- Supabase pode usar migrations SQL e políticas de segurança.
- Firebase pode usar Firestore sem SQL tradicional.
- PHP puro pode usar scripts SQL próprios.
- Node.js pode usar Prisma, Drizzle, Sequelize ou SQL direto.

**Exemplos de segurança por stack (texto corrido):**
- PHP puro: `password_hash`, `password_verify`, `htmlspecialchars` e prepared statements.
- Laravel: recursos próprios de autenticação, CSRF, validação e ORM.
- Django: autenticação, proteção CSRF e ORM integrados.
- Next.js: bibliotecas de autenticação, middleware e validação no servidor.
- Supabase: autenticação gerenciada, políticas RLS e controle de permissões no banco.
- Firebase: regras de segurança no Firestore ou Storage.

**Exemplos de .gitignore por stack (bloco "Copiar"):**
> Node.js normalmente ignora node_modules/.
> Python normalmente ignora .venv/.
> Laravel ignora .env e pode versionar composer.lock.
> Next.js normalmente ignora .next/.

### 3.4 Modelos/estruturas de documentos citados

- **Documentos que os prompts 01 a 06 devem sempre seguir**: `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).
- **Pasta de prompts adaptáveis**: `prompts\` no projeto, com arquivos `.md` numerados: `01-validar-insumos.md`, `02-planejar-e-preparar.md`, `03-inicializar-git.md`, `04-construir-fase.md`, `05-revisao-seguranca.md`, `06-documentacao-final.md`.
- **Arquivos reais para descobrir comandos**: `package.json`, `composer.json`, `pyproject.toml`, `requirements.txt` ou equivalentes.

### 3.5 Regras, avisos, boas práticas e armadilhas

- **Regra principal**: "Quem define a tecnologia do projeto é o FSD, não o improviso da IA."
- **Não trocar palavras soltas nos prompts** (ex.: "PHP" → "Node.js") — pode gerar confusão; a solução correta é a IA ler a documentação do projeto e seguir a stack definida.
- **O que não muda no fluxo (princípios independentes de tecnologia)** — a IA deve sempre: ler o FSD antes de decidir; respeitar o DESIGN.md quando houver interface; manter STATUS.md atualizado; registrar erros em ERROS.md; usar Git; construir em fases; testar antes de avançar; não inventar funcionalidades; não versionar segredos; explicar testes para o usuário leigo; fazer commit ao final das etapas importantes.
- **Estrutura de pastas**: os prompts não devem mandar a IA criar estrutura fixa se o FSD definiu outra; pedir "Siga a estrutura definida no FSD e no arquivo de contexto."
- **Banco de dados**: não dizer sempre "crie arquivos em database/migrations/" como regra universal; usar "Crie migrations, schemas, scripts ou mecanismos equivalentes conforme a stack definida no FSD."
- **Segurança**: aplicar práticas compatíveis com a stack; o prompt 05 não deve tentar aplicar soluções de PHP puro em outra stack.
- **Pesquisa oficial**: quando o projeto envolver hospedagem ou framework específico, a IA deve consultar documentação oficial sempre que possível; "A documentação oficial deve ter prioridade sobre tutoriais aleatórios."
- **Decisões técnicas na análise**: "Tudo que for essencial para o funcionamento, a segurança, a arquitetura ou a publicação do sistema deve aparecer primeiro na análise. Depois disso, a fase de codificação apenas transforma essas decisões em código."
- **FSD vago = improviso**: "Se essas informações estiverem vagas, a IA pode improvisar. E improviso técnico costuma virar problema."
- **Prompt 01**: validar insumos não deve depender da stack; apenas reconhecer a stack e validar se os insumos fazem sentido para ela.
- **Prompt 02**: criar `PLANO.md`, `STATUS.md`, `ERROS.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) e estrutura inicial do projeto **vinda da stack**; "O prompt não deve obrigar MVC se a stack não usa MVC."
- **Prompt 03**: adaptação principal é o `.gitignore`; precisa ler o FSD e o arquivo de contexto antes de montar (já ajustado no roteiro).
- **Prompt 04**: o mais dependente da stack, mas a lógica é igual (ler contexto, identificar próxima fase, construir apenas essa fase, usar comandos da stack, testar, atualizar STATUS.md, registrar ERROS.md, fazer commit); descobrir comandos pelos arquivos do projeto e pelo FSD.
- **Prompt 06**: documentar a stack real (ex.: se Next.js, explicar Next.js; se Laravel, explicar Artisan, migrations, .env, rotas e estrutura; se Supabase, tabelas, policies, auth e variáveis).

### 3.6 Checklists mencionados

**Checklist para adaptar o fluxo** (transcrito integralmente na seção 3.3, bloco "Checklist para adaptar o fluxo") — 15 itens: 9 verificações de definições no FSD (linguagem principal, framework, banco/persistência, ambiente local, ambiente de produção, estratégia de deploy, comandos principais, autenticação e autorização, cuidados de segurança) + 6 verificações de cada prompt adaptado (prompt 01 validando stack real, prompt 02 criando estrutura correta, prompt 03 gerando .gitignore adequado, prompt 04 usando comandos da stack real, prompt 05 revisando segurança da stack real, prompt 06 documentando a stack real).

### 3.7 Vocabulário especializado / tabela de termos

| Termo | Explicação simples |
|---|---|
| Stack | Conjunto de tecnologias usadas em um projeto. |
| Framework | Base pronta que ajuda a construir sistemas seguindo padrões. |
| Hospedagem | Serviço onde o sistema será publicado. |
| Deploy | Processo de publicar o sistema para uso real. |
| Build | Preparação dos arquivos finais para produção. |
| Runtime | Ambiente que executa o sistema, como PHP, Node.js ou Python. |
| Dependência | Biblioteca ou pacote que o projeto precisa para funcionar. |
| Variável de ambiente | Configuração externa usada para guardar valores como senhas, URLs e tokens. |
| Provedor | Empresa ou serviço que hospeda ou executa o sistema. |
| Adaptação | Ajuste do fluxo para funcionar em outro cenário técnico. |

### 3.8 Erros comuns e como resolver

**"O que você não deve fazer" (lista de proibições do capítulo):**
- trocar nomes de tecnologias manualmente sem entender o impacto;
- mandar a IA escolher stack por conta própria;
- deixar FSD vago;
- ignorar comandos específicos da stack;
- versionar segredos;
- copiar deploy de outro projeto sem revisar;
- pular revisão de segurança;
- pular documentação final.

**Como resolver / regras de ouro:**
- Para duvidar se o fluxo combina com o projeto, usar o "Prompt para pedir adaptação completa do fluxo" (revisão de compatibilidade, sem alterar código).
- Para evitar memória antiga da IA, usar o "Prompt para pedir pesquisa oficial".
- Verificar o FSD antes de codificar com o "Prompt para verificar se o FSD está pronto para outra stack".

---

## 4. Itens acionáveis (o que o desenvolvedor precisa executar)

### Capítulo 15 — Criando Skills

**Saídas a criar:**
- `docs/04-construir-fase.md` — salvar o prompt do passo 4 (prompt 04) com esse nome, na pasta `docs/` do projeto.
- Skill `construir-proxima-fase/` com:
  - `SKILL.md` (frontmatter válido, nome em minúsculas, descrição de acionamento explícito);
  - `references/prompt-04-construir-fase.md` (prompt original completo).

**Comandos a executar/usar:**
- Abrir um **chat novo** na IA codificadora, anexar `docs/04-construir-fase.md` e executar o **"Prompt para criar e instalar a skill"** (transcrito na íntegra).
- Depois de instalar, usar a skill em chat novo com: `Executar skill: construir próxima fase` (ou `Use a skill de construção da próxima fase.`; ou slash command `/construir-proxima-fase`, se suportado).
- Se a skill não aparecer: fechar e abrir a ferramenta, abrir novo chat, conferir pasta de instalação, verificar nome/descrição.

**Prompts a executar (deste capítulo):** 1 prompt principal (criação da skill) — transcrito completo.

### Capítulo 16 — Outras stacks

**Saídas a criar:**
- Pasta `prompts\` no projeto, com prompts numerados: `01-validar-insumos.md`, `02-planejar-e-preparar.md`, `03-inicializar-git.md`, `04-construir-fase.md`, `05-revisao-seguranca.md`, `06-documentacao-final.md`.

**Prompts a executar (deste capítulo):** 3 prompts — todos transcritos completos:
1. "Prompt para verificar se o FSD está pronto para outra stack" (antes de começar a construção).
2. "Prompt para pedir pesquisa oficial" (ferramenta com atualizações frequentes).
3. "Prompt para pedir adaptação completa do fluxo" (quando houver dúvida se o fluxo combina com o projeto).

**Checklist a rodar:** "Checklist para adaptar o fluxo" (15 itens) antes de começar projeto com stack diferente.

**Documentos a garantir no projeto:** `docs/FSD.md` (com as 13 informações claras listadas no prompt de verificação), arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, `docs/MANUTENCAO.md`.

---

## 5. Avisos sobre conteúdo ausente

- O **texto integral do prompt 04 ("Passo 4 - Codificando em etapas") não está presente nestes capítulos** — o capítulo 15 apenas o referencia (diz-se que ele lê o contexto, identifica a próxima fase pendente, constrói apenas essa fase, testa, atualiza arquivos vivos, registra erros e orienta o próximo passo). Para criar a skill, o usuário precisa ter o prompt 04 disponível (salvo em `docs/04-construir-fase.md`) — provavelmente transcrito em capítulo anterior da metodologia (não analisado aqui).
- **Frontmatter do SKILL.md**: o capítulo exige "frontmatter válido" e "nome em minúsculas", mas **não fornece o formato exato/exemplo de frontmatter** — não presente neste capítulo.
- **Tabela de termos do capítulo 15 e 16**: transcritas integralmente nas seções 2.7 e 3.7; nenhum termo adicional definido fora delas (além de "Slash command", no capítulo 15).
- Nenhum outro capítulo além de `codificacao-15.txt` e `codificacao-16.txt` foi analisado neste documento.

# Grupo 13 — Erros comuns e Conclusão

---

## 1. Visão geral do grupo

Este grupo fecha o fluxo da metodologia APES IA5K.

- **Capítulo 17 (codificacao-17.txt)** — **"Erros comuns durante a codificação com IA"**: ensina a tratar falhas sem pânico e sem deixar a IA "bagunçar" o projeto. É uma etapa de **correção/reflexão dentro do fluxo de construção** (ocorre entre construir e testar, e sempre que um erro aparece). Apresenta 15 erros comuns, cada um com um **prompt de correção pronto**, um **prompt universal para correção de erro**, um modelo para **voltar com Git (rollback)**, um **checklist de investigação de erro** e a tabela de **vocabulário técnico**.
- **Capítulo 18 (codificacao-18.txt)** — **Conclusão / "Agora você tem um processo"**: fecha o treinamento, recapitula tudo o que foi aprendido, define a regra mais importante ("Não deixe a IA improvisar"), explica os papéis (chats separados, arquivos vivos, usuário) e dá as instruções finais para aplicar o processo em um projeto real. **Não contém prompts, checklists nem tabelas de vocabulário.**

O capítulo 17 reforça o valor central da metodologia: os documentos de contexto (`docs/FSD.md`, `docs/DESIGN.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`)) funcionam como "trilhos"; o erro é tratado como **investigação** (sintoma → causa → correção mínima → registro), nunca como "corrija tudo".

---

## 2. Capítulo por capítulo

---

# Capítulo 17 — Erros comuns durante a codificação com IA

### 2.1 Objetivo do capítulo

Ensinar o desenvolvedor a lidar com erros "sem pânico e sem deixar a IA bagunçar o projeto tentando corrigir tudo ao mesmo tempo". O capítulo não promete que erros nunca aparecerão; ele ensina o método correto de investigação e correção. Mesmo seguindo a metodologia, erros acontecem por causas diversas: a IA pode interpretar algo errado, o ambiente local pode estar mal configurado, uma dependência pode falhar, um arquivo pode não estar no lugar, o banco pode não conectar, o navegador pode mostrar tela em branco, um comando pode funcionar em um projeto e falhar em outro.

### 2.2 Índice de prompts (abertura do capítulo)

O capítulo abre com um índice dos 15 erros e do prompt universal:

1. Erro 1: a IA não leu os arquivos de contexto
2. Erro 2: a IA quer construir várias fases de uma vez
3. Erro 3: a IA inventa funcionalidades fora do FSD
4. Erro 4: a IA ignora o DESIGN.md
5. Erro 5: a IA não testa
6. Erro 6: a IA esquece de atualizar STATUS.md
7. Erro 7: a IA esquece de registrar o erro em ERROS.md
8. Erro 8: erro de dependência ou instalação
9. Erro 9: erro de banco de dados
10. Erro 10: tela em branco ou erro 500
11. Erro 11: formulário não salva
12. Erro 12: login ou permissão incorreta
13. Erro 13: a IA corrige um problema e quebra outro
14. Erro 14: arquivos sensíveis aparecem no Git
16. Prompt universal para correção de erro

### 2.3 Conceito central: o erro como investigação

O texto abre com o alerta: quando um iniciante encontra um erro, pensa "deu tudo errado", mas na maioria das vezes **deu errado em algum ponto específico**. Pedir correção de forma vaga faz a IA mexer em muitas partes ao mesmo tempo.

**Exemplo ruim (bloco "Copiar" — o que NÃO fazer):**

> Copiar
>
> Deu erro. Corrija tudo.

Este pedido pode causar novos problemas: a IA pode alterar arquivos que não precisava, trocar a lógica, remover uma proteção, refazer uma estrutura ou tentar uma solução que ignora o que já estava funcionando.

**A forma correta** é tratar o erro como uma investigação: mostrar o sintoma, explicar o que estava fazendo, informar o resultado esperado e pedir que a IA corrija apenas o necessário.

### 2.4 O que é um erro no desenvolvimento

Definição: **um erro é um comportamento diferente do esperado**. Pode ser visível (mensagem no navegador), técnico (falha no terminal) ou lógico (permissão errada).

Exemplos de erro citados:
- a página não abre;
- o login não funciona;
- o formulário não salva;
- o botão não faz nada;
- a tela fica quebrada no celular;
- o comando de instalação falha;
- o banco não conecta;
- o usuário comum acessa área administrativa;
- um dado desaparece depois de atualizar a página.

"O erro é uma pista. Ele mostra onde precisamos investigar."

### 2.5 Vocabulário técnico (tabela Termo/Explicação)

| Termo | Explicação simples |
|---|---|
| Erro | Algo que impede o sistema de funcionar como esperado. |
| Bug | Comportamento incorreto do sistema. |
| Sintoma | O que você vê quando o problema acontece. |
| Causa | O motivo real do erro. |
| Correção | Alteração feita para resolver o problema. |
| Regressão | Quando uma correção quebra algo que já funcionava. |
| Log | Registro técnico de eventos ou erros. |
| Stack trace | Detalhamento técnico do caminho do erro no código. |
| Debug | Processo de investigar e entender um erro. |
| Rollback | Voltar o projeto para um estado anterior usando Git ou backup. |

### 2.6 A regra principal ao lidar com erros

**Bloco "Copiar" — regra principal:**

> Não peça para a IA corrigir tudo. Peça para ela investigar uma falha específica.

Um bom pedido de correção deve dizer:
- o que você tentou fazer;
- o que deveria acontecer;
- o que aconteceu de verdade;
- qual mensagem apareceu;
- em qual fase do projeto você está;
- qual arquivo vivo deve ser consultado.

### 2.7 O papel do ERROS.md

O arquivo `docs/ERROS.md` existe para **registrar problemas e soluções**; funciona como uma memória técnica do projeto. Sempre que um erro importante aparecer, a IA deve registrar: **sintoma; causa; solução aplicada; como evitar no futuro**. Isso evita que o mesmo erro seja investigado do zero várias vezes, ajuda em fases futuras e em novos chats.

**Bloco "Copiar" — exemplo de registro no ERROS.md:**

> ## 2026-06-24 - Falha ao conectar no banco local
>
> - Sintoma:
> A tela inicial carregava, mas o login mostrava erro de conexão.
>
> - Causa:
> O arquivo de configuração local apontava para um banco com nome diferente do criado.
>
> - Solução aplicada:
> O nome do banco foi corrigido no arquivo de configuração local.
>
> - Como evitar no futuro:
> Conferir o nome do banco definido no FSD antes de rodar os testes de login.

### 2.8 Erro 1 — a IA não leu os arquivos de contexto

Erro comum: a IA começa a codificar sem ler (bloco "Copiar" que lista os arquivos de contexto):

> arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`);
> docs/FSD.md;
> docs/DESIGN.md;
> docs/PLANO.md;
> docs/STATUS.md;
> docs/ERROS.md.

Consequência: a IA pode criar algo fora do padrão do projeto.

**Sinais do problema:**
- a IA cria uma estrutura diferente da definida;
- usa uma tecnologia não prevista;
- ignora o DESIGN.md;
- constrói uma fase que não era a próxima;
- repete algo que já estava pronto;
- não atualiza STATUS.md.

**Bloco "Copiar" — Prompt de correção do Erro 1 (transcrição integral):**

> Pare.
>
> Antes de continuar, leia novamente:
>
> - arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
> - `docs/FSD.md`
> - `docs/DESIGN.md`
> - `docs/PLANO.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Depois, explique:
> 1. qual é a fase atual;
> 2. qual é a próxima fase pendente;
> 3. quais arquivos do projeto devem orientar a alteração;
> 4. se algo que você já fez precisa ser revertido ou ajustado.
>
> Não altere novos arquivos até reconstruir o contexto.

### 2.9 Erro 2 — a IA quer construir várias fases de uma vez

Às vezes a IA tenta "aproveitar" e fazer mais do que foi pedido. **Bloco "Copiar" — exemplo do problema:**

> A fase era login, mas a IA começou a criar painel, relatórios e cadastro.

"Isso parece produtividade, mas reduz o controle."

**Bloco "Copiar" — Prompt de correção do Erro 2 (transcrição integral):**

> Pare.
>
> Nesta execução, construa apenas a próxima fase pendente indicada em `docs/STATUS.md` e `docs/PLANO.md`.
>
> Não avance para outras fases.
>
> Liste o que pertence à fase atual e o que deve ficar para fases futuras.
>
> Se você já alterou algo fora da fase atual, indique quais arquivos precisam ser revertidos ou ajustados.

### 2.10 Erro 3 — a IA inventa funcionalidades fora do FSD

Acontece quando a IA tenta "melhorar" o sistema sem autorização. Exemplos: cria uma tela extra; adiciona um campo não pedido; cria permissões não documentadas; inclui integração externa; muda regra de negócio; troca biblioteca sem necessidade.

**Bloco "Copiar" — Prompt de correção do Erro 3 (transcrição integral):**

> Revise a alteração feita comparando com `docs/FSD.md`.
>
> Identifique:
> 1. o que está previsto no FSD;
> 2. o que foi criado fora do escopo;
> 3. o que deve ser mantido;
> 4. o que deve ser removido ou ajustado.
>
> Não crie novas funcionalidades.
> Corrija apenas para alinhar a fase atual ao FSD.

### 2.11 Erro 4 — a IA ignora o DESIGN.md

Em fases com interface, a IA pode criar telas funcionais, mas visualmente desalinhadas. Sinais: cores diferentes; botões sem padrão; layout quebrado; tipografia inconsistente; espaçamento ruim; logo ausente; componentes diferentes do combinado.

**Bloco "Copiar" — Prompt de correção do Erro 4 (transcrição integral):**

> Compare a interface criada com `docs/DESIGN.md`.
>
> Ajuste apenas o visual da fase atual para respeitar:
>
> - cores;
> - tipografia;
> - espaçamentos;
> - componentes;
> - botões;
> - formulários;
> - responsividade;
> - identidade visual.
>
> Não altere regras de negócio.
> Não avance para outra fase.
> Depois me diga como testar visualmente.

### 2.12 Erro 5 — a IA não testa

A IA pode concluir a tarefa sem executar testes ou sem entregar passos de teste manual. "Isso é perigoso."

**Bloco "Copiar" — Prompt de correção do Erro 5 (transcrição integral):**

> Antes de considerar a fase concluída, teste o que foi implementado.
>
> Use os comandos adequados à stack definida no FSD.
>
> Se não puder executar testes automaticamente, entregue testes manuais em passos simples.
>
> Para cada teste, informe:
> 1. o que devo fazer;
> 2. qual resultado esperado;
> 3. o que indicaria erro.
>
> Não marque a fase como concluída sem validar os critérios de pronto.

### 2.13 Erro 6 — a IA esquece de atualizar STATUS.md

O STATUS.md é a memória de progresso do projeto. Se ficar desatualizado, o próximo chat pode se confundir.

**Bloco "Copiar" — Prompt de correção do Erro 6 (transcrição integral):**

> Atualize `docs/STATUS.md` antes de encerrar esta etapa.
>
> Registre:
> - fase trabalhada;
> - tarefas concluídas;
> - tarefas pendentes, se houver;
> - arquivos principais alterados;
> - testes executados;
> - resultado dos testes;
> - próxima fase recomendada.
>
> Não avance para outra fase.

### 2.14 Erro 7 — a IA esquece de registrar o erro em ERROS.md

Se um erro foi encontrado e corrigido, ele deve ser registrado.

**Bloco "Copiar" — Prompt de correção do Erro 7 (transcrição integral, inclui o formato do registro):**

> Registre o erro corrigido em `docs/ERROS.md`.
>
> Use este formato:
>
> ## <data> - <título curto do erro>
>
> - Sintoma:
> - Causa:
> - Solução aplicada:
> - Como evitar no futuro:
>
> Depois confirme o registro.

### 2.15 Erro 8 — erro de dependência ou instalação

Definição: **Dependência é uma biblioteca ou pacote que o projeto usa para funcionar**. Erros desse tipo aparecem durante comandos como instalação, build ou execução local. Exemplos: pacote não encontrado; versão incompatível; comando não reconhecido; permissão negada; arquivo de lock inconsistente; falta de runtime instalado; cache quebrado.

**Bloco "Copiar" — Prompt de correção do Erro 8 (transcrição integral):**

> Encontrei erro ao instalar ou executar dependências.
>
> Comando executado:
>
> [cole aqui o comando]
>
> Erro completo:
>
> [cole aqui a mensagem completa]
>
> Leia `docs/FSD.md`, o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`) e `docs/ERROS.md`. Identifique:
> 1. qual dependência ou comando falhou;
> 2. a causa provável;
> 3. se a versão usada é compatível com o FSD;
> 4. a correção mais segura;
> 5. se algum arquivo de configuração precisa ser ajustado.
>
> Corrija apenas o necessário e registre a solução em `docs/ERROS.md`.

### 2.16 Erro 9 — erro de banco de dados

"Erros de banco são frequentes." Exemplos: banco não existe; usuário ou senha incorretos; tabela não encontrada; campo ausente; migration já executada; tipo de dado incompatível; permissão negada; conexão recusada.

**Bloco "Copiar" — Prompt de correção do Erro 9 (transcrição integral):**

> Encontrei erro relacionado ao banco de dados.
>
> Erro completo:
>
> [cole aqui o erro]
>
> O que eu estava tentando fazer:
>
> [explique o passo]
>
> Leia `docs/FSD.md`, `docs/STATUS.md` e `docs/ERROS.md`. Verifique:
> 1. se a configuração do banco está de acordo com o FSD;
> 2. se as migrations, schemas ou scripts necessários foram criados;
> 3. se eles já foram executados;
> 4. se existe risco de apagar dados;
> 5. qual é a correção mais segura.
>
> Não apague nem sobrescreva dados sem minha confirmação. Registre a solução em `docs/ERROS.md`.

### 2.17 Erro 10 — tela em branco ou erro 500

Tela em branco normalmente indica que algo falhou por trás da interface. **Erro 500 significa erro interno do servidor.**

**Bloco "Copiar" — Prompt de correção do Erro 10 (transcrição integral):**

> A tela ficou em branco ou apresentou erro 500.
>
> URL acessada:
>
> [cole aqui a URL]
>
> O que eu fiz antes do erro:
> 1.
> 2.
> 3.
> Mensagem exibida, se houver:
>
> [cole aqui]
>
> Leia os logs disponíveis conforme a stack do projeto. Leia também `docs/ERROS.md`. Identifique a causa provável, corrija apenas o necessário e me diga como testar novamente. Registre a solução em `docs/ERROS.md`.

### 2.18 Erro 11 — formulário não salva

Esse erro pode ter várias causas: validação bloqueando; rota incorreta; campo com nome errado; erro de banco; proteção CSRF; permissão; configuração de sessão; falha no JavaScript; API retornando erro.

**Bloco "Copiar" — Prompt de correção do Erro 11 (transcrição integral):**

> O formulário da fase atual não está salvando.
>
> Tela:
>
> [descreva a tela]
>
> Dados preenchidos:
>
> [descreva os dados de teste]
>
> Resultado esperado:
>
> [o que deveria acontecer]
>
> Resultado obtido:
>
> [o que aconteceu]
>
> Mensagem de erro:
>
> [cole aqui, se houver]
>
> Leia `docs/FSD.md`, `docs/DESIGN.md`, `docs/STATUS.md` e `docs/ERROS.md`.
>
> Investigue sem alterar outras fases.
>
> Corrija apenas o necessário para o formulário funcionar conforme o FSD. Depois entregue passos de teste manual.

### 2.19 Erro 12 — login ou permissão incorreta

"Falhas de login e permissão são sensíveis." Exemplos: senha correta não entra; senha errada entra; usuário comum acessa admin; logout não encerra sessão; usuário vê dados de outro usuário; rota protegida abre sem login.

**Bloco "Copiar" — Prompt de correção do Erro 12 (transcrição integral):**

> Encontrei problema de autenticação ou permissão.
>
> O que testei:
>
> [descreva os passos]
>
> Resultado esperado:
>
> [descreva o comportamento correto segundo o FSD]
>
> Resultado obtido:
>
> [descreva o que aconteceu]
>
> Leia `docs/FSD.md`, especialmente as regras de usuários, perfis, permissões e isolamento de dados.
>
> Corrija com foco em segurança.
>
> Não remova validações para fazer funcionar.
>
> Depois entregue testes manuais para usuário válido, usuário inválido e usuário sem permissão. Registre a solução em `docs/ERROS.md`.

### 2.20 Erro 13 — a IA corrige um problema e quebra outro

"Isso se chama **regressão**. Regressão acontece quando uma correção nova quebra algo que já funcionava." Exemplo: a IA corrigiu o cadastro, mas o login parou de funcionar.

**Bloco "Copiar" — Prompt de correção do Erro 13 (transcrição integral):**

> Após a última correção, algo que funcionava parou de funcionar.
>
> Antes funcionava:
>
> [descreva]
>
> Depois da correção, quebrou:
>
> [descreva]
>
> Leia o histórico recente de alterações, `docs/STATUS.md` e `docs/ERROS.md`.
>
> Identifique quais arquivos foram alterados na última correção e procure a causa da regressão.
>
> Corrija preservando o que já funcionava.
>
> Depois entregue uma lista de testes de regressão para confirmar que a correção não quebrou outras partes.

### 2.21 Erro 14 — arquivos sensíveis aparecem no Git

"Este erro precisa de atenção." Arquivos sensíveis incluem: `.env`; configuração real; senhas; tokens; chaves privadas; certificados; logs; backups; dumps de banco.

**Bloco "Copiar" — Prompt de correção do Erro 14 (transcrição integral):**

> Pare.
>
> O Git está tentando versionar arquivos sensíveis.
>
> Verifique `git status` e o `.gitignore`.
>
> Identifique quais arquivos não devem entrar no commit.
>
> Ajuste o `.gitignore` conforme a stack definida no FSD.
>
> Não faça commit até confirmar que senhas, tokens, chaves, logs, backups e dumps ficaram fora do Git.
>
> Explique o que foi protegido.
>
> Se um segredo real já foi enviado para o GitHub, a situação é mais grave.
>
> Nesse caso, a orientação é trocar imediatamente o segredo, porque ele deve ser considerado exposto.

### 2.23 Como copiar um erro corretamente

Quando aparecer um erro, copie o máximo de contexto útil. Inclua:
- mensagem completa;
- comando executado;
- URL acessada;
- passos antes do erro;
- resultado esperado;
- resultado obtido;
- trecho do log, se houver;
- fase atual;
- stack do projeto.

Avisos: evite mandar apenas uma foto se você puder copiar o texto — "Texto é mais fácil para a IA analisar." Se só tiver print, descreva também o que você fez antes do erro.

### 2.24 Prompt universal para correção de erro

Quando não souber qual modelo usar, use este.

**Bloco "Copiar" — Prompt universal (transcrição integral):**

> Encontrei um erro durante a fase atual.
>
> Fase atual:
>
> [informe a fase, se souber]
>
> O que eu estava tentando fazer:
>
> [explique em passos simples]
>
> Resultado esperado:
>
> [o que deveria acontecer]
>
> Resultado obtido:
>
> [o que aconteceu de verdade]
>
> Erro completo:
>
> [cole aqui a mensagem completa do erro]
>
> Leia antes de corrigir:
> - arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
> - `docs/FSD.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Investigue a causa. Corrija apenas o necessário. Não avance para outra fase. Não remova segurança para resolver rápido.
>
> Depois teste novamente, atualize `docs/STATUS.md` se necessário e registre a solução em `docs/ERROS.md`.

### 2.25 Quando usar Git para voltar atrás (rollback)

Às vezes a correção da IA piora a situação. Se você fez commits frequentes, o Git pode ajudar a recuperar o estado anterior. **Antes de desfazer qualquer coisa, peça orientação.**

**Bloco "Copiar" — Prompt para rollback via Git (transcrição integral):**

> A última alteração piorou o projeto.
>
> Antes de desfazer, analise o histórico do Git e explique minhas opções com segurança.
>
> Mostre:
> 1. qual foi o último commit;
> 2. quais arquivos foram alterados;
> 3. como posso voltar sem perder trabalho importante;
> 4. qual comando devo usar, se for necessário.
>
> Não execute comandos destrutivos sem minha confirmação.

Aviso: para iniciantes, não sair rodando comandos de rollback sem entender o impacto.

### 2.26 Checklist de investigação de erro

Use este checklist quando algo falhar.

**Bloco "Copiar" — Checklist (transcrição integral):**

> [ ] Copiei a mensagem completa do erro.
> [ ] Anotei o que eu estava fazendo antes do erro.
> [ ] Escrevi o resultado esperado.
> [ ] Escrevi o resultado obtido.
> [ ] Informei a fase atual.
> [ ] Pedi para a IA ler STATUS.md e ERROS.md.
> [ ] Pedi para corrigir apenas o necessário.
> [ ] Pedi para não avançar de fase.
> [ ] Pedi para testar novamente.
> [ ] Pedi para registrar a solução em ERROS.md.
> [ ] Conferi se STATUS.md precisa ser atualizado.
> [ ] Fiz commit depois da correção funcionar.

### 2.27 O que não fazer quando aparece erro

Evite:
- pedir "corrija tudo";
- abrir vários chats diferentes para o mesmo erro sem contexto;
- aceitar correção sem testar;
- deixar erro sem registro;
- avançar para a próxima fase com erro aberto;
- copiar comandos aleatórios da internet;
- apagar arquivos sem entender;
- remover segurança para fazer funcionar;
- versionar segredos;
- ignorar o Git.

Fechamento do capítulo: "A pressa é uma das maiores causas de bagunça em projetos com IA."

### 2.28 Regras, avisos e boas práticas do capítulo 17 (consolidação)

- **Regra principal**: não pedir para a IA corrigir tudo; pedir para investigar uma falha específica.
- **Padrão de pedido de correção**: informar o que tentou, o que deveria acontecer, o que aconteceu, qual mensagem apareceu, em qual fase está, qual arquivo vivo deve ser consultado.
- **ERROS.md**: sempre registrar sintoma, causa, solução aplicada e como evitar no futuro.
- **Formato de registro no ERROS.md**: `## <data> - <título curto do erro>` seguido dos campos Sintoma / Causa / Solução aplicada / Como evitar no futuro.
- **Segurança**: não apagar nem sobrescrever dados sem confirmação (Erro 9); não remover validações/segurança para fazer funcionar (Erro 12, prompt universal).
- **Git/segredos**: ajustar `.gitignore` conforme a stack do FSD; se um segredo real foi enviado ao GitHub, **trocar o segredo imediatamente** — ele deve ser considerado exposto (Erro 14).
- **Rollback**: só com análise prévia do histórico do Git e confirmação; comandos destrutivos nunca sem confirmação.
- **Testes**: nunca marcar fase concluída sem validar critérios de pronto; entregar testes manuais em passos simples com resultado esperado e o que indicaria erro (Erro 5).
- **Fases**: construir uma fase por vez; não avançar; reverter o que foi alterado fora da fase (Erros 2, 6, prompts universal e 13).
- **Contexto**: a IA deve ler os arquivos de contexto antes de codificar; o arquivo de contexto é `CLAUDE.md` no Claude Code e `AGENTS.md` no Codex e no Antigravity (Erro 1, prompt universal).
- **Copiar erros**: texto completo > print; se só houver print, descrever também o que fez antes do erro.

### 2.29 Modelos/estruturas de documentos citados no capítulo 17

- `docs/ERROS.md` — memória técnica do projeto; registros com formato `## <data> - <título curto do erro>` + campos Sintoma / Causa / Solução aplicada / Como evitar no futuro.
- `docs/STATUS.md` — memória de progresso; atualização registra fase trabalhada, tarefas concluídas, tarefas pendentes, arquivos principais alterados, testes executados, resultado dos testes, próxima fase recomendada.
- `docs/FSD.md` — fonte da verdade funcional (escopo, regras, stack, usuários/perfis/permissões/isolamento de dados, configuração de banco).
- `docs/DESIGN.md` — padrão visual (cores, tipografia, espaçamentos, componentes, botões, formulários, responsividade, identidade visual).
- `docs/PLANO.md` — sequência de construção (fases).
- Arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity) — orienta a IA sobre como trabalhar.
- `.gitignore` — ajustado conforme a stack definida no FSD para proteger arquivos sensíveis.

---

# Capítulo 18 — Conclusão: "Agora você tem um processo"

### 3.1 Objetivo do capítulo

Fechar o treinamento consolidando a tese central: **codificar com IA não é apenas pedir código, é conduzir um processo**. A IA pode escrever arquivos, criar telas, gerar comandos, corrigir erros e documentar, mas precisa de direção. O objetivo não é transformar o leitor em programador tradicional "da noite para o dia", e sim ensinar a usar a IA como parceira de desenvolvimento, com método e controle.

### 3.2 O que você aprendeu (recapitulação do fluxo completo)

- Começar com um **chat de ajuda**, separado dos chats principais, para tirar dúvidas sem contaminar o contexto da codificação.
- Validar os **insumos do projeto** antes de escrever código.
- **Preparar o terreno**, criar o **plano de construção**, configurar **arquivos vivos** e orientar a IA com um **arquivo de contexto**.
- **Proteger o projeto com Git e GitHub**, construir **uma fase por vez**, **testar** o que foi criado, **corrigir erros com método**, **revisar segurança**, e **documentar o sistema**. Depois disso, o usuário publica na hospedagem que escolher (fora da metodologia).

**Sequência completa do fluxo (transforma a codificação em uma sequência mais segura):**
1. explorar ideias;
2. criar a análise do sistema;
3. entender;
4. validar;
5. preparar;
6. versionar;
7. construir;
8. testar;
9. corrigir;
10. proteger;
11. documentar.

### 3.3 A regra mais importante

> **Não deixe a IA improvisar.**

A IA deve seguir: `docs/FSD.md`, `docs/DESIGN.md`, o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), `docs/PLANO.md`, `docs/STATUS.md` e `docs/ERROS.md`. Esses arquivos funcionam como **trilhos** e mantêm o projeto organizado mesmo quando você abre novos chats ou troca de ferramenta.

### 3.4 O papel dos chats separados

Durante o fluxo, cada chat tem uma função:
- O **chat de ajuda** serve para aprender.
- Os **chats dos prompts** servem para executar etapas.

Essa separação evita que dúvidas gerais se misturem com decisões e tarefas oficiais do projeto. Quando tiver uma dúvida, use o chat de ajuda. Quando for construir, testar, revisar ou publicar, use o chat da etapa correta.

### 3.5 O papel dos arquivos vivos

Os arquivos vivos são uma das partes mais importantes da metodologia:
- `docs/STATUS.md` mostra onde o projeto está.
- `docs/ERROS.md` mostra quais problemas aconteceram e como foram resolvidos.
- `docs/PLANO.md` mostra a sequência de construção.
- O **arquivo de contexto** orienta a IA sobre como trabalhar.

Com esses arquivos, a continuidade do projeto não depende apenas da memória de um chat — "O projeto passa a carregar sua própria memória."

### 3.6 O papel do usuário

Mesmo usando IA, o usuário continua com papel essencial: **conduzir**. Deve conferir se a IA leu os documentos certos, se construiu apenas a fase atual, se respeitou o FSD, se seguiu o design, se testou, se atualizou os arquivos vivos e se fez commit. Não precisa entender cada linha de código, mas precisa seguir o processo. "Essa é uma habilidade central do APES IA5K."

### 3.7 O que fazer a partir daqui (instruções finais)

Em um projeto real, siga o fluxo com calma:
- Não tente pular etapas.
- Use o chat de ajuda sempre que precisar entender algo.
- Use os prompts na ordem correta.
- Construa uma fase por vez.
- Teste antes de avançar.
- Registre erros.
- Faça commits.
- Revise segurança antes de publicar.
- Documente o sistema para manutenção.
- Publique com cuidado.

### 3.8 Encerramento

"Criar sistemas com IA fica muito mais poderoso quando existe método." Sem método, a IA gera código rápido, mas difícil de controlar. Com método, ela se torna uma parceira capaz de ajudar a transformar documentação em software real. Frase final: "Agora você não tem apenas prompts. Você tem um processo."

### 3.9 Conteúdo ausente no capítulo 18

- Não há prompts prontos / blocos "Copiar" neste capítulo.
- Não há checklist.
- Não há tabela de vocabulário técnico (Termo/Explicação).
- Não há modelos de documentos nem nomes de arquivos novos além da recapitulação dos já conhecidos.

---

## 4. Itens acionáveis — o que o desenvolvedor precisa executar

### Documentos/pastas citados (devem existir e estar atualizados)
- `/docs/ERROS.md` — registrar todo erro com formato `## <data> - <título curto do erro>` + Sintoma / Causa / Solução aplicada / Como evitar no futuro.
- `/docs/STATUS.md` — atualizar com fase trabalhada, tarefas concluídas, pendências, arquivos alterados, testes e resultado, próxima fase.
- `/docs/FSD.md`, `/docs/DESIGN.md`, `/docs/PLANO.md`, `/docs/MANUTENCAO.md` — arquivos vivos a serem lidos pela IA antes de qualquer correção.
- Arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).
- `.gitignore` — ajustar conforme a stack do FSD sempre que arquivos sensíveis aparecerem no Git.

### Ações/processos
- Sempre que um erro aparecer: copiar o erro completo em texto (não apenas foto) + contexto (comando, URL, passos, resultado esperado/obtido, fase, stack).
- Investigar antes de corrigir; corrigir apenas o necessário; nunca pedir "corrija tudo".
- Não avançar de fase com erro aberto; testar novamente após corrigir; registrar solução em `ERROS.md`; atualizar `STATUS.md`; fazer commit depois que a correção funcionar.
- Rollback apenas com análise do histórico do Git e confirmação; nenhum comando destrutivo sem confirmação.
- Se um segredo real foi enviado ao GitHub: trocar o segredo imediatamente (considerar exposto).
- Rodar o **Checklist de investigação de erro** (12 itens, seção 2.26) quando algo falhar.

### Prompts prontos para executar (17 blocos de prompt + 1 checklist + regras)
1. Prompt do Erro 1 (não leu os arquivos de contexto) — seção 2.8.
2. Prompt do Erro 2 (quer construir várias fases) — seção 2.9.
3. Prompt do Erro 3 (inventa funcionalidades fora do FSD) — seção 2.10.
4. Prompt do Erro 4 (ignora o DESIGN.md) — seção 2.11.
5. Prompt do Erro 5 (não testa) — seção 2.12.
6. Prompt do Erro 6 (esquece de atualizar STATUS.md) — seção 2.13.
7. Prompt do Erro 7 (esquece de registrar em ERROS.md) — seção 2.14.
8. Prompt do Erro 8 (dependência/instalação) — seção 2.15.
9. Prompt do Erro 9 (banco de dados) — seção 2.16.
10. Prompt do Erro 10 (tela em branco / erro 500) — seção 2.17.
11. Prompt do Erro 11 (formulário não salva) — seção 2.18.
12. Prompt do Erro 12 (login/permissão incorreta) — seção 2.19.
13. Prompt do Erro 13 (regressão) — seção 2.20.
14. Prompt do Erro 14 (arquivos sensíveis no Git) — seção 2.21.
16. Prompt universal para correção de erro — seção 2.24.
17. Prompt para rollback via Git ("A última alteração piorou o projeto") — seção 2.25.
18. Checklist de investigação de erro — seção 2.26.
- Também transcritos: regra principal (seção 2.6), exemplo de registro ERROS.md (seção 2.7), exemplo ruim "Deu erro. Corrija tudo." (seção 2.3) e exemplo do Erro 2 (seção 2.9).

# Grupo 14 — Capítulos Extras: Criar FSD com IA Agêntica e Validar FSD com IA Agêntica

**Arquivos analisados (completos, do início ao fim):**
- `extras-1.txt` — "Passo 5: Criar o FSD com uma IA Agêntica"
- `extras-2.txt` — "Passo 6: Validação do FSD"

---

## 1. Visão geral do grupo

Este grupo de capítulos extras trata das etapas de **criação** e **validação** do **FSD (Functional Specification Document)** usando **IA Agêntica**, em vez de chatbots de chat único (ChatGPT, Gemini).

A motivação central dos dois capítulos é idêntica e repetida em ambos: **em sistemas maiores, o FSD pode ficar muito extenso**. Quando isso acontece, chatbots como ChatGPT e Gemini podem ter dificuldade para gerar o conteúdo completo em uma única resposta ou disponibilizar o arquivo `FSD.md` para download. A solução proposta é usar uma **IA Agêntica**, que trabalha diretamente com os arquivos do projeto e salva novos documentos na pasta de trabalho.

**Posição no fluxo geral:**
- No capítulo anterior (extra 1 → Passo 5), o usuário **cria** o FSD a partir de documentos já existentes: `PRD.md`, `DECISOES_TECNICAS.md` e `DESIGN.md`.
- No capítulo seguinte (extra 2 → Passo 6), o usuário **valida** o FSD gerado, comparando-o com os arquivos anteriores do projeto e verificando se está completo, coerente e pronto para orientar a codificação.
- Ao final, o `docs/FSD.md` validado é o **documento principal para iniciar a fase de codificação com IA**. A IA codificadora deverá usar principalmente `docs/FSD.md` e `docs/DESIGN.md`. O PRD e o documento de decisões técnicas continuam importantes apenas como **histórico da análise**.

**Ferramentas de IA Agêntica citadas (lista idêntica nos dois capítulos):**
1. Codex;
2. Antigravity;
3. Claude Code;
4. Claude Cowork.

**Forma de uso em ambos:** criar um projeto na ferramenta agêntica apontando para a pasta onde os documentos já foram salvos; depois executar os prompts dentro da própria IA Agêntica. Não é necessário anexar documentos manualmente — a ferramenta localiza e analisa os arquivos no próprio diretório. O modo de raciocínio deve ser preferencialmente ativado.

---

## 2. Capítulo: extras-1.txt — "Passo 5: Criar o FSD com uma IA Agêntica"

### 2.1. Objetivo do capítulo

Gerar o documento **FSD.md** (Documento de Especificação Funcional) do sistema usando uma IA Agêntica, diretamente na pasta do projeto, sem depender de uma resposta muito longa no chat e sem necessidade de baixar o arquivo manualmente. O FSD final deve ser completo, consolidado e autossuficiente — capaz de orientar uma IA codificadora a construir o sistema lendo apenas o próprio FSD (e o `DESIGN.md`, quando existir).

### 2.2. Passos EXATOS na ordem

1. **Reconhecer o cenário:** em sistemas maiores o FSD pode ficar muito extenso; chatbots como ChatGPT e Gemini podem falhar em gerar o conteúdo completo em uma única resposta ou disponibilizar o `FSD.md` para download.
2. **Escolher uma IA Agêntica:** Codex, Antigravity, Claude Code ou Claude Cowork.
3. **Criar um projeto** na IA Agêntica apontando para a pasta onde já foram salvos:
   - `PRD.md`
   - `DECISOES_TECNICAS.md`
   - `DESIGN.md`
4. **Executar o "Prompt para criar o FSD"** em um novo chat da IA Agêntica, preferencialmente com o modo de raciocínio ativado. Não anexar os documentos manualmente.
5. **Aguardar a IA gerar o `FSD.md`** na pasta principal do projeto (a pasta `docs/` não deve ser criada neste momento — ver regras finais do prompt).
6. **Executar o "Prompt 2 – Revisão do FSD"** no mesmo chat (revisor técnico independente).
7. **Revisar as sugestões** apresentadas no Relatório de Revisão Técnica antes de aplicá-las.
8. **Aprovar as alterações** e executar o prompt "Aplicando as sugestões" para atualizar o arquivo `FSD.md`.
9. **Verificar a conclusão** ("Como saber se este passo foi concluído?"): ter um arquivo `FSD.md` completo e revisado.
10. **Próximo passo:** continuar com a IA Agêntica e avançar para a etapa de validação do FSD (capítulo extra 2).

### 2.3. Prompts COMPLETOS (transcrição verbatim)

#### Prompt 1 do capítulo — "Prompt para criar o FSD"

Título na metodologia: **"Prompt para criar o FSD"**. Instruções de uso: usar em um novo chat da IA Agêntica, preferencialmente com o modo de raciocínio ativado; não é necessário anexar os documentos manualmente.

Conteúdo integral do bloco "Copiar":

```markdown
# Prompt - Criar o FSD

Atue como Arquiteto de Sistemas, Analista de Sistemas sênior e Especialista em Desenvolvimento Web.

Seu objetivo é criar o Documento de Especificação Funcional do sistema, também chamado de FSD.

FSD significa Functional Specification Document.

O FSD final deverá ser gerado em Markdown e salvo posteriormente no projeto como:

`docs/FSD.md`

## Documentos esperados

Antes de começar, leia **integralmente** os seguintes documentos na pasta desse projeto:

- `PRD.md`;
- `DECISOES_TECNICAS.md`.

Esses dois documentos são obrigatórios.

Se o `PRD.md` não estiver disponível, pare e solicite o arquivo.

Se o `DECISOES_TECNICAS.md` não estiver disponível, pare e solicite o arquivo.

O arquivo `DESIGN.md` também deve ser usado quando tiver sido fornecido.

No projeto final, considere que o documento de design estará localizado em:

`docs/DESIGN.md`

Se o `DESIGN.md` não estiver disponível, continue mesmo assim, mas registre no FSD que o documento de design não foi fornecido.

## Papel de cada documento

Use o `PRD.md` como fonte funcional.

Ele define:

- problema que o sistema resolve;
- objetivo do sistema;
- usuários;
- escopo da primeira versão;
- funcionalidades;
- regras de negócio;
- critérios funcionais;
- pontos fora de escopo.

Use o `DECISOES_TECNICAS.md` como fonte técnica.

Ele define:

- stack;
- ambientes;
- arquitetura;
- autenticação;
- permissões;
- auditoria;
- soft delete;
- logs;
- configurações globais;
- uploads;
- exportações;
- APIs;
- integrações;
- alertas técnicos;
- itens que não devem ser inventados.

Use o `DESIGN.md`, quando existir, como fonte visual.

Ele define:

- aparência da interface;
- componentes;
- padrões visuais;
- layout;
- navegação;
- telas;
- botões;
- formulários;
- tabelas;
- mensagens;
- experiência do usuário.

## Papel do FSD final

O FSD final deve ser completo, consolidado e autossuficiente.

A IA codificadora deverá conseguir criar o sistema usando principalmente:

- `docs/FSD.md`;
- `docs/DESIGN.md`, quando existir;
- boas práticas da stack definida.

O FSD final não deve depender da conversa anterior.

O FSD final não deve depender do `PRD.md` para ser compreendido pela IA codificadora.

O FSD final não deve depender do `DECISOES_TECNICAS.md` para ser compreendido pela IA codificadora.

O conteúdo relevante desses documentos deve estar consolidado diretamente nas seções do FSD.

Não inclua no FSD frases como:

- "segundo o PRD";
- "ver PRD";
- "conforme o PRD";
- "segundo o DECISOES_TECNICAS.md";
- "conforme as decisões técnicas";
- "ver DECISOES_TECNICAS.md";
- "conforme dito na conversa";
- "como combinado no chat";
- "respostas fornecidas anteriormente";
- "consultar conversa anterior".

Quando uma decisão vier do PRD ou das decisões técnicas, escreva a decisão diretamente como parte da especificação.

## Tratamento de conflitos

Antes de gerar o FSD, verifique se existe conflito entre os documentos.

Exemplos de conflito:

- o PRD indica que haverá login, mas as decisões técnicas dizem que não haverá autenticação;
- o PRD cita perfis de usuário, mas as decisões técnicas não definem permissões;
- o PRD inclui upload, mas as decisões técnicas colocam upload como fora de escopo;
- as decisões técnicas incluem APIs, mas o PRD não menciona APIs;
- o DESIGN.md orienta um tipo de interface incompatível com o sistema descrito.

Se encontrar um conflito que impeça a criação segura do FSD, pare e faça apenas uma pergunta objetiva ao usuário.

Se o conflito for pequeno e puder ser resolvido com base nos documentos, registre a decisão adotada de forma direta no FSD.

Quando houver conflito entre uma funcionalidade do PRD e uma decisão técnica, não invente solução. Peça confirmação se a decisão afetar escopo, banco de dados, permissões, fluxos principais ou segurança.

## Conduta antes de gerar o FSD

Leia todos os documentos fornecidos.

Antes de gerar o FSD, verifique se há alguma lacuna crítica.

Considere lacuna crítica qualquer ausência de decisão que impeça:

- criação do banco de dados;
- definição das entidades principais;
- definição das permissões;
- definição dos fluxos principais;
- definição das telas essenciais;
- definição das regras de negócio centrais;
- definição dos relatórios obrigatórios;
- definição das regras de upload, quando houver upload;
- definição das exportações, quando houver exportações;
- definição de autenticação e sessão, quando houver autenticação;
- definição de logs, auditoria e segurança quando forem recursos confirmados.

Se encontrar uma lacuna crítica, pare e faça apenas uma pergunta objetiva ao usuário.

Não gere o FSD enquanto essa lacuna crítica não for resolvida.

Se houver apenas pendências não bloqueantes, registre-as na seção "Pontos Pendentes e Decisões Futuras" do FSD.

Não faça perguntas sobre informações que já estejam claramente definidas nos documentos.

Não reabra decisões já confirmadas, a menos que exista conflito claro, impossibilidade técnica ou risco importante para implementação.

## Restrições importantes

Não crie código.

Não execute implementação.

Não invente funcionalidades.

Não altere decisões já consolidadas sem avisar.

Não mencione skills.

Não mencione subagentes.

Não recomende agentes especializados.

Não trate o PRD como documento necessário para implementação.

Não trate o `DECISOES_TECNICAS.md` como documento necessário para implementação.

Não inclua a conversa como documento necessário para implementação.

O FSD final deverá consolidar tudo dentro do próprio documento.

## Padrão arquitetural obrigatório

O sistema deverá usar o padrão MVC, se essa decisão estiver definida no `DECISOES_TECNICAS.md`.

MVC significa Model-View-Controller.

Esse padrão separa o sistema em três partes principais:

- Model: parte responsável pelos dados, regras ligadas aos dados e comunicação com o banco de dados;
- View: parte responsável pela interface que o usuário vê e utiliza;
- Controller: parte responsável por receber as ações do usuário, acionar as regras necessárias e escolher qual resposta ou tela será exibida.

Explique no FSD como o MVC será aplicado conforme a stack escolhida.

Mesmo que a stack não use um framework MVC pronto, o projeto deve manter uma organização inspirada em MVC.

A IA codificadora deverá manter separação clara entre dados, regras de negócio, controle e interface.

## Regras para estrutura de diretórios do projeto

Ao descrever a arquitetura do sistema, não use como nome principal expressões como:

- `[Diretório Público - public_html / public]`;
- `[Diretório Raiz Privado - Fora do acesso web]`;
- `public_html`;
- `public`;
- `htdocs`;
- `www`.

Esses nomes podem variar conforme o ambiente.

No FSD, use como referência principal:

`[Diretório do Projeto - Repositório]`

Explique que esse diretório representa a pasta do projeto versionada no repositório e que ela poderá ser colocada dentro da pasta pública adequada de cada ambiente.

Exemplos:

- no XAMPP, o projeto normalmente ficará dentro de `htdocs/nome-do-projeto/`;
- na hospedagem (VPS), o projeto normalmente ficará dentro de `www/nome-do-projeto/`;
- em outras hospedagens, poderá ficar dentro de `public_html/nome-do-projeto/` ou pasta equivalente;
- o usuário poderá usar subpastas para manter vários sistemas no mesmo XAMPP ou na mesma hospedagem.

O FSD deve evitar assumir que o projeto ocupará sozinho a pasta pública principal da hospedagem.

Quando sugerir a estrutura de pastas, use uma estrutura baseada no diretório do projeto, por exemplo:

`[Diretório do Projeto - Repositório]`

A estrutura deve considerar que pastas internas como `config`, `app`, `models`, `controllers`, `views`, `database`, `migrations`, `logs` e similares podem existir dentro do projeto, mas não devem ser acessadas diretamente pelo navegador.

O acesso público ao sistema deve ser concentrado pelo arquivo de entrada da aplicação, como `index.php` em projetos PHP, ou equivalente na stack escolhida.

O FSD deve orientar a IA codificadora a proteger pastas internas contra acesso direto por URL, usando a estratégia adequada à stack e ao servidor.

Em projetos PHP com Apache, isso pode incluir regras de `.htaccess`, validações internas e organização de rotas.

Não dependa apenas de `.htaccess` como única proteção. A aplicação também deve evitar expor arquivos internos por links diretos, rotas públicas ou referências indevidas.

## Conteúdo obrigatório do FSD

O FSD deve conter orientações suficientes para implementação de:

- estrutura geral do sistema;
- estrutura de diretórios do projeto;
- arquivo de configuração em código, sem uso de `.env`;
- proteção de arquivos internos contra acesso direto pelo navegador;
- migrations para criação e atualização da estrutura do banco de dados;
- forma segura de execução das migrations;
- banco de dados;
- autenticação;
- controle de acesso;
- cadastros;
- telas;
- formulários;
- listagens;
- validações;
- regras de negócio;
- fluxos principais;
- logs;
- auditoria;
- configurações globais;
- tratamento de erros;
- uploads e anexos, quando existirem;
- relatórios e exportações, quando existirem;
- APIs, quando existirem;
- integrações externas, quando existirem;
- critérios de implementação;
- critérios de validação;
- preparação da entrega.

Inclua somente recursos confirmados no PRD, no `DECISOES_TECNICAS.md`, no `DESIGN.md` ou necessários por coerência funcional.

Não inclua APIs, integrações externas, exportações, uploads ou anexos se eles não estiverem no escopo consolidado.

Respeite a seção de itens que não devem ser inventados do `DECISOES_TECNICAS.md`.

## Regras para banco de dados, migrations e desempenho

O FSD deve propor uma estrutura de banco de dados coerente com a stack definida, as entidades do sistema e as regras consolidadas.

Inclua:

- tabelas;
- campos principais;
- tipos de dados sugeridos;
- chaves primárias;
- chaves estrangeiras;
- índices importantes;
- constraints;
- campos de auditoria;
- campos de soft delete, quando aplicável;
- observações sobre integridade dos dados.

O FSD também deve especificar que o projeto deverá utilizar uma arquitetura de migrations para criação e atualização da estrutura do banco de dados.

Migration é um arquivo ou script versionado que ensina o sistema a criar ou alterar tabelas, campos, índices e constraints do banco de dados de forma controlada.

O objetivo das migrations é evitar que o usuário precise criar tabelas, campos e índices manualmente no phpMyAdmin ou em outro gerenciador de banco.

O FSD deve orientar que as migrations incluam, quando aplicável:

- criação das tabelas;
- criação dos campos;
- definição de chaves primárias;
- definição de chaves estrangeiras;
- criação de índices;
- criação de constraints;
- campos de auditoria;
- campos de soft delete;
- dados iniciais obrigatórios, apenas quando forem realmente necessários.

O FSD deve especificar que as migrations devem ter controle para evitar execução duplicada.

A estratégia pode variar conforme a stack, mas o FSD deve orientar a IA codificadora a prever algum mecanismo de controle, como:

- tabela de controle de migrations executadas;
- scripts versionados;
- comando interno seguro;
- rotina administrativa protegida;
- outro mecanismo adequado à stack definida.

As migrations não devem ficar acessíveis diretamente pelo navegador.

Se as migrations ficarem dentro do `[Diretório do Projeto - Repositório]`, elas devem estar em uma pasta interna, como:

- `database/migrations/`;
- `app/database/migrations/`;
- ou estrutura equivalente conforme a stack.

O FSD deve orientar que essa pasta seja protegida contra acesso direto por URL.

As migrations devem ser executadas apenas por um meio controlado, como:

- script de linha de comando;
- rotina interna protegida;
- painel administrativo restrito a administradores, se essa estratégia for definida;
- comando específico da stack, quando existir.

Não oriente a execução pública de migrations por uma URL aberta no navegador.

Se houver uma tela ou rota para executar migrations, ela deve ser protegida por autenticação, permissão administrativa e bloqueios de segurança adequados. Mesmo assim, prefira execução controlada e não pública.

Inclua índices necessários para evitar lentidão em consultas, relatórios, dashboards, listagens e buscas frequentes.

Não crie SQL final completo, a menos que isso tenha sido solicitado pelo usuário.

O foco deve ser especificar o modelo de dados funcional e técnico em nível suficiente para orientar a IA codificadora, incluindo a necessidade de migrations para materializar essa estrutura no banco de dados.

## Regras para logs e contingência

Se o sistema tiver log de erros, descreva:

- quais erros serão registrados;
- quais informações devem ser gravadas;
- como o usuário verá mensagens seguras;
- quem poderá consultar os logs;
- onde o log será armazenado;
- como os logs serão protegidos.

Quando o log de erros for gravado em banco de dados, especifique também uma estratégia de contingência para registrar erro em arquivo quando:

- o banco de dados estiver indisponível;
- a conexão com o banco falhar;
- o próprio erro impedir o registro normal em banco;
- ocorrer falha crítica antes da inicialização completa do sistema.

O log em arquivo deve ser armazenado fora da pasta pública sempre que possível, com proteção contra acesso direto pela web.

Se o sistema tiver log de segurança, descreva eventos como:

- login inválido;
- acesso negado;
- bloqueio por tentativas;
- ação suspeita;
- alteração de permissões;
- exclusão de registros importantes;
- restauração de registros importantes;
- tentativas de acesso a arquivos protegidos.

## Regras para configuração e credenciais

O FSD deve especificar uma estratégia segura para arquivos de configuração do sistema.

Não use arquivo `.env` para armazenar credenciais neste projeto.

Mesmo que arquivos `.env` possam ser protegidos por configuração do servidor, um erro de configuração pode expor o conteúdo como texto diretamente no navegador.

Para reduzir esse risco no contexto deste treinamento, o FSD deve orientar o uso de um arquivo de configuração em código, com extensão adequada à linguagem de back-end usada.

Em projetos PHP, use preferencialmente um arquivo como:

- `config/config.php`;
- `config/configuracoes.php`.

Para outras linguagens, a extensão deve seguir a linguagem escolhida.

Esse arquivo poderá armazenar, quando aplicável:

- dados de conexão com o banco de dados;
- credenciais de SMTP;
- flags de ativação de logs;
- configurações globais técnicas;
- parâmetros internos da aplicação.

O arquivo de configuração deve ficar dentro do `[Diretório do Projeto - Repositório]`, preferencialmente em uma pasta `config/`.

O FSD deve deixar claro que esse arquivo não pode ser acessado diretamente pelo navegador.

O acesso a esse arquivo deve ocorrer apenas por carregamento interno do código, como `require`, `include`, importação, autoload ou mecanismo equivalente da stack definida.

O FSD também deve orientar que a IA codificadora proteja a pasta `config/` contra acesso direto por URL, usando a estratégia adequada ao servidor e à stack.

Em projetos PHP com Apache, pode ser usada proteção adicional por `.htaccess`, mas a aplicação não deve depender somente disso.

## Regras para uploads, anexos e arquivos

Se houver upload de arquivos, descreva:

- onde os arquivos serão usados;
- tipos permitidos;
- tamanho máximo;
- local lógico de armazenamento;
- permissões;
- validações;
- regras de visualização;
- regras de download;
- regras de exclusão;
- preservação de arquivos quando houver auditoria ou vínculo histórico;
- riscos de segurança;
- proteção contra acesso direto indevido;
- validação de extensão e tipo real do arquivo.

Se não houver upload, declare que o recurso não faz parte da primeira versão.

## Regras para relatórios e exportações

Se houver relatórios, consultas avançadas ou exportações, descreva:

- objetivo;
- filtros;
- quais filtros são obrigatórios;
- quais filtros são opcionais;
- colunas;
- permissões;
- formatos de exportação;
- consistência entre tela e arquivo exportado;
- regras de segurança;
- índices necessários para evitar lentidão.

Se houver exportação CSV, especifique que os dados exportados devem respeitar os mesmos filtros e permissões da tela.

Se não houver exportação, declare que o recurso não faz parte da primeira versão.

## Estrutura obrigatória do FSD

Gere o FSD completo em Markdown usando exatamente a estrutura abaixo.

---

# DOCUMENTO DE ESPECIFICAÇÃO FUNCIONAL (FSD)

## 1. Visão Geral

Explique o sistema que será criado de forma consolidada.

Inclua:

- nome do sistema;
- objetivo principal;
- resumo do funcionamento;
- público usuário;
- contexto de uso;
- observações relevantes para implementação.

## 2. Documentos do Projeto para Implementação

Liste apenas os documentos que a IA codificadora deverá usar para implementar o sistema.

Inclua:

- `docs/FSD.md`;
- `docs/DESIGN.md`, se tiver sido fornecido.

Não inclua `PRD.md` como documento necessário para a IA codificadora.

Não inclua `DECISOES_TECNICAS.md` como documento necessário para a IA codificadora.

Informe que o FSD já consolida as decisões técnicas e funcionais necessárias para implementação.

## 3. Stack Definida

Descreva a stack escolhida.

Inclua:

- linguagem de programação;
- banco de dados;
- tecnologias de interface;
- bibliotecas ou frameworks;
- dependências importantes;
- padrão arquitetural;
- restrições técnicas;
- observações sobre uso local de bibliotecas, quando aplicável.

## 4. Ambientes do Projeto

Descreva os ambientes definidos.

Inclua:

- desenvolvimento local;
- testes ou homologação;
- produção;
- observações sobre deploy.

## 5. Arquitetura do Sistema

Descreva como a arquitetura definida será aplicada no projeto.

Use como referência principal:

`[Diretório do Projeto - Repositório]`

Não use como nome principal da estrutura termos como:

- `[Diretório Público - public_html / public]`;
- `[Diretório Raiz Privado - Fora do acesso web]`;
- `public_html`;
- `public`;
- `htdocs`;
- `www`.

Explique que o `[Diretório do Projeto - Repositório]` poderá estar dentro da pasta pública correspondente ao ambiente usado.

Exemplos:

- no XAMPP, normalmente dentro de `htdocs/nome-do-projeto/`;
- na hospedagem (VPS), normalmente dentro de `www/nome-do-projeto/`;
- em outras hospedagens, dentro da pasta pública equivalente.

Considere que o usuário pode usar subpastas para manter vários sistemas no mesmo XAMPP ou na mesma hospedagem.

Se a arquitetura for MVC, explique:

- onde ficarão os Models;
- onde ficarão os Controllers;
- onde ficarão as Views;
- como as requisições devem fluir pelo sistema;
- como as regras de negócio devem ser organizadas;
- como evitar mistura indevida entre banco de dados, lógica e interface;
- como arquivos auxiliares, configurações e assets devem ser organizados.

Inclua uma sugestão de estrutura de diretórios compatível com o projeto, usando o `[Diretório do Projeto - Repositório]` como raiz.

A estrutura deve prever, quando aplicável:

- arquivo de entrada da aplicação, como `index.php` em projetos PHP;
- pasta de configuração, como `config/`;
- pasta da aplicação, como `app/`;
- pasta de controllers;
- pasta de models;
- pasta de views;
- pasta de assets;
- pasta de banco de dados;
- pasta de migrations;
- pasta de logs, quando houver logs em arquivo.

O FSD deve deixar claro que pastas internas como `config/`, `app/`, `models/`, `controllers/`, `database/`, `migrations/` e `logs/` não devem ser acessadas diretamente pelo navegador.

O FSD deve orientar a IA codificadora a proteger essas pastas conforme a stack e o servidor usados.

Em projetos PHP com Apache, pode ser usada proteção adicional por `.htaccess`, mas a aplicação não deve depender somente disso.

Também explique que arquivos de configuração com credenciais devem usar arquivo de código, como `config/config.php` ou `config/configuracoes.php` em PHP, e não arquivo `.env`.

## 6. Escopo Funcional da Primeira Versão

Liste as funcionalidades que fazem parte da primeira versão.

Agrupe por módulos ou áreas funcionais.

Para cada funcionalidade, descreva:

- objetivo;
- usuários envolvidos;
- ações permitidas;
- resultado esperado;
- dependências com outras funcionalidades;
- regras relacionadas.

## 7. Fora de Escopo

Liste funcionalidades, ideias ou recursos que não fazem parte da primeira versão.

Explique brevemente por que ficaram fora, quando essa informação existir.

## 8. Perfis de Usuário e Permissões

Descreva todos os perfis de usuário.

Para cada perfil, informe:

- descrição;
- permissões;
- restrições;
- áreas acessíveis;
- ações bloqueadas.

Inclua uma matriz de permissões quando fizer sentido.

## 9. Recursos Estruturais do Sistema

Descreva os recursos estruturais definidos para o sistema.

Inclua somente recursos confirmados ou necessários conforme as decisões consolidadas.

Possíveis recursos:

- autenticação;
- RBAC;
- auditoria;
- soft delete;
- log de erros;
- log de segurança;
- configurações globais;
- uploads e anexos;
- exportações;
- APIs;
- integrações externas.

Para cada recurso incluído, explique:

- objetivo;
- onde será aplicado;
- comportamento esperado;
- permissões envolvidas;
- cuidados de segurança;
- critérios de validação.

## 10. Entidades do Sistema

Liste as entidades principais do sistema.

Para cada entidade, descreva:

- nome;
- finalidade;
- principais informações;
- relacionamentos funcionais;
- regras de criação, edição, exclusão e visualização;
- se usa soft delete;
- se usa auditoria;
- permissões de acesso;
- observações.

Não crie entidades desnecessárias.

## 11. Modelo de Dados Proposto

Proponha uma estrutura de banco de dados coerente com a stack definida, as entidades do sistema e as regras consolidadas.

Inclua:

- tabelas;
- campos principais;
- tipos de dados sugeridos;
- chaves primárias;
- chaves estrangeiras;
- índices importantes;
- constraints;
- campos de auditoria;
- campos de soft delete, quando aplicável;
- observações sobre integridade dos dados.

Também descreva a estratégia de migrations do projeto.

Explique que as migrations serão usadas para criar e atualizar a estrutura do banco de dados sem exigir que o usuário crie tabelas e índices manualmente.

Informe que as migrations devem contemplar, quando aplicável:

- criação das tabelas;
- criação dos campos;
- criação de chaves primárias;
- criação de chaves estrangeiras;
- criação de índices;
- criação de constraints;
- criação de campos de auditoria;
- criação de campos de soft delete.

Explique como o projeto deverá evitar a execução duplicada das migrations.

Informe que as migrations devem ficar em uma pasta interna do projeto, como `database/migrations/` ou estrutura equivalente.

Deixe claro que as migrations não devem ser acessíveis diretamente pelo navegador.

Explique que a execução das migrations deve acontecer por meio controlado e seguro, conforme a stack definida.

## 12. Módulos e Telas

Liste os módulos e telas necessários.

Para cada tela ou módulo, descreva:

- objetivo;
- usuários que acessam;
- principais ações;
- principais campos ou informações exibidas;
- filtros e buscas;
- botões e ações;
- mensagens esperadas;
- estados importantes, como vazio, erro, sucesso, carregando ou sem permissão;
- relação com o `docs/DESIGN.md`, quando disponível.

Não defina layout visual detalhado se isso já estiver no `docs/DESIGN.md`.

## 13. Fluxos Funcionais

Descreva os fluxos principais do sistema em passo a passo.

Para cada fluxo, informe:

- perfil que executa;
- pré-condições;
- passo a passo;
- resultado esperado;
- erros possíveis;
- regras de permissão;
- logs ou auditoria gerados, quando aplicável.

## 14. Validações e Regras de Negócio

Liste as validações e regras de negócio por módulo ou entidade.

Inclua:

- campos obrigatórios;
- formatos válidos;
- limites;
- bloqueios;
- permissões;
- regras de status;
- regras de alteração;
- regras de exclusão;
- mensagens de erro esperadas;
- comportamentos em situações especiais.

## 15. Autenticação e Sessão

Se o sistema tiver autenticação, descreva:

- tipo de autenticação;
- fluxo de login;
- fluxo de logout;
- recuperação de acesso, se existir;
- bloqueio por tentativas, se existir;
- tempo de sessão, se definido;
- proteção de rotas;
- comportamento para usuário sem permissão.

Se o sistema não tiver autenticação, justifique com base nas decisões consolidadas.

## 16. Controle de Acesso

Se o sistema tiver perfis, papéis ou permissões, descreva:

- papéis;
- permissões;
- matriz de acesso;
- menus por perfil;
- telas bloqueadas;
- ações protegidas;
- validação no backend;
- mensagens para acesso negado.

## 17. Auditoria e Histórico

Se o sistema tiver auditoria, descreva:

- quais registros serão auditados;
- quais ações serão registradas;
- quais campos mínimos serão usados;
- quem pode visualizar auditoria;
- como a auditoria aparece nos CRUDs;
- regras de retenção, se houver.

## 18. Soft Delete e Exclusões

Se o sistema permitir exclusão de registros, descreva:

- quais entidades usam soft delete;
- quem pode excluir;
- quem pode restaurar;
- quem pode excluir definitivamente, se permitido;
- como registros excluídos aparecem ou deixam de aparecer;
- filtros necessários;
- cuidados contra exclusão indevida.

## 19. Logs

Descreva os logs necessários.

Separe, quando aplicável:

### Log de erros

Explique quais erros serão registrados, quais informações devem ser gravadas, como o usuário verá mensagens seguras e quem poderá consultar os logs.

Quando o log de erros for gravado em banco de dados, especifique uma estratégia de contingência para registrar erro em arquivo quando o banco estiver indisponível ou o erro impedir o registro normal.

O log em arquivo deve ser armazenado fora da pasta pública sempre que possível, com proteção contra acesso direto pela web.

### Log de segurança

Explique quais eventos de segurança serão registrados, como login inválido, acesso negado, bloqueio por tentativas ou ação suspeita.

## 20. Configurações Globais

Se houver configurações globais, descreva:

- quais configurações existirão;
- valores padrão;
- quem pode alterar;
- impacto de cada configuração;
- validações;
- fallback quando uma configuração estiver ausente.

Descreva também a estratégia de configuração técnica do projeto.

O FSD deve deixar claro que credenciais e parâmetros técnicos sensíveis não devem ser armazenados em arquivo `.env`.

Use arquivo de configuração em código, com extensão adequada à linguagem do back-end.

Em projetos PHP, use preferencialmente:

- `config/config.php`;
- `config/configuracoes.php`.

Esse arquivo poderá conter, quando aplicável:

- dados de conexão com o banco de dados;
- credenciais SMTP;
- flags de logs;
- parâmetros técnicos internos;
- configurações globais não editáveis pela interface.

O arquivo de configuração deve ficar dentro do `[Diretório do Projeto - Repositório]`, preferencialmente em uma pasta `config/`.

O FSD deve orientar que esse arquivo não seja acessível diretamente pelo navegador.

A aplicação deve carregar esse arquivo apenas internamente, por `require`, `include`, importação, autoload ou mecanismo equivalente da stack.

Em projetos PHP com Apache, pode ser usada proteção adicional por `.htaccess`, mas a proteção não deve depender exclusivamente disso.

## 21. Uploads, Anexos e Arquivos

Se houver upload de arquivos, descreva:

- onde os arquivos serão usados;
- tipos permitidos;
- tamanho máximo;
- local lógico de armazenamento;
- permissões;
- validações;
- regras de visualização e download;
- exclusão ou preservação;
- riscos de segurança.

Se não houver upload, declare que o recurso não faz parte da primeira versão.

## 22. Relatórios, Consultas e Exportações

Se houver relatórios, consultas avançadas ou exportações, descreva:

- objetivo;
- filtros;
- quais filtros são obrigatórios;
- quais filtros são opcionais;
- colunas;
- permissões;
- formatos de exportação;
- consistência entre tela e arquivo exportado;
- regras de segurança;
- índices necessários para evitar lentidão.

Se não houver exportação, deixe claro.

## 23. APIs e Integrações Externas

Se houver APIs ou integrações, descreva:

- objetivo;
- sistemas envolvidos;
- dados enviados;
- dados recebidos;
- autenticação;
- autorização;
- tratamento de falhas;
- logs;
- retries;
- idempotência, quando aplicável.

Se não houver APIs ou integrações, declare que não fazem parte da primeira versão.

## 24. Segurança Funcional

Descreva cuidados de segurança funcionais.

Inclua, quando aplicável:

- proteção de rotas;
- validação de permissões no backend;
- proteção contra acesso indevido;
- cuidado com dados sensíveis;
- cuidado com mensagens de erro;
- proteção de uploads;
- proteção de exportações;
- registro de eventos sensíveis;
- revisão de segurança recomendada.

## 25. Organização Sugerida da Implementação

Sugira uma divisão de implementação para a IA codificadora.

Divida em etapas pequenas, progressivas e testáveis.

A organização sugerida deve considerar que o projeto será criado inicialmente em ambiente local, normalmente no XAMPP.

Use como referência o `[Diretório do Projeto - Repositório]`, que poderá estar dentro de `htdocs/nome-do-projeto/` no XAMPP ou dentro de `www/nome-do-projeto/` na sua hospedagem.

Exemplo de organização:

1. preparação do `[Diretório do Projeto - Repositório]`;
2. criação da estrutura inicial de pastas;
3. configuração inicial do projeto;
4. criação do arquivo de configuração em código, sem uso de `.env`;
5. proteção de pastas internas contra acesso direto pelo navegador;
6. estrutura arquitetural;
7. banco de dados;
8. criação da estrutura de migrations;
9. criação das migrations de tabelas, campos, índices e constraints;
10. definição do mecanismo de controle de migrations executadas;
11. autenticação;
12. controle de acesso;
13. recursos estruturais;
14. entidades principais;
15. CRUDs;
16. fluxos principais;
17. relatórios e consultas;
18. uploads, se existirem;
19. exportações, se existirem;
20. APIs e integrações, se existirem;
21. logs e contingência;
22. revisão de segurança;
23. revisão de qualidade;
24. preparação da entrega.

Adapte a lista ao sistema especificado no FSD.

## 26. Critérios de Aceitação Técnica e Funcional

Liste critérios para considerar o sistema pronto.

Inclua critérios como:

- funcionalidades principais implementadas;
- arquitetura definida respeitada;
- responsabilidades separadas conforme o padrão escolhido;
- permissões respeitadas;
- validações funcionando;
- banco de dados coerente;
- índices criados para consultas críticas;
- logs funcionando;
- log de contingência em arquivo funcionando, quando aplicável;
- auditoria funcionando, se aplicável;
- soft delete funcionando, se aplicável;
- telas aderentes ao `docs/DESIGN.md`, se disponível;
- erros tratados de forma segura;
- ausência de funcionalidades inventadas fora do FSD;
- revisão de segurança concluída;
- revisão de qualidade concluída;
- estrutura do projeto organizada a partir do `[Diretório do Projeto - Repositório]`;
- ausência de dependência de nomes fixos como `public_html`, `public`, `htdocs` ou `www` dentro da arquitetura do FSD;
- arquivo de configuração em código criado e protegido, sem uso de `.env`;
- credenciais sensíveis não expostas em arquivos acessíveis diretamente pelo navegador;
- pastas internas protegidas contra acesso direto por URL;
- migrations criadas para estrutura do banco de dados;
- migrations contemplando tabelas, campos, índices e constraints necessários;
- mecanismo definido para evitar execução duplicada de migrations;
- migrations não acessíveis diretamente pelo navegador;
- execução de migrations feita por meio controlado e seguro.

## 27. Pontos Pendentes e Decisões Futuras

Liste dúvidas, decisões abertas ou melhorias futuras.

Se não houver pendências, declare explicitamente:

"Não foram identificadas pendências para iniciar a codificação com base neste FSD."

Não use esta seção para jogar decisões essenciais para depois.

Se a decisão for necessária para iniciar a codificação com segurança, pergunte antes de gerar o FSD.

## 28. Conclusão

Finalize explicando se o FSD está pronto para orientar uma IA codificadora.

Declare também quais documentos devem ser entregues para a IA codificadora junto com o FSD:

- `docs/FSD.md`;
- `docs/DESIGN.md`, se disponível.

Não inclua `PRD.md` como documento necessário para a IA codificadora.

Não inclua `DECISOES_TECNICAS.md` como documento necessário para a IA codificadora.

---

## Regras finais

Gere o FSD em Markdown.

Não crie código neste momento.

Não execute a implementação.

Não invente requisitos.

Não altere decisões consolidadas sem avisar.

Não mencione skills ou subagentes.

Quando houver dúvida, registre como ponto pendente apenas se ela não bloquear a codificação. Se bloquear, pergunte antes de gerar o FSD.

O FSD deve orientar a IA codificadora a manter separação clara de responsabilidades conforme a arquitetura definida.

O FSD deve ser detalhado o suficiente para que uma IA codificadora consiga implementar o sistema lendo o próprio FSD e o `docs/DESIGN.md` quando disponível.

O FSD final não deve depender do `PRD.md` para implementação.

O FSD final não deve depender do `DECISOES_TECNICAS.md` para implementação.

O FSD final não deve depender da conversa anterior para implementação.

O conteúdo relevante dos documentos de entrada deve estar consolidado diretamente nas seções do FSD.

O FSD deve evitar estruturas de diretório que dependam de uma única pasta pública fixa, como `public_html`, `public`, `htdocs` ou `www`.

Use sempre `[Diretório do Projeto - Repositório]` como referência principal de raiz do projeto.

O FSD deve considerar que o sistema será criado inicialmente no XAMPP e poderá depois ser publicado em hospedagem com PHP e MySQL, como uma VPS.

O FSD deve considerar que o usuário pode usar subpastas para hospedar vários sistemas no mesmo XAMPP ou na mesma hospedagem.

O FSD não deve recomendar o uso de arquivo `.env` para credenciais neste projeto.

O FSD deve recomendar arquivo de configuração em código, com extensão adequada à linguagem do back-end.

Em projetos PHP, use `config/config.php` ou `config/configuracoes.php`.

O FSD deve exigir migrations para criação e atualização da estrutura do banco de dados.

O FSD deve deixar claro que migrations e arquivos internos não podem ser acessados diretamente pelo navegador.

Esta ainda não é a pasta onde o sistema vai ser criado, então não crie a pasta `docs` e nem mova nenhum arquivo. Crie o `FSD.md` na pasta principal deste projeto.
```

#### Prompt 2 do capítulo — "Revisão do FSD"

Título na metodologia: **"Prompt 2 – Revisão do FSD"**. Instruções de uso: depois que a IA gerar o FSD, usar este prompt **no mesmo chat**.

Conteúdo integral do bloco "Copiar":

```markdown
Agora revise o FSD que você acabou de gerar.

Faça o papel de um revisor técnico independente, como se você não tivesse participado da criação do documento.

Verifique os pontos abaixo.

1. O FSD é autossuficiente? Uma IA codificadora conseguiria implementar o sistema lendo apenas o `docs/FSD.md` e o `docs/DESIGN.md`, sem acesso ao PRD, ao DECISOES_TECNICAS.md ou a esta conversa?

2. Existe alguma referência proibida, como "segundo o PRD", "conforme a conversa", "ver DECISOES_TECNICAS.md" ou semelhantes?

3. Todas as entidades citadas nas telas, fluxos e regras de negócio aparecem no modelo de dados?

4. Todas as permissões citadas nos fluxos e telas aparecem na matriz de permissões?

5. Existe alguma funcionalidade citada em alguma seção que não aparece no escopo funcional da primeira versão?

6. Existe alguma funcionalidade do escopo que não tem tela, fluxo ou regra de negócio correspondente?

7. Os campos de auditoria e de soft delete aparecem nas tabelas das entidades que exigem esses recursos?

8. Os índices propostos cobrem os filtros dos relatórios, dashboards, buscas e listagens descritos?

9. Existe alguma contradição entre seções do documento?

10. Existe alguma decisão essencial faltando que impediria uma IA codificadora de iniciar a implementação com segurança?

11. O documento respeita os itens que não devem ser inventados?

12. O documento respeita o docs/DESIGN.md quando ele foi fornecido?

Para cada problema encontrado, explique:

- qual é o problema;
- em qual seção ele está;
- qual é a correção proposta.

Se não encontrar problemas, declare explicitamente que o FSD passou na revisão e está pronto para a codificação.

Não aplique as correções ainda.

Apresente a lista de problemas e aguarde minha aprovação.

Depois da minha aprovação, aplique as correções aprovadas e gere a versão final do FSD completo.

Esta ainda não é a pasta onde o sistema vai ser criado, então não crie a pasta `docs` e nem mova nenhum arquivo. Altere o `FSD.md` na pasta principal deste projeto.
```

#### Prompt 3 do capítulo — "Aplicando as sugestões"

Título na metodologia: **"Aplicando as sugestões"**. Instruções de uso: se a IA identificar problemas ou recomendar ajustes no Relatório de Revisão Técnica, revise as sugestões apresentadas antes de aplicá-las; depois de aprovar as alterações, usar o prompt abaixo para atualizar o arquivo `FSD.md`.

Conteúdo integral do bloco "Copiar":

```markdown
Aplique no `FSD.md` todas as alterações sugeridas.

Preserve as decisões já aprovadas.

Não adicione novas funcionalidades.

Não remova recursos existentes sem justificativa.

Depois das alterações, salve a versão completa e atualizada no mesmo arquivo: `FSD.md`
```

### 2.4. Modelos / estruturas de documentos citados

| Item | Descrição / local |
|---|---|
| `PRD.md` | Entrada obrigatória; fonte funcional (problema, objetivo, usuários, escopo v1, funcionalidades, regras de negócio, critérios funcionais, pontos fora de escopo). |
| `DECISOES_TECNICAS.md` | Entrada obrigatória; fonte técnica (stack, ambientes, arquitetura, autenticação, permissões, auditoria, soft delete, logs, configurações globais, uploads, exportações, APIs, integrações, alertas técnicos, itens que não devem ser inventados). |
| `DESIGN.md` | Entrada opcional; fonte visual (aparência, componentes, padrões visuais, layout, navegação, telas, botões, formulários, tabelas, mensagens, UX). No projeto final ficará em `docs/DESIGN.md`. |
| `docs/FSD.md` | Saída final do capítulo; documento autossuficiente a ser criado na pasta principal do projeto (a pasta `docs/` NÃO deve ser criada neste capítulo). |
| Estrutura obrigatória do FSD | 28 seções numeradas de 1 a 28 (ver Prompt 1, verbatim acima): 1. Visão Geral; 2. Documentos do Projeto para Implementação; 3. Stack Definida; 4. Ambientes do Projeto; 5. Arquitetura do Sistema; 6. Escopo Funcional da Primeira Versão; 7. Fora de Escopo; 8. Perfis de Usuário e Permissões; 9. Recursos Estruturais do Sistema; 10. Entidades do Sistema; 11. Modelo de Dados Proposto; 12. Módulos e Telas; 13. Fluxos Funcionais; 14. Validações e Regras de Negócio; 15. Autenticação e Sessão; 16. Controle de Acesso; 17. Auditoria e Histórico; 18. Soft Delete e Exclusões; 19. Logs; 20. Configurações Globais; 21. Uploads, Anexos e Arquivos; 22. Relatórios, Consultas e Exportações; 23. APIs e Integrações Externas; 24. Segurança Funcional; 25. Organização Sugerida da Implementação; 26. Critérios de Aceitação Técnica e Funcional; 27. Pontos Pendentes e Decisões Futuras; 28. Conclusão. |
| `config/config.php` ou `config/configuracoes.php` | Arquivo de configuração em código (recomendado em PHP), no lugar de `.env`; deve ficar em pasta `config/` dentro do `[Diretório do Projeto - Repositório]`, protegido de acesso direto pelo navegador. |
| `database/migrations/` ou `app/database/migrations/` | Pasta interna das migrations, protegida contra acesso direto por URL. |
| `[Diretório do Projeto - Repositório]` | Referência principal de raiz do projeto (pasta versionada no repositório). Pode estar dentro de `htdocs/nome-do-projeto/` (XAMPP), `www/nome-do-projeto/` (sua hospedagem) ou pasta pública equivalente. |
| Nomes proibidos como raiz | `public_html`, `public`, `htdocs`, `www`, `[Diretório Público - public_html / public]`, `[Diretório Raiz Privado - Fora do acesso web]`. |
| Relatório de Revisão Técnica | Relatório produzido pelo Prompt 2 (revisão); não há estrutura de seções definida para ele — é a lista de problemas com "qual é o problema / em qual seção / correção proposta". |
| Estrutura de pastas sugerida | `index.php` (entrada), `config/`, `app/`, controllers, models, views, assets, banco de dados, migrations, logs. |
| Organização da implementação | Lista de 24 etapas (exemplo) — ver Prompt 1, seção 25. |

### 2.5. Regras, avisos, boas práticas e armadilhas

**Regras duras (não fazer):**
- Não criar código; não executar implementação; não inventar funcionalidades; não alterar decisões consolidadas sem avisar.
- Não mencionar skills; não mencionar subagentes; não recomendar agentes especializados.
- Não tratar PRD, `DECISOES_TECNICAS.md` nem a conversa como documentos necessários para implementação.
- Não incluir no FSD frases proibidas ("segundo o PRD", "ver PRD", "conforme o PRD", "segundo o DECISOES_TECNICAS.md", "conforme as decisões técnicas", "ver DECISOES_TECNICAS.md", "conforme dito na conversa", "como combinado no chat", "respostas fornecidas anteriormente", "consultar conversa anterior").
- Não usar arquivo `.env` para credenciais; usar arquivo de configuração em código.
- Não depender apenas de `.htaccess` como única proteção.
- Não usar `public_html`, `public`, `htdocs` ou `www` como nome principal da raiz.
- Não orientar execução pública de migrations por URL aberta no navegador.
- Não criar SQL final completo (a menos que o usuário solicite).
- Não incluir APIs, integrações, exportações, uploads ou anexos fora do escopo consolidado.
- Não criar a pasta `docs/` nem mover arquivos neste capítulo (ainda não é a pasta onde o sistema será criado); criar o `FSD.md` na pasta principal do projeto.

**Conduta obrigatória:**
- Ler integralmente os documentos obrigatórios (`PRD.md`, `DECISOES_TECNICAS.md`); parar e solicitar arquivo se algum faltar.
- Verificar conflitos entre documentos antes de gerar o FSD; conflito que impeça criação segura → parar e fazer apenas UMA pergunta objetiva; conflito pequeno resolvível → registrar a decisão adotada diretamente no FSD; conflito entre funcionalidade do PRD e decisão técnica → não inventar solução, pedir confirmação se afetar escopo, banco de dados, permissões, fluxos principais ou segurança.
- Verificar lacunas críticas; se houver → parar, fazer apenas uma pergunta objetiva e não gerar o FSD até resolver. Pendências não bloqueantes → seção "Pontos Pendentes e Decisões Futuras".
- Não fazer perguntas sobre o que já está definido; não reabrir decisões confirmadas (exceto conflito claro, impossibilidade técnica ou risco importante).
- MVC obrigatório se definido nas decisões técnicas; mesmo sem framework MVC pronto, manter organização inspirada em MVC (separação clara entre dados, regras de negócio, controle e interface).

**Boas práticas:**
- Incluir índices para evitar lentidão em consultas, relatórios, dashboards, listagens e buscas frequentes.
- Migrations: prever mecanismo de controle contra execução duplicada (tabela de controle, scripts versionados, comando interno seguro, rotina administrativa protegida ou mecanismo da stack); apenas meios controlados de execução (CLI, rotina interna, painel administrativo restrito, comando da stack).
- Logs: definir quais erros são registrados, informações gravadas, mensagens seguras ao usuário, quem consulta, onde armazenado, como protegido; contingência de log em arquivo quando o banco estiver indisponível; log em arquivo fora da pasta pública.
- Configuração: carregar arquivo de configuração apenas por `require`, `include`, importação, autoload ou equivalente; proteger a pasta `config/`.
- Relatórios/exportações: filtros obrigatórios/opcionais, colunas, permissões, formatos, consistência entre tela e arquivo exportado (CSV deve respeitar os mesmos filtros e permissões da tela), segurança, índices.
- Uploads: tipos permitidos, tamanho máximo, local lógico, permissões, validações, visualização/download/exclusão, preservação quando houver auditoria ou vínculo histórico, riscos de segurança, proteção contra acesso direto indevido, validação de extensão e tipo real do arquivo.
- Sempre que um recurso não existir, declarar explicitamente no FSD que ele não faz parte da primeira versão.

### 2.6. Checklists mencionados

- **Checklist "Como saber se este passo foi concluído?":** "Este passo estará concluído quando você tiver um arquivo FSD.md completo e revisado por você."
- **Checklist de lacunas críticas** (conduta antes de gerar o FSD): ausência de decisão que impeça criação do banco; entidades principais; permissões; fluxos principais; telas essenciais; regras de negócio centrais; relatórios obrigatórios; regras de upload; exportações; autenticação e sessão; logs, auditoria e segurança.
- **Checklist de revisão do Prompt 2:** 12 pontos (autossuficiência; referências proibidas; entidades no modelo de dados; permissões na matriz; funcionalidades fora do escopo; funcionalidades sem tela/fluxo/regra; campos de auditoria/soft delete nas tabelas; índices cobrindo filtros; contradições entre seções; decisão essencial faltando; itens que não devem ser inventados; respeito ao DESIGN.md).

### 2.7. Vocabulário especializado / termos definidos

Não há tabela "Termo/Explicação" formatada neste capítulo; os termos são definidos inline no texto:

| Termo | Definição (da metodologia) |
|---|---|
| FSD | Functional Specification Document — Documento de Especificação Funcional do sistema. |
| IA Agêntica | Ferramenta que consegue trabalhar diretamente com os arquivos do projeto e salvar novos documentos na pasta de trabalho (Codex, Antigravity, Claude Code, Claude Cowork). |
| MVC | Model-View-Controller — padrão que separa o sistema em Model (dados, regras ligadas aos dados, comunicação com banco), View (interface) e Controller (recebe ações do usuário, aciona regras, escolhe resposta/tela). |
| Migration | Arquivo ou script versionado que ensina o sistema a criar ou alterar tabelas, campos, índices e constraints do banco de dados de forma controlada; evita criar estruturas manualmente no phpMyAdmin ou outro gerenciador. |
| Lacuna crítica | Ausência de decisão que impeça banco de dados, entidades, permissões, fluxos, telas, regras de negócio, relatórios, upload/exportação, autenticação/sessão, logs/auditoria/segurança. |
| `[Diretório do Projeto - Repositório]` | Referência principal de raiz do projeto — pasta versionada no repositório, que pode estar dentro da pasta pública adequada de cada ambiente. |
| Soft delete | Recurso estrutural citado (exclusão lógica), a ser descrito no FSD quando definido. |
| RBAC | Recurso estrutural citado (controle de acesso baseado em papéis). |
| Auditoria, log de erros, log de segurança, configurações globais, uploads, exportações, APIs, integrações externas | Recursos estruturais possíveis a serem incluídos no FSD somente se confirmados. |

### 2.8. Erros comuns e como resolver

Não há uma seção explícita "Erros comuns e como resolver" neste capítulo. Os comportamentos que funcionam como armadilhas/erros a evitar estão nas regras (2.5). Destaques:

- **Documentos obrigatórios ausentes** (`PRD.md` / `DECISOES_TECNICAS.md`): a IA deve parar e solicitar o arquivo (não prosseguir).
- **Fraseamento proibido no FSD** (ex.: "segundo o PRD", "conforme a conversa"): deve ser eliminado; decisões devem ser escritas diretamente como parte da especificação.
- **Falta de autossuficiência** do FSD (depender de conversa/PRD/decisões técnicas): o Prompt 2 de revisão detecta e corrige.
- **`.env` para credenciais / proteção apenas via `.htaccess` / nomes de raiz fixos** (`public_html`, `htdocs`, etc.): vetados; usar arquivo de configuração em código e `[Diretório do Projeto - Repositório]`.
- **Migrations acessíveis ou executadas publicamente**: devem ficar em pasta interna e ser executadas por meio controlado.
- **Usar a seção de pendências para adiar decisões essenciais**: proibido; decisões essenciais devem ser perguntadas antes de gerar o FSD.
- **Criar a pasta `docs/` ou mover arquivos neste capítulo**: proibido — criar o `FSD.md` na pasta principal do projeto.
- **Inventar funcionalidades/requisitos ou reabrir decisões confirmadas**: proibido.

---

## 3. Capítulo: extras-2.txt — "Passo 6: Validação do FSD"

### 3.1. Objetivo do capítulo

Validar o documento `FSD.md` antes de avançar para a codificação. **Validar significa verificar se o documento está correto, completo e coerente antes de avançar para a codificação.** A IA atua como revisora técnica independente, comparando o FSD com os arquivos anteriores do projeto (`PRD.md`, `DECISOES_TECNICAS.md`, `DESIGN.md` quando fornecido) e verificando se ele está completo, coerente e pronto para orientar a codificação.

### 3.2. Passos EXATOS na ordem

1. **Reconhecer o cenário:** mesmo motivo do capítulo anterior — sistemas maiores geram FSD extenso que chatbots de chat único não conseguem processar/entregar.
2. **Escolher uma IA Agêntica:** Codex, Antigravity, Claude Code ou Claude Cowork.
3. **Criar um projeto** na IA Agêntica apontando para a pasta onde já foram salvos:
   - `FSD.md`
   - `PRD.md`
   - `DECISOES_TECNICAS.md`
   - `DESIGN.md`
4. **Executar o "Prompt 1 – Validar o FSD"** em um novo chat da IA Agêntica, preferencialmente com o modo de raciocínio ativado. Não anexar os documentos manualmente.
5. **Ler o relatório gerado** (Relatório de Validação do FSD) e **interpretar o resultado geral** segundo as três opções:
   - "Aprovado para codificação" → o FSD está pronto para seguir.
   - "Aprovado com ajustes recomendados" → pode corrigir os pontos antes de avançar; normalmente vale a pena corrigir.
   - "Reprovado temporariamente até correções críticas" → **não avance para a codificação**; corrija o FSD primeiro.
6. **Escolher quais correções aplicar** (todas ou apenas algumas).
7. **Executar o "Prompt 2 – Aplicar correções aprovadas"** (uma das duas variantes: todas as correções, ou apenas IDs específicos).
8. **Executar o "Prompt 3 – Nova validação após correções"** no mesmo chat, para verificar se as correções foram aplicadas corretamente e não criaram novas inconsistências.
9. **Se a IA identificar problemas/recomendar ajustes:** revisar as sugestões do Relatório de Validação antes de aplicá-las e, após aprovar, executar o prompt "Aplicando as sugestões" para atualizar o arquivo `FSD.md`.
10. **Resultado esperado:** arquivo `docs/FSD.md` revisado, corrigido e validado — o documento principal para iniciar a fase de codificação com IA. A IA codificadora usará principalmente `docs/FSD.md` e `docs/DESIGN.md`. O PRD e o documento de decisões técnicas continuam importantes como histórico da análise, mas o FSD validado consolida as informações necessárias para orientar a implementação.

### 3.3. Prompts COMPLETOS (transcrição verbatim)

#### Prompt 1 do capítulo — "Prompt 1 – Validar o FSD"

Título na metodologia: **"Prompt 1 – Validar o FSD"**. Instruções de uso: usar em um novo chat da IA Agêntica, preferencialmente com o modo de raciocínio ativado; não é necessário anexar os documentos manualmente.

Conteúdo integral do bloco "Copiar":

```markdown
# Prompt - Validar o FSD

Atue como Revisor Técnico Independente, Arquiteto de Sistemas e Analista de Qualidade de Especificação.

Seu objetivo é validar o Documento de Especificação Funcional, também chamado de FSD.

FSD significa Functional Specification Document.

Você deve analisar os documentos fornecidos e verificar se o FSD está correto, completo, coerente e pronto para orientar uma IA codificadora.

## Documentos esperados

Antes de começar, leia **integralmente** os seguintes documentos na pasta desse projeto:

- `PRD.md`;
- `DECISOES_TECNICAS.md`;
- `FSD.md`.

Esses três documentos são obrigatórios.

Se algum deles não estiver disponível, pare e solicite o arquivo ausente.

O arquivo `DESIGN.md` também deve ser usado quando tiver sido fornecido.

No projeto final, considere que:

- o documento de design estará localizado em `docs/DESIGN.md`;
- o FSD estará localizado em `docs/FSD.md`.

Se o `DESIGN.md` não estiver disponível, continue mesmo assim, mas registre no relatório de validação que o documento de design não foi fornecido.

## Papel de cada documento

Use o `PRD.md` como fonte funcional.

Ele define:

- problema que o sistema resolve;
- objetivo do sistema;
- usuários;
- escopo da primeira versão;
- funcionalidades;
- regras de negócio;
- critérios funcionais;
- pontos fora de escopo.

Use o `DECISOES_TECNICAS.md` como fonte técnica.

Ele define:

- stack;
- ambientes;
- arquitetura;
- autenticação;
- permissões;
- auditoria;
- soft delete;
- logs;
- configurações globais;
- uploads;
- exportações;
- APIs;
- integrações;
- alertas técnicos;
- itens que não devem ser inventados.

Use o `DESIGN.md`, quando existir, como fonte visual.

Ele define:

- aparência da interface;
- componentes;
- padrões visuais;
- layout;
- navegação;
- telas;
- botões;
- formulários;
- tabelas;
- mensagens;
- experiência do usuário.

Use o `FSD.md` como documento a ser validado.

## O que você deve verificar

Verifique se o FSD:

1. cobre todas as funcionalidades da primeira versão descritas no PRD;
2. respeita as funcionalidades fora de escopo;
3. respeita as decisões técnicas definidas em `DECISOES_TECNICAS.md`;
4. respeita o `DESIGN.md`, quando fornecido;
5. não inventa funcionalidades não aprovadas;
6. não adiciona APIs, integrações, uploads, exportações ou dashboards sem confirmação;
7. não contradiz o PRD;
8. não contradiz as decisões técnicas;
9. não contradiz o design;
10. define corretamente a stack;
11. define corretamente os ambientes;
12. aplica corretamente a arquitetura definida;
13. descreve todos os perfis de usuário;
14. descreve permissões e restrições;
15. inclui matriz de permissões quando fizer sentido;
16. descreve as entidades principais;
17. propõe modelo de dados coerente;
18. inclui campos de auditoria quando a auditoria for definida;
19. inclui soft delete quando esse recurso for definido;
20. descreve telas e módulos suficientes;
21. descreve fluxos funcionais suficientes;
22. descreve validações e regras de negócio;
23. trata autenticação e sessão quando houver autenticação;
24. trata controle de acesso quando houver perfis ou permissões;
25. trata logs de erro e segurança quando definidos;
26. trata contingência de log em arquivo quando definida;
27. trata configurações globais quando definidas;
28. trata uploads e anexos quando definidos;
29. trata relatórios e exportações quando definidos;
30. trata APIs e integrações quando definidas;
31. inclui cuidados de segurança funcional;
32. inclui critérios de aceitação técnica e funcional;
33. registra pendências não bloqueantes;
34. não registra como pendência algo que deveria ser decisão essencial antes da codificação;
35. não depende da conversa anterior para ser compreendido;
36. não exige que a IA codificadora consulte o PRD ou o DECISOES_TECNICAS.md para entender o funcionamento principal do sistema;
37. consolida no próprio FSD as informações necessárias para implementação;

## Como classificar problemas

Classifique cada problema encontrado em um dos níveis abaixo.

### Crítico

Use quando o problema impede iniciar a codificação com segurança.

Exemplos:

- funcionalidade central ausente;
- conflito entre PRD e FSD;
- ausência de permissões em sistema com perfis;
- modelo de dados sem entidade essencial;
- decisão técnica obrigatória ignorada;
- item fora de escopo incluído como funcionalidade da primeira versão.

### Importante

Use quando o problema não impede totalmente a codificação, mas pode gerar retrabalho, erro ou confusão.

Exemplos:

- fluxo pouco detalhado;
- regra de negócio incompleta;
- tela sem estados importantes;
- relatório sem filtros definidos;
- log descrito de forma vaga;
- exportação sem regras de permissão.

### Melhoria

Use quando o problema é principalmente de clareza, organização ou detalhamento.

Exemplos:

- texto confuso;
- seção repetitiva;
- critérios de aceitação poderiam ser mais objetivos;
- nomenclatura poderia ser padronizada.

## Formato do relatório de validação

Não reescreva o FSD ainda.

Primeiro, gere apenas um relatório de validação.

Use a estrutura abaixo:

# RELATÓRIO DE VALIDAÇÃO DO FSD

## 1. Resultado geral

Informe uma das opções:

- Aprovado para codificação;
- Aprovado com ajustes recomendados;
- Reprovado temporariamente até correções críticas.

Explique brevemente o motivo.

## 2. Documentos analisados

Liste os documentos recebidos:

- `PRD.md`;
- `DECISOES_TECNICAS.md`;
- `DESIGN.md`, se fornecido;
- `FSD.md`.

Informe se algum documento esperado não foi fornecido.

## 3. Resumo dos problemas encontrados

Apresente uma tabela com:

| ID | Gravidade | Seção do FSD | Problema | Correção sugerida |
| -- | --------- | ------------ | -------- | ----------------- |

Use IDs como:

- C1, C2, C3 para problemas críticos;
- I1, I2, I3 para problemas importantes;
- M1, M2, M3 para melhorias.

## 4. Problemas críticos

Liste os problemas críticos, se existirem.

Para cada problema, informe:

- ID;
- seção do FSD;
- descrição do problema;
- documento de origem afetado;
- por que isso bloqueia a codificação;
- correção sugerida.

Se não houver problemas críticos, escreva:

"Não foram encontrados problemas críticos."

## 5. Problemas importantes

Liste os problemas importantes, se existirem.

Para cada problema, informe:

- ID;
- seção do FSD;
- descrição do problema;
- documento de origem afetado;
- impacto provável;
- correção sugerida.

Se não houver problemas importantes, escreva:

"Não foram encontrados problemas importantes."

## 6. Melhorias recomendadas

Liste melhorias de clareza, organização ou detalhamento.

Se não houver melhorias, escreva:

"Não foram identificadas melhorias recomendadas."

## 7. Verificação de cobertura do PRD

Informe se todas as funcionalidades da primeira versão descritas no PRD aparecem no FSD.

Liste:

- funcionalidades cobertas;
- funcionalidades ausentes;
- funcionalidades parcialmente cobertas.

## 8. Verificação das decisões técnicas

Informe se as decisões do `DECISOES_TECNICAS.md` foram respeitadas.

Verifique especialmente:

- stack;
- ambientes;
- arquitetura;
- autenticação;
- RBAC;
- auditoria;
- soft delete;
- logs;
- configurações;
- uploads;
- exportações;
- APIs;
- integrações;
- itens que não devem ser inventados.

## 9. Verificação do design

Se o `DESIGN.md` foi fornecido, informe se o FSD respeita o design.

Verifique especialmente:

- telas;
- componentes;
- formulários;
- tabelas;
- botões;
- mensagens;
- estados visuais;
- navegação;
- experiência do usuário.

Se o `DESIGN.md` não foi fornecido, registre essa ausência.

## 10. Verificação de autossuficiência

Informe se o FSD pode ser entendido por uma IA codificadora sem depender da conversa anterior.

Verifique se o FSD evita referências como:

- "segundo o PRD";
- "conforme o documento de decisões técnicas";
- "como dito anteriormente";
- "ver conversa";
- "consultar mensagens anteriores".

## 11. Recomendação final

Informe claramente uma das opções:

- Pode seguir para codificação;
- Corrigir pontos importantes antes da codificação;
- Corrigir problemas críticos antes da codificação.

Não aplique as correções ainda.

Aguarde minha aprovação antes de reescrever o FSD.
```

#### Blocos de interpretação — "Como interpretar o relatório"

Título na metodologia: **"Como interpretar o relatório"**. Depois que a IA gerar o relatório de validação, leia o resultado geral. Três blocos "Copiar" (um por resultado):

1. Bloco "Copiar" (resultado "Aprovado para codificação"):
```markdown
Aprovado para codificação
```
> Interpretação: o FSD está pronto para seguir.

2. Bloco "Copiar" (resultado "Aprovado com ajustes recomendados"):
```markdown
Aprovado com ajustes recomendados
```
> Interpretação: você pode corrigir os pontos indicados antes de avançar. Normalmente vale a pena corrigir.

3. Bloco "Copiar" (resultado "Reprovado temporariamente até correções críticas"):
```markdown
Reprovado temporariamente até correções críticas
```
> Interpretação: não avance para a codificação. Corrija o FSD primeiro.

#### Prompt 2 do capítulo — "Prompt 2 – Aplicar correções aprovadas"

Título na metodologia: **"Prompt 2 – Aplicar correções aprovadas"**. Instruções de uso: depois de ler o relatório, escolher quais correções serão aplicadas; pode aprovar todas ou apenas algumas. Contém DOIS blocos "Copiar" (duas variantes):

**Variante A — aplicar TODAS as correções sugeridas:**

```markdown
Aplique todas as correções sugeridas no relatório de validação.

Gere uma nova versão completa do FSD em Markdown.

Mantenha o FSD autossuficiente.

Não adicione funcionalidades novas.

Não altere decisões aprovadas.

Não inclua referências à conversa anterior.

O arquivo final deverá ser salvo posteriormente como: FSD.md
```

**Variante B — aplicar APENAS algumas correções (por IDs):**

```markdown
Aplique apenas as correções abaixo:

- [Liste aqui os IDs das correções. Exemplo: C1, I2, M3.]

Não aplique as demais correções.

Gere uma nova versão completa do FSD em Markdown.

Mantenha o FSD autossuficiente.

Não adicione funcionalidades novas.

Não altere decisões aprovadas.

Não inclua referências à conversa anterior.

O arquivo final deverá ser salvo posteriormente como: FSD.md
```

#### Prompt 3 do capítulo — "Prompt 3 – Nova validação após correções"

Título na metodologia: **"Prompt 3 – Nova validação após correções"**. Instruções de uso: depois que a IA gerar a nova versão do FSD, fazer uma última verificação; usar este prompt no mesmo chat.

Conteúdo integral do bloco "Copiar":

```markdown
Valide novamente o FSD revisado.

Verifique se as correções aprovadas foram aplicadas corretamente.

Verifique também se as correções não criaram novas inconsistências.

Analise especialmente:

- cobertura do PRD;
- respeito ao DECISOES_TECNICAS.md;
- respeito ao DESIGN.md, quando fornecido;
- entidades;
- modelo de dados;
- telas;
- fluxos;
- permissões;
- auditoria;
- soft delete;
- logs;
- uploads;
- exportações;
- APIs;
- segurança funcional;
- critérios de aceitação;
- ausência de funcionalidades inventadas;
- ausência de referências à conversa anterior;
- ausência de skills e subagentes.

Se o FSD estiver pronto, declare:

"O FSD revisado está validado e pronto para a codificação."

Se ainda houver problemas, liste apenas os problemas restantes, com gravidade e correção sugerida.
```

#### Prompt 4 do capítulo — "Aplicando as sugestões"

Título na metodologia: **"Aplicando as sugestões"**. Instruções de uso: se a IA identificar problemas ou recomendar ajustes no Relatório de Validação do FSD, revise as sugestões apresentadas antes de aplicá-las; depois de aprovar as alterações, usar o prompt abaixo para atualizar o arquivo `FSD.md`.

Conteúdo integral do bloco "Copiar":

```markdown
Aplique no `FSD.md` todas as alterações sugeridas.

Preserve as decisões já aprovadas.

Não adicione novas funcionalidades.

Não remova recursos existentes sem justificativa.

Depois das alterações, salve a versão completa e atualizada no mesmo arquivo: `FSD.md`
```

#### Bloco final — "Resultado esperado deste passo"

Título na metodologia: **"Resultado esperado deste passo"**. Bloco "Copiar" com os documentos que a IA codificadora deverá usar na próxima fase:

```markdown
docs/FSD.md
docs/DESIGN.md
```

> Contexto: ao final do capítulo, o arquivo `docs/FSD.md` estará revisado, corrigido e validado. O PRD e o documento de decisões técnicas continuam importantes como histórico da análise, mas o FSD validado deve consolidar as informações necessárias para orientar a implementação.

### 3.4. Modelos / estruturas de documentos citados

| Item | Descrição / local |
|---|---|
| `PRD.md`, `DECISOES_TECNICAS.md`, `FSD.md` | Três documentos obrigatórios de entrada para a validação. Se algum faltar, a IA deve parar e solicitar o arquivo ausente. |
| `DESIGN.md` | Documento opcional; se não fornecido, continuar e registrar no relatório de validação que não foi fornecido. |
| `docs/FSD.md` e `docs/DESIGN.md` | Localizações finais consideradas no projeto. |
| **Relatório de Validação do FSD** | Relatório de saída com estrutura obrigatória de 11 seções: 1. Resultado geral; 2. Documentos analisados; 3. Resumo dos problemas encontrados (tabela ID/Gravidade/Seção/Problema/Correção); 4. Problemas críticos; 5. Problemas importantes; 6. Melhorias recomendadas; 7. Verificação de cobertura do PRD; 8. Verificação das decisões técnicas; 9. Verificação do design; 10. Verificação de autossuficiência; 11. Recomendação final. |
| Sistema de IDs de problemas | `C1, C2, C3` (críticos), `I1, I2, I3` (importantes), `M1, M2, M3` (melhorias). |
| Classificação de gravidade | Crítico / Importante / Melhoria (com exemplos, ver Prompt 1 verbatim). |
| Resultado geral / Recomendação final | Três opções (Aprovado para codificação; Aprovado com ajustes recomendados; Reprovado temporariamente até correções críticas) e três opções de recomendação final (Pode seguir para codificação; Corrigir pontos importantes antes da codificação; Corrigir problemas críticos antes da codificação). |

### 3.5. Regras, avisos, boas práticas e armadilhas

- **Não reescrever o FSD ainda:** primeiro gerar apenas o relatório de validação; não aplicar as correções até a aprovação do usuário.
- **Aguardar aprovação antes de reescrever o FSD** ("Aguarde minha aprovação antes de reescrever o FSD").
- **Não avançar para codificação** quando o resultado for "Reprovado temporariamente até correções críticas"; corrigir o FSD primeiro.
- Ao aplicar correções: manter o FSD autossuficiente; não adicionar funcionalidades novas; não alterar decisões aprovadas; não incluir referências à conversa anterior.
- Ao aplicar correções no arquivo: preservar decisões já aprovadas; não adicionar novas funcionalidades; não remover recursos existentes sem justificativa; salvar versão completa no mesmo arquivo `FSD.md`.
- Na nova validação (Prompt 3): verificar se as correções foram aplicadas corretamente e se não criaram novas inconsistências; verificar ausência de funcionalidades inventadas, de referências à conversa anterior e de skills/subagentes.
- O `PRD.md` e `DECISOES_TECNICAS.md` continuam importantes apenas como histórico; o FSD validado consolida as informações de implementação.

### 3.6. Checklists mencionados

- **Checklist de verificação do FSD (37 itens)** — dentro do Prompt 1 (seção "O que você deve verificar"), cobrindo cobertura do PRD, respeito a fora de escopo/decisões técnicas/design, ausência de invenções, stack, ambientes, arquitetura, perfis, permissões/matriz, entidades, modelo de dados, auditoria, soft delete, telas/módulos, fluxos, validações/regras, autenticação/sessão, controle de acesso, logs, contingência de log, configurações globais, uploads, relatórios/exportações, APIs/integrações, segurança funcional, critérios de aceitação, pendências não bloqueantes, autossuficiência, consolidação das informações.
- **Lista de verificação especial da seção 8** (decisões técnicas respeitadas): stack; ambientes; arquitetura; autenticação; RBAC; auditoria; soft delete; logs; configurações; uploads; exportações; APIs; integrações; itens que não devem ser inventados.
- **Lista de verificação da seção 9** (design respeitado): telas; componentes; formulários; tabelas; botões; mensagens; estados visuais; navegação; experiência do usuário.
- **Lista de verificação de autossuficiência** (seção 10): verificar ausência de "segundo o PRD"; "conforme o documento de decisões técnicas"; "como dito anteriormente"; "ver conversa"; "consultar mensagens anteriores".
- **Checklist do Prompt 3** (nova validação): 18 itens (listados no prompt, verbatim acima).
- **Resultado esperado do passo:** arquivo `docs/FSD.md` revisado, corrigido e validado.

### 3.7. Vocabulário especializado / termos definidos

Não há tabela "Termo/Explicação" formatada neste capítulo; os termos são definidos inline no texto:

| Termo | Definição (da metodologia) |
|---|---|
| FSD | Functional Specification Document — Documento de Especificação Funcional do sistema. |
| Validar | Verificar se o documento está correto, completo e coerente antes de avançar para a codificação. |
| IA Agêntica | Ferramenta que consegue trabalhar diretamente com os arquivos do projeto e salvar novos documentos na pasta de trabalho (Codex, Antigravity, Claude Code, Claude Cowork). |
| Revisor Técnico Independente / Arquiteto de Sistemas / Analista de Qualidade de Especificação | Papéis que a IA deve assumir no Prompt de validação. |
| Problemas Crítico / Importante / Melhoria | Níveis de classificação de problemas no relatório de validação (definidos com exemplos no Prompt 1). |
| RBAC, soft delete, auditoria, logs, uploads, exportações, APIs, integrações | Recursos cujo respeito/cobertura é verificado na validação. |
| Autossuficiência do FSD | Capacidade do FSD de ser entendido por uma IA codificadora sem depender da conversa anterior, do PRD ou do DECISOES_TECNICAS.md. |

### 3.8. Erros comuns e como resolver

Não há uma seção explícita "Erros comuns e como resolver" neste capítulo; a resolução de problemas é conduzida pelo próprio fluxo de validação:

- **Documentos obrigatórios ausentes** (`PRD.md` / `DECISOES_TECNICAS.md` / `FSD.md`): a IA deve parar e solicitar o arquivo ausente.
- **`DESIGN.md` ausente:** continuar mesmo assim e registrar no relatório de validação que o documento de design não foi fornecido.
- **Problemas críticos:** resultam em "Reprovado temporariamente até correções críticas" → não avançar para codificação; corrigir o FSD primeiro.
- **Problemas importantes:** corrigir antes da codificação (retrabalho/erro/confusão).
- **Correções que criam novas inconsistências:** detectadas pela nova validação (Prompt 3).
- **Funcionalidades inventadas / referências à conversa / skills / subagentes:** vetados e verificados na validação.

---

## 4. Itens acionáveis — o que o desenvolvedor precisa executar

### 4.1. Documentos de entrada exigidos (salvos na pasta do projeto)

| Fase | Documentos |
|---|---|
| Criar FSD (extra 1) | `PRD.md`, `DECISOES_TECNICAS.md` (obrigatórios) e `DESIGN.md` (opcional) |
| Validar FSD (extra 2) | `FSD.md`, `PRD.md`, `DECISOES_TECNICAS.md` (obrigatórios) e `DESIGN.md` (opcional) |

### 4.2. Documentos de saída

| Saída | Local | Observações |
|---|---|---|
| `FSD.md` | Pasta principal do projeto (não criar a pasta `docs/` nesta fase) | Gerado na fase de criação; revisado e atualizado após aprovação |
| Relatório de Revisão Técnica | Entregue pela IA no chat | Produzido pelo "Prompt 2 – Revisão do FSD" |
| Relatório de Validação do FSD | Entregue pela IA no chat | Estrutura de 11 seções, IDs C/I/M |
| `docs/FSD.md` (revisado, corrigido e validado) | Projeto final | Documento principal para a fase de codificação; junto com `docs/DESIGN.md` |

### 4.3. Comandos / configuração de ambiente

- Criar um **projeto na IA Agêntica** (Codex, Antigravity, Claude Code ou Claude Cowork) apontando para a pasta onde os documentos estão salvos. Não há comandos de terminal citados nos capítulos.
- Ativar **preferencialmente o modo de raciocínio** da IA Agêntica nos prompts.
- **Não anexar documentos manualmente** — a ferramenta localiza os arquivos no próprio diretório.
- Contexto de ambiente assumido pelo método: sistema criado inicialmente no **XAMPP** (em `htdocs/nome-do-projeto/`) e posteriormente publicado em hospedagem com **PHP e MySQL, como uma VPS** (em `www/nome-do-projeto/`).

### 4.4. Sequência completa de prompts a executar (na ordem)

**Fase Criar FSD (extra 1):**
1. **Prompt 1 — Criar o FSD** ("# Prompt - Criar o FSD") → em um **novo chat**.
2. **Prompt 2 — Revisão do FSD** → no **mesmo chat**.
3. **Prompt 3 — Aplicando as sugestões** ("Aplique no `FSD.md` todas as alterações sugeridas...") → após aprovar as sugestões do relatório de revisão.

**Fase Validar FSD (extra 2):**
4. **Prompt 1 — Validar o FSD** ("# Prompt - Validar o FSD") → em um **novo chat**.
5. Interpretar o resultado geral do relatório (Aprovado / Aprovado com ajustes / Reprovado temporariamente).
6. **Prompt 2 — Aplicar correções aprovadas** (variante A: "Aplique todas as correções sugeridas..." ou variante B: "Aplique apenas as correções abaixo: - [IDs]").
7. **Prompt 3 — Nova validação após correções** ("Valide novamente o FSD revisado...") → no **mesmo chat**.
8. **Prompt 4 — Aplicando as sugestões** ("Aplique no `FSD.md` todas as alterações sugeridas...") → se a IA identificar problemas/recomendar ajustes, após aprovação.

### 4.5. Conteúdo ausente (não presente nestes capítulos)

- Não há tabela formatada "Termo/Explicação" nos arquivos; os termos são definidos inline (ver seções 2.7 e 3.7).
- Não há seção explícita "Erros comuns e como resolver"; erros/armadilhas estão embutidos nas regras e no fluxo de revisão/validação (ver seções 2.8 e 3.8).
- Não há comandos de terminal, instalações, nem links de download nos capítulos.
- Não há checklist de conclusão estruturado no capítulo 2 além do "Resultado esperado deste passo" (arquivo `docs/FSD.md` revisado, corrigido e validado); no capítulo 1, o checklist é "Este passo estará concluído quando você tiver um arquivo FSD.md completo e revisado por você."
- Não há diagramas, figuras ou tabelas de exemplos preenchidas; as únicas tabelas citadas são as de estrutura do relatório de validação (modelo de tabela com colunas ID/Gravidade/Seção/Problema/Correção).

