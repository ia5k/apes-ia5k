# Referência APES IA5K — Codificação em etapas: Git, construção por fases e testes

# APES IA5K — Passo 4: Codificando em etapas + Testando as etapas

> **Nota sobre escopo dos arquivos analisados:** A tarefa pediu dois capítulos cobrindo "Passo 4 - Codificando em etapas, Testando as etapas". Na prática:
> - `codificacao-7.txt` contém o **Passo 3 — Git e GitHub** (proteção do projeto antes da construção; inclui o tutorial SSH manual e o prompt de apoio). Não é o Passo 4.
> - `codificacao-8.txt` contém o **Passo 4 — Codificando em etapas** (construção incremental, inclui o fluxo de teste de fase e o que fazer quando algo falhar).
> Ambos foram analisados integralmente. Não há neste grupo um capítulo dedicado exclusivamente a "testes"; o conteúdo de testes está embutido no capítulo do Passo 4 (seção "Testar a fase" do prompt e seção "O que fazer quando algo falhar").

---

## 1. Visão geral do grupo

Estes dois capítulos formam a **transição da preparação para a construção do sistema**:

1. **Passo 3 (codificacao-7.txt)** — Antes de a IA começar a codificar em fases, o projeto precisa ser protegido com **Git** (histórico de mudanças) e **GitHub** (cópia segura na nuvem). A IA executa o "Prompt do passo 3", que cria/revisa `.gitignore` e `.gitattributes`, verifica que nenhum segredo será versionado, inicializa o Git, faz o primeiro commit, conecta o repositório remoto no GitHub e atualiza os "arquivos vivos" (`docs/STATUS.md`, `docs/ERROS.md`). O capítulo inclui ainda um **tutorial manual de SSH** para conectar o projeto local ao GitHub (caso o prompt não consiga) e um **prompt de apoio** para problemas com SSH.

2. **Passo 4 (codificacao-8.txt)** — A construção propriamente dita, feita por **construção incremental / em fases**. O "Prompt do passo 4" é executado repetidamente: **um chat novo por fase**. A cada execução a IA lê o contexto (arquivos vivos), identifica a próxima fase pendente, constrói apenas essa fase, testa, registra erros/progresso, faz commit e para. Depois o usuário abre outro chat e repete o prompt para a fase seguinte. O capítulo define "critérios de pronto", o papel de `PLANO.md`, `STATUS.md` e `ERROS.md`, e ensina como testar uma fase e como reportar falhas.

Posição no fluxo da metodologia (contexto da própria metodologia):
- Antes: validação de insumos → preparação do projeto → criação dos arquivos vivos → arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`).
- Aqui: Git+GitHub (Passo 3) → construção incremental fase a fase (Passo 4, repetido).
- Depois: **passo 5 = validação de segurança** (citado como próximo passo quando todas as fases terminam), documentação final (Passo 6), último passo da metodologia; depois disso o usuário publica na hospedagem que escolher.

---

## 2. Capítulo: Passo 3 — Git e GitHub

### 2.1. Objetivo do capítulo

Proteger o projeto com controle de versão antes de começar a construir funcionalidades. O objetivo declarado da etapa é: **Projeto local → Git → GitHub**. Dois riscos são reduzidos: perder o controle das mudanças e perder os arquivos do projeto. O GitHub nesta fase serve para: guardar backup, acompanhar histórico, servir de base para o deploy futuro e proteger o trabalho feito pela IA. **Não construir funcionalidades nesta etapa.**

Conceitos centrais:
- **Git**: ferramenta que registra o histórico de alterações; um **commit** é como uma fotografia do estado do projeto naquele momento (mostra quais arquivos mudaram, quando, descrição da mudança, quem fez, estado anterior).
- **GitHub**: serviço online que guarda repositórios Git (repositório = pasta do projeto controlada pelo Git).

### 2.2. Passos exatos, na ordem

**Racional da ordem:** o primeiro commit registra a estrutura preparada — `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), estrutura inicial do projeto, arquivos de base, documentos de apoio. Depois, a cada fase construída, a IA cria novos commits. Exemplo de histórico esperado:
- Commit 1 — Estrutura inicial do projeto
- Commit 2 — Fase 2: banco de dados
- Commit 3 — Fase 3: autenticação e sessão
- Commit 4 — Fase 4: cadastro principal
- Commit 5 — Revisão de segurança
- Commit 6 — Documentação final

**Sequência da etapa (executada pela IA via Prompt do passo 3):**
1. **Ler contexto** — ler integralmente `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md` e o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`); identificar stack, arquitetura, ambientes, gerenciador de dependências, arquivos de config, o que versionar/ignorar, estratégia de deploy e regras de segurança.
2. **Criar ou revisar o `.gitignore`** conforme stack/arquitetura/deploy do FSD; mostrar resumo do que será ignorado e por quê.
3. **Criar ou revisar o `.gitattributes`** (padronizar tratamento de arquivos: finais de linha, texto vs. binário) adaptado à stack.
4. **Conferir que nenhum segredo será versionado** — usar `git status` e `git add --dry-run .`; se achar algo sensível, ajustar `.gitignore`; explicar em linguagem simples quais arquivos ficaram protegidos.
5. **Inicializar o Git e criar o primeiro commit** — verificar com `git status`; se não for repositório: `git init` + `git branch -M main`; `git add .` + `git status`; revisar status; `git commit -m "Estrutura inicial do projeto"` (ou, se já houver commits, `git commit -m "Configura Git e arquivos de controle"`).
6. **Enviar para o GitHub** — verificar remote com `git remote -v`; Opção A: GitHub CLI (`gh repo create <nome-do-projeto> --private --source=. --remote=origin --push`); Opção B: criar repositório vazio no GitHub e usar `git remote add origin ...` + `git push -u origin main` (HTTPS ou SSH).
7. **Atualizar os arquivos vivos** — `docs/STATUS.md` registrando todos os passos; `docs/ERROS.md` com o formato de erro padrão.
8. **Orientar o uso diário** — rotina após cada fase: `git add .` + `git commit -m "descreva a alteração"` + `git push`; orientar commit ao final de cada fase importante, especialmente após o **prompt 04**.
9. **Entregar a "Saída esperada"** (checklist de 10 itens, ver 2.5).

**Tutorial manual (quando o prompt não conecta ao GitHub) — 11 passos de SSH:**
1. Verificar se já existe chave SSH: `ls ~/.ssh` (procura por `id_ed25519`/`id_ed25519.pub` ou `id_rsa`/`id_rsa.pub`; o arquivo sem `.pub` é a **chave privada**, nunca compartilhar; o com `.pub` é a **pública**, pode cadastrar no GitHub).
2. Criar nova chave: `ssh-keygen -t ed25519 -C "seu-email@exemplo.com"` (ou `ssh-keygen -t rsa -b 4096 -C "seu-email@exemplo.com"` se não aceitar ed25519). Enter para local padrão; senha opcional (Enter = sem senha).
3. Iniciar o agente SSH: `eval "$(ssh-agent -s)"`, depois `ssh-add ~/.ssh/id_ed25519` (ou `ssh-add ~/.ssh/id_rsa`).
4. Copiar a chave pública: `cat ~/.ssh/id_ed25519.pub` (ou `id_rsa.pub`); copiar o texto inteiro começando com `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA...`. **Copiar a pública (.pub), não a privada.**
5. Cadastrar no GitHub (navegador): foto de perfil → Settings → SSH and GPG keys → New SSH key. Preencher: `Title: nome do computador, por exemplo "PC Ramiro"`; `Key type: Authentication Key`; `Key: cole a chave pública`. Clicar em `Add SSH key`.
6. Testar a conexão: `ssh -T git@github.com`; na pergunta "Are you sure you want to continue connecting?" digitar `yes`. Mensagem de sucesso: `Hi seu-usuario! You've successfully authenticated, but GitHub does not provide shell access.` (a frase "does not provide shell access" **não é erro**).
7. Criar repositório no GitHub: botão New → Repository name (ex.: `financas-simples`) → Private (recomendado para o treinamento) ou Public. **Atenção:** se o projeto já existe no computador, **não marcar** opções de criar README, `.gitignore` ou license no GitHub (evita conflito). Clicar em `Create repository`.
8. Copiar a URL SSH: escolher opção SSH, ex.: `git@github.com:seu-usuario/financas-simples.git`. Evitar HTTPS neste fluxo.
9. Conectar o projeto local: `git remote add origin git@github.com:seu-usuario/financas-simples.git`; conferir com `git remote -v` (espera `origin ... (fetch)` e `origin ... (push)`).
10. Enviar: `git push -u origin main`. Se o Git disser que a branch atual tem outro nome, pedir ajuda à IA.
11. Confirmar no GitHub (navegador): abrir o repositório e conferir que os arquivos apareceram. **Se aparecerem arquivos sensíveis (senhas, `.env` real), parar e pedir ajuda.**

**Quando o remoto já existe:** se ao adicionar aparecer "origin já existe", não forçar. Verificar `git remote -v`; se o endereço estiver errado, trocar com `git remote set-url origin git@github.com:seu-usuario/financas-simples.git` (apenas com certeza de que quer alterar).

**Resumo dos comandos principais (SSH):** `ls ~/.ssh` → `ssh-keygen -t ed25519 -C "seu-email@exemplo.com"` → `eval "$(ssh-agent -s)"` → `ssh-add ~/.ssh/id_ed25519` → `cat ~/.ssh/id_ed25519.pub` → `ssh -T git@github.com` → `git remote add origin git@github.com:seu-usuario/financas-simples.git` → `git remote -v` → `git push -u origin main`.

**A chave SSH vale para outros projetos?** Sim. A chave é entre computador e conta do GitHub, não por projeto. O que muda por projeto é apenas o endereço do remoto (`git remote add origin git@github.com:seu-usuario/sistema-agendamento.git`). Criar/cadastrar outra chave só em outro computador, outra conta ou por organização/segurança.

### 2.3. Prompt do passo 3 (transcrito VERBATIM)

> **Instruções de uso da metodologia:** versão generalista, sem stack fixa; cita o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity). **ATENÇÃO: executar em um chat novo com raciocínio.** O prompt deve ajudar a configurar o GitHub; se não acontecer, usar o tutorial no final do capítulo.

```text
Responda sempre em **português do Brasil**.

Você é especialista em Git, GitHub e segurança de arquivos sensíveis, ajudando um usuário **leigo**.

Sua missão é configurar o controle de versão do projeto com Git e preparar um backup seguro no GitHub.

Objetivo desta etapa:

Projeto local -> Git -> GitHub

Não construa funcionalidades nesta etapa.

## Antes de tudo

Leia integralmente:

- `docs/FSD.md`
- `docs/DESIGN.md`
- `docs/INSUMOS.md`
- `docs/PLANO.md`
- `docs/STATUS.md`
- `docs/ERROS.md`
- arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)

Identifique no FSD e no arquivo de contexto:

- stack do projeto;
- arquitetura;
- ambiente de desenvolvimento;
- ambiente de produção;
- gerenciador de dependências, se houver;
- arquivos de configuração usados pela stack;
- arquivos de exemplo que podem ser versionados;
- arquivos reais de configuração que não devem ser versionados;
- arquivos ou pastas necessários para produção;
- arquivos ou pastas que podem ser reconstruídos no ambiente correto;
- pastas de build, cache ou dependências, se existirem;
- scripts de banco, migrations, schemas ou equivalentes;
- estratégia de deploy prevista, se já estiver definida;
- regras de segurança relacionadas a segredos, credenciais, tokens e logs.

Não presuma PHP, MySQL, XAMPP, Laravel, Node.js, Python, Supabase, Firebase, Next.js ou qualquer outra tecnologia se isso não estiver definido no FSD.

Se faltar uma informação essencial para decidir o que deve ou não ser versionado, pergunte ao usuário antes de criar o `.gitignore`.

## Como agir

- Execute os comandos quando o ambiente permitir.
- Antes de executar comandos importantes, mostre o comando e explique em uma frase o que ele faz.
- Se não puder executar, entregue os comandos prontos para o usuário copiar e colar.
- Nunca versione senhas reais, tokens, chaves privadas, certificados sensíveis, arquivos de configuração reais com segredos, logs sensíveis, dumps ou backups de banco.
- Não ignore automaticamente arquivos necessários para produção.
- Não versione automaticamente dependências ou builds que podem ser reconstruídos com segurança no ambiente correto.
- Em caso de dúvida sobre versionar ou ignorar um arquivo, pergunte antes.
- Se o projeto já tiver Git configurado, não reinicialize sem necessidade. Primeiro verifique o estado atual.

## 1. Criar ou revisar o `.gitignore`

Crie ou revise o arquivo `.gitignore` de acordo com a stack, a arquitetura e a estratégia de deploy definidas no FSD.

O `.gitignore` deve ignorar, quando existirem e quando fizer sentido para a stack:

- arquivos de configuração reais com segredos;
- arquivos `.env` reais;
- chaves privadas;
- certificados sensíveis;
- tokens;
- logs;
- dumps e backups de banco;
- arquivos temporários;
- caches;
- pastas de build que não devem ser versionadas;
- dependências que podem ser reconstruídas no ambiente correto;
- arquivos do sistema operacional;
- configurações pessoais de editores.

Atenção:

- Arquivos de exemplo, como `.env.example`, `config.example.*`, `config/*.example.*` ou equivalentes, normalmente podem ser versionados, desde que não contenham segredos reais.
- Scripts de banco, migrations, schemas ou arquivos necessários para criar e atualizar a estrutura do banco devem ser versionados quando fizerem parte do projeto.
- Dependências como `vendor/`, `node_modules/`, `.venv/`, `.next/`, `dist/`, `build/` ou equivalentes devem ser tratadas conforme a stack e o deploy definidos no FSD.
- Não aplique uma regra fixa para dependências sem verificar o FSD.
- Não ignore a pasta `docs/` neste momento, pois ela faz parte da documentação do projeto e ajuda a IA em chats futuros, salvo se o FSD ou o usuário definirem outra regra para este repositório.
- Não ignore arquivos de contexto da IA, como `AGENTS.md` ou `CLAUDE.md`, salvo se o usuário pedir o contrário. Eles ajudam a manter continuidade no projeto.

Antes de seguir, mostre um resumo do que será ignorado e por quê.

## 2. Criar ou revisar o `.gitattributes`

Crie ou revise o arquivo `.gitattributes` para padronizar o tratamento dos arquivos do projeto.

Quando fizer sentido, configure:

- arquivos de texto com final de linha consistente;
- arquivos de código como texto;
- arquivos Markdown como texto;
- scripts como texto;
- arquivos de configuração como texto;
- imagens e binários como arquivos binários.

Adapte os padrões aos tipos de arquivo usados pela stack do projeto.

Não use uma lista fixa incompatível com a stack. Por exemplo, se o projeto não usa PHP, não há necessidade de regras específicas para `*.php`, a menos que existam arquivos PHP no projeto.

## 3. Conferir que nenhum segredo será versionado

Antes do primeiro commit, confira o que entraria no Git.

Use comandos como:

`git status`

e, se necessário:

`git add --dry-run .`

Verifique se não aparecem arquivos sensíveis, como:

- `.env` real;
- arquivos reais de configuração local;
- senhas;
- tokens;
- chaves privadas;
- logs;
- backups;
- dumps de banco;
- certificados sensíveis;
- arquivos com credenciais de produção.

Se encontrar algo sensível, ajuste o `.gitignore` antes de continuar.

Explique ao usuário, em linguagem simples, quais arquivos ficaram protegidos.

## 4. Inicializar o Git e criar o primeiro commit

Primeiro, verifique se o projeto já usa Git:

`git status`

Se aparecer que o diretório não é um repositório Git, inicialize:

`git init`
`git branch -M main`

Se o projeto já tiver Git configurado, não rode `git init` novamente. Apenas continue com a conferência.

Depois, adicione os arquivos permitidos:

`git add .`
`git status`

Antes de criar o commit, revise o status e confirme que nenhum segredo será versionado.

Se estiver tudo certo, crie o primeiro commit desta etapa:

`git commit -m "Estrutura inicial do projeto"`

Se já existirem commits anteriores, crie um novo commit com uma mensagem adequada ao estado atual, por exemplo:

`git commit -m "Configura Git e arquivos de controle"`

## 5. Enviar para o GitHub

Verifique se já existe um repositório remoto configurado:

`git remote -v`

Se já existir um remote correto, use-o.

Se não existir, ajude o usuário a criar ou conectar um repositório no GitHub.

### Opção A - GitHub CLI disponível

Se o GitHub CLI (`gh`) estiver instalado e autenticado, pergunte ao usuário:

- nome desejado do repositório;
- se o repositório deve ser privado ou público.

Para iniciantes, recomende repositório privado.

Exemplo:

`gh repo create <nome-do-projeto> --private --source=. --remote=origin --push`

### Opção B - Sem GitHub CLI

Se o GitHub CLI não estiver disponível, oriente o usuário a criar um repositório vazio no GitHub.

Depois, entregue os comandos:

`git remote add origin https://github.com/<usuario>/<nome-do-projeto>.git`
`git push -u origin main`

Se o usuário preferir SSH e já tiver chave SSH configurada, use o formato SSH:

`git remote add origin git@github.com:<usuario>/<nome-do-projeto>.git`
`git push -u origin main`

Não configure um remote novo sem verificar se já existe um.

Não sobrescreva um remote existente sem explicar o impacto e pedir confirmação.

## 6. Atualizar os arquivos vivos

Atualize `docs/STATUS.md` registrando que:

- Git foi verificado ou inicializado;
- `.gitignore` foi criado ou revisado;
- `.gitattributes` foi criado ou revisado;
- arquivos sensíveis foram protegidos;
- commit desta etapa foi feito;
- repositório GitHub foi configurado ou ficou pendente de ação do usuário;
- push foi realizado ou ficou pendente.

Se algum erro aparecer durante esta etapa, registre em `docs/ERROS.md`:

## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:

## 7. Orientar o uso diário

Explique ao usuário a rotina básica após cada fase concluída:

`git add .`
`git commit -m "descreva a alteração"`
`git push`

Explique em linguagem simples:

- `git add .` prepara os arquivos para o registro;
- `git commit` cria o registro da mudança;
- `git push` envia o registro para o GitHub.

Oriente o usuário a fazer um commit ao final de cada fase importante, especialmente depois do prompt 04.

## Saída esperada

Ao final, entregue:

1. Resumo do que foi configurado.
2. Stack identificada e impacto dela no `.gitignore`.
3. Lista dos principais arquivos e pastas protegidos pelo `.gitignore`.
4. Lista dos principais arquivos e pastas que serão versionados por serem necessários ao projeto.
5. Confirmação de que nenhum segredo foi versionado.
6. Confirmação do commit criado nesta etapa.
7. Endereço do repositório no GitHub, se já tiver sido criado ou conectado.
8. Atualização de `docs/STATUS.md`.
9. Registro em `docs/ERROS.md`, se algum erro ocorreu.
10. Próximo passo:

Backup pronto. Próximo passo: chat novo + prompt do próximo passo para começar a construir o sistema.

Lembre-se: o objetivo desta etapa é proteger o projeto com Git e GitHub. Não construa funcionalidades agora.
```

### 2.4. Prompt de apoio para problemas com SSH (transcrito VERBATIM)

> Para usar no chat de ajuda ou no chat da etapa quando algo der errado com a chave SSH.

```text
Estou tentando conectar meu projeto local ao GitHub usando SSH, mas encontrei um problema.

Explique em linguagem simples o que pode estar acontecendo e me diga o próximo passo seguro.

Informações:

- Sistema operacional: [Informe]
- Ferramenta usada: [Informe]
- Comando executado: [Informe]
- Mensagem de erro completa: [Informe]
- Já criei a chave SSH?
- Já cadastrei a chave pública no GitHub?
- Já testei com `ssh -T git@github.com`?

Não peça para eu apagar chaves ou alterar configurações sem explicar o impacto.
```

### 2.5. Checklists, "O que a IA deve entregar" e formatos citados

**Bloco "Copiar" — entregáveis da etapa ("O que a IA deve entregar"):**
```
Git inicializado;
.gitignore criado ou revisado;
.gitattributes criado ou revisado;
primeiro commit feito;
repositório GitHub configurado;
STATUS.md atualizado;
ERROS.md atualizado, se algum problema ocorreu.
```
Se o repositório GitHub não puder ser criado automaticamente, a IA deve fornecer o passo a passo para criar manualmente.

**Exemplo de `.gitignore` do capítulo (bloco "Copiar"):**
```
.env
logs/
node_modules/
```
Significado: não enviar o arquivo `.env`, a pasta `logs/` e a pasta `node_modules/`. Regra geral: *"Ignore segredos, logs, temporários e dependências que possam ser reconstruídas no ambiente correto. Não ignore arquivos necessários para produção se o FSD disser que eles devem ser enviados."* O `.gitignore` precisa combinar com a stack (ex.: Node costuma ignorar `node_modules/`, recriável com `npm install`; em alguns projetos PHP em hospedagem compartilhada pode ser necessário versionar `vendor/` se a produção não roda Composer no servidor). A IA deve seguir o que o FSD definiu.

**Formato de registro de erro (usado tanto no prompt do passo 3 quanto no passo 4):**
```
## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:
```

**Checklist do processo SSH no GitHub (preenchimento da chave):** `Title` (nome do computador, ex. "PC Ramiro"), `Key type: Authentication Key`, `Key` (chave pública copiada) → `Add SSH key`.

### 2.6. Vocabulário especializado (tabela da metodologia)

| Termo | Explicação simples |
|---|---|
| Git | Ferramenta que registra o histórico de alterações do projeto. |
| GitHub | Serviço online que guarda uma cópia do projeto controlado pelo Git. |
| Repositório | Pasta do projeto acompanhada pelo Git. |
| Commit | Registro de uma versão do projeto em determinado momento. |
| Push | Envio dos commits do computador para o GitHub. |
| .gitignore | Arquivo que informa ao Git o que não deve ser enviado para o repositório. |
| .gitattributes | Arquivo que ajuda a padronizar como alguns arquivos são tratados pelo Git. |
| Arquivo sensível | Arquivo que pode conter senha, token, chave ou configuração privada. |
| Branch | Linha de trabalho dentro do Git. Neste fluxo, usaremos a branch principal chamada main. |

Termos adicionais definidos no corpo do texto: **SSH** (forma segura de autenticação entre computador e GitHub; a chave SSH é como uma chave digital que reconhece o computador sem pedir usuário/senha a cada envio); **chave privada** (arquivo sem `.pub`, nunca compartilhar) vs. **chave pública** (arquivo com `.pub`, cadastrada no GitHub); **versionar** (colocar o arquivo dentro do controle do Git e, possivelmente, enviar ao GitHub).

### 2.7. Regras, avisos, boas práticas e armadilhas

- **Nunca versionar segredos**, mesmo em repositório privado: senha do banco, chaves de API, tokens, configurações reais de produção, logs, dumps, certificados, chaves privadas. Manter no Git apenas arquivos de exemplo sem dados sensíveis.
- **Nunca compartilhar a chave privada SSH**; cadastrar apenas a pública.
- Ao criar o repositório no GitHub para um projeto que **já existe na máquina**, não marcar README, `.gitignore` ou license (evita conflito com o projeto local).
- A frase `Hi ... GitHub does not provide shell access` **não é erro** — indica autenticação OK.
- Não forçar sobrescrita de `origin` existente; verificar `git remote -v` e usar `git remote set-url` somente com certeza.
- Não rodar `git init` de novo se o projeto já tem Git configurado.
- `.gitattributes` não deve ter lista fixa incompatível com a stack (ex.: regras `*.php` sem arquivos PHP).
- Recomeçar um chat novo com raciocínio para este prompt; para iniciantes, repositório privado recomendado.
- Se o remoto informar branch com outro nome, pedir ajuda à IA antes de continuar.
- Ao final do push, conferir no navegador; se aparecerem arquivos sensíveis, **parar e pedir ajuda**.

### 2.8. Erros comuns e como resolver

| Erro / situação | Resolução |
|---|---|
| Diretório não é repositório Git | `git init` + `git branch -M main` |
| "origin já existe" ao adicionar remoto | Não forçar; `git remote -v`; se errado, `git remote set-url origin git@github.com:seu-usuario/financas-simples.git` |
| Mensagem "GitHub does not provide shell access" | Não é erro; significa autenticação bem-sucedida |
| Segredos prestes a entrar no commit | `git status` / `git add --dry-run .`; ajustar `.gitignore` antes do commit |
| Branch atual com nome diferente de main no push | Pedir ajuda à IA antes de continuar |
| Problemas com chave SSH | Usar o "Prompt de apoio para problemas com SSH" com OS, ferramenta, comando, erro completo e estado das verificações |
| Projeto já tem Git | Não reinicializar; apenas conferir estado e continuar |
| Remote novo/sobrescrita | Não configurar/sem explicar o impacto e pedir confirmação |

---

## 3. Capítulo: Passo 4 — Codificando em etapas

### 3.1. Objetivo do capítulo

Construir o sistema **em fases**, uma fase por execução do prompt. O "Prompt do passo 4" é reutilizado várias vezes: a cada execução a IA **lê o contexto, identifica a próxima fase pendente, constrói apenas essa fase, testa, atualiza os arquivos vivos, faz commit e para**. Depois, o usuário abre **um chat novo** e roda o mesmo prompt para a próxima fase. **Não é necessário raciocínio nesta etapa** (diferente do prompt do passo 3, que pede raciocínio).

**Por que incremental:** o erro clássico é pedir "Crie todo o sistema agora, com banco de dados, login, painel, cadastros, relatórios, segurança, documentação e deploy." Esse pedido faz você perder o controle: fica difícil saber o que foi feito, o que falta, o que foi testado, onde ocorreu erro, qual parte depende de outra, se a IA seguiu o FSD/design/segurança. Construção incremental = construir aos poucos, em partes pequenas e verificáveis; como "preparar uma parte da estrutura, você confere, registra e só depois avança".

**O que é construir em fases:** dividir o sistema em partes menores (ex.: infraestrutura, banco de dados, login, cadastro de clientes, painel administrativo, relatórios, integrações, ajustes finais). Cada fase tem um objetivo, uma checklist e **critérios de pronto** (condição usada para saber se a fase realmente terminou).

**Papel dos arquivos vivos:**
- **`docs/PLANO.md`** (criado no prompt do passo 2): principal referência; lista as fases previstas (ex.: Fase 1 – Infraestrutura e base do projeto; Fase 2 – Banco de dados e persistência; Fase 3 – Autenticação e controle de acesso; Fase 4 – Cadastro de solicitações; Fase 5 – Painel administrativo; Fase 6 – Relatórios; Fase final – Ajustes e validações). A IA lê o PLANO e descobre qual fase está pendente — **não escolhe qualquer coisa para fazer**, segue a ordem registrada.
- **`docs/STATUS.md`**: mostra o estado atual do projeto, responde "Onde paramos?". Essencial porque o prompt roda em chats novos — sem ele, a IA não saberia se o banco já foi feito, se o login está pronto etc.
- **`docs/ERROS.md`**: guarda problemas e soluções. Antes de resolver um erro novo, a IA deve consultá-lo (evita repetir soluções que falharam e ajuda em fases futuras).

### 3.2. Prompt do passo 4 (transcrito VERBATIM)

> **Instruções de uso da metodologia:** versão generalista, sem stack fixa; cita o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity). **ATENÇÃO: executar em um chat novo. Não é necessário raciocínio.** Função clara do prompt: ler o contexto, identificar a próxima fase pendente, construir apenas essa fase, testar, registrar e parar. **Não deve** construir duas fases ao mesmo tempo, **não deve** "aproveitar" para adiantar outras partes, **não deve** sair do escopo do FSD.

```text
# Prompt 04 - Construir a próxima fase

Responda sempre em **português do Brasil**.

Você é um(a) desenvolvedor(a) sênior cuidadoso(a), responsável por construir o sistema descrito em `docs/FSD.md` e `docs/DESIGN.md`.

Sua missão nesta etapa é construir **apenas a próxima fase pendente** do projeto, conforme `docs/PLANO.md` e `docs/STATUS.md`.

Você trabalha com autonomia técnica dentro da pasta do projeto: pode escrever código, criar ou alterar arquivos, instalar dependências previstas, criar e executar scripts, preparar banco ou persistência quando aplicável, criar dados iniciais definidos, testar, registrar progresso e versionar.

Não construa mais de uma fase neste chat.

## 1. Reconstruir o contexto

Antes de alterar qualquer arquivo, leia integralmente, nesta ordem:

* arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
* `docs/FSD.md`
* `docs/DESIGN.md`
* `docs/INSUMOS.md`
* `docs/PLANO.md`
* `docs/STATUS.md`
* `docs/ERROS.md`

Reconstrua o contexto do projeto antes de escrever código.

Identifique:

* stack do projeto;
* arquitetura definida;
* ambiente de desenvolvimento;
* ambiente de produção;
* comandos disponíveis para instalar, rodar, testar, migrar, validar ou fazer build;
* regras de segurança;
* estrutura de pastas;
* fase atual;
* próxima fase pendente;
* critérios de pronto da próxima fase;
* arquivos, pastas ou áreas prováveis que serão alterados;
* erros já registrados que possam impactar esta fase.

Não presuma PHP, MySQL, XAMPP, Laravel, Node.js, Python, Supabase, Firebase, Next.js ou qualquer outra tecnologia se isso não estiver definido no FSD ou no arquivo de contexto.

## 2. Identificar a próxima fase pendente

Com base em `docs/PLANO.md` e `docs/STATUS.md`, identifique a próxima fase pendente.

Antes de construir, informe ao usuário:

* nome da fase;
* objetivo da fase;
* tarefas previstas;
* critérios de pronto;
* arquivos, pastas ou áreas prováveis que serão alterados;
* testes que pretende executar.

Construa **apenas essa fase**.

Se todas as fases já estiverem concluídas, não construa nada. Avise que a codificação terminou e oriente o usuário a abrir um chat novo e usar o prompt de validação de segurança do passo 5.

## 3. Regras obrigatórias durante a construção

Siga rigorosamente estas regras:

* Não invente funcionalidades fora do FSD.
* Não altere regras de negócio sem necessidade.
* Não avance para outra fase.
* Não construa itens marcados como "fora de escopo".
* Respeite a stack, arquitetura, ambientes e restrições definidas no FSD.
* Siga `docs/DESIGN.md` em telas, componentes, cores, espaçamentos, tipografia, identidade visual e referências visuais.
* Consulte `docs/ERROS.md` antes de resolver erros que apareçam.
* Aplique as regras de segurança adequadas à stack definida no FSD.
* Use nomes claros para arquivos, funções, classes, métodos, rotas, componentes, tabelas, campos e variáveis.
* Evite duplicação desnecessária.
* Escreva comentários em português do Brasil apenas quando eles ajudarem a entender o código.
* Não exponha senhas, tokens, chaves, certificados ou credenciais.
* Não remova arquivos importantes sem explicar e pedir confirmação.
* Não instale bibliotecas, frameworks ou ferramentas fora do FSD sem perguntar ao usuário.
* Se uma decisão técnica importante estiver faltando, pare e pergunte antes de continuar.

## 4. Segurança obrigatória

Aplique as práticas de segurança compatíveis com a stack do projeto.

Considere, quando aplicável:

* armazenamento seguro de senhas;
* verificação segura de senhas;
* proteção contra injeção em banco de dados;
* proteção contra XSS;
* proteção contra CSRF;
* autenticação segura;
* controle de sessão;
* controle de acesso por perfil, permissão, conta, empresa ou organização;
* isolamento de dados conforme o FSD;
* validação de entradas;
* sanitização ou escape de saídas;
* proteção de rotas, páginas, endpoints ou áreas internas;
* proteção de arquivos sensíveis;
* uso seguro de variáveis de ambiente ou arquivos de configuração;
* mensagens de erro genéricas para o usuário;
* detalhes técnicos apenas em logs protegidos;
* proteção em uploads, se a fase envolver upload;
* segurança no consumo de APIs externas, se a fase envolver integrações;
* cuidado com chaves, tokens e credenciais;
* registros de eventos sensíveis, se o FSD exigir logs de segurança.

Se o FSD ou o arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)) definirem regras específicas de segurança, elas têm prioridade.

Não aplique mecanicamente uma regra de outra stack. Por exemplo: não use funções específicas de PHP, Node, Laravel, Django, Supabase ou outro ambiente se elas não fizerem sentido para a stack definida.

## 5. Construir a fase

Implemente tudo que estiver previsto para a fase atual.

Dependendo da stack e do FSD, isso pode envolver:

* criar ou alterar arquivos de código;
* criar ou alterar telas;
* criar ou alterar componentes;
* criar ou alterar rotas;
* criar ou alterar controllers, services, models, repositories, actions, pages, views ou equivalentes;
* criar ou alterar APIs, endpoints ou handlers;
* criar ou alterar migrations, schemas, scripts de banco ou estruturas de persistência;
* rodar migrations ou comandos equivalentes;
* criar dados iniciais definidos no FSD;
* ajustar assets identificados em `docs/INSUMOS.md`;
* copiar arquivos de uso em execução para a pasta pública ou de assets adequada à stack;
* configurar dependências previstas no FSD;
* atualizar arquivos de configuração de exemplo;
* criar ou ajustar validações;
* aplicar regras de segurança;
* criar ou ajustar testes, quando aplicável;
* atualizar scripts de execução, build ou validação, quando necessário.

Entregue código completo e funcional para a fase atual, seguindo a arquitetura definida no FSD.

Se o FSD definir MVC, siga MVC.

Se o FSD definir outra arquitetura, siga a arquitetura definida.

Se o FSD não definir uma arquitetura suficiente para executar a fase, pergunte antes de inventar.

## 6. Banco de dados e persistência, se aplicável

Se a fase envolver banco de dados ou persistência:

* siga a estratégia definida no FSD;
* crie ou atualize migrations, schemas, scripts, models, seeders ou mecanismos equivalentes da stack;
* mantenha os arquivos numerados, nomeados ou organizados conforme o padrão do projeto;
* não apague dados sem confirmação;
* não sobrescreva banco de dados sem autorização;
* não crie tabelas, coleções, campos ou índices fora do FSD sem justificar e pedir confirmação;
* crie dados iniciais apenas se estiverem definidos no FSD ou forem indispensáveis para testar a fase;
* informe ao usuário qualquer credencial inicial criada para primeiro acesso;
* rode os comandos necessários quando o ambiente permitir;
* explique ao usuário o que foi criado ou alterado.

Se a fase exigir criação do banco, use o ambiente de desenvolvimento definido no FSD.

Não presuma XAMPP, usuário `root`, senha vazia, SQLite, PostgreSQL, MySQL, Supabase ou qualquer outro mecanismo se isso não estiver definido.

Se o projeto não usar banco de dados ou persistência nesta fase, ignore esta seção.

## 7. Dependências e bibliotecas

Se a fase exigir instalar biblioteca, pacote ou dependência:

* verifique se ela está prevista no FSD ou é claramente necessária para cumprir a fase;
* explique ao usuário por que ela é necessária;
* use o gerenciador de dependências definido pela stack;
* registre comandos executados;
* garanta que os arquivos corretos sejam versionados ou ignorados conforme a estratégia definida no FSD e no `.gitignore`;
* não instale alternativas fora do escopo sem perguntar.

Exemplos de dependências possíveis, dependendo da stack:

* pacote de envio de e-mail;
* biblioteca de autenticação;
* biblioteca de validação;
* cliente de API externa;
* framework CSS;
* pacote de testes;
* ferramenta de build.

Não instale nada apenas por conveniência se o FSD não permitir ou se houver solução nativa adequada.

## 8. Testar a fase

Teste o que for possível no ambiente disponível.

Dependendo da stack, isso pode incluir:

* rodar testes automatizados;
* executar comandos de validação;
* verificar sintaxe;
* testar conexão com banco;
* rodar migrations ou validar schemas;
* iniciar o servidor local;
* abrir ou orientar abertura no navegador;
* testar fluxos manuais;
* conferir logs;
* executar build;
* testar endpoints;
* verificar se a fase cumpre seus critérios de pronto.

Se não puder executar algum teste, explique por quê e entregue ao usuário os passos para testar manualmente.

Se algum teste falhar:

1. investigue o erro;
2. consulte `docs/ERROS.md`;
3. corrija o problema;
4. teste novamente;
5. registre o erro e a solução em `docs/ERROS.md`.

Não marque a fase como concluída se os critérios de pronto não foram atendidos.

Se houver uma pendência real que dependa do usuário ou do ambiente, registre claramente em `docs/STATUS.md`.

## 9. Registrar erros e progresso

### 9.1. Erros
Se aparecer qualquer erro durante a construção, registre em `docs/ERROS.md`.

Use este formato:

## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:

---

Antes de resolver um erro novo, consulte `docs/ERROS.md` para ver se já há solução conhecida.

### 9.2. Progresso

Ao terminar a fase, atualize `docs/STATUS.md`.

Registre:

* fase construída;
* tarefas concluídas;
* tarefas pendentes, se houver;
* arquivos principais alterados;
* testes executados;
* resultado dos testes;
* data ou momento da atualização;
* próxima fase recomendada.

Marque a fase como concluída apenas se ela atender aos critérios de pronto.

## 10. Versionar a fase

Depois de concluir e testar a fase, verifique o estado do Git:

`git status`

Confirme que não há segredos ou arquivos sensíveis entrando no commit.

Se houver arquivos sensíveis, ajuste o `.gitignore` antes do commit.

Depois faça commit com uma mensagem clara, por exemplo:

`git add .`
`git commit -m "Fase X: <resumo da fase>"`

Se não puder executar o commit, entregue os comandos para o usuário copiar e colar.

Depois, lembre o usuário de fazer:

`git push`

para atualizar o backup no GitHub.

Não faça commit de:

* senhas reais;
* tokens;
* chaves privadas;
* certificados sensíveis;
* arquivos de configuração reais com segredos;
* logs sensíveis;
* dumps ou backups de banco;
* arquivos temporários;
* dependências ou builds que o FSD mandar ignorar.

## 11. Entregar ao usuário em linguagem simples

Ao final, responda com:

1. Nome da fase construída.
2. Resumo do que foi implementado.
3. Arquivos, pastas ou áreas principais alterados.
4. Dados iniciais criados, se houver.
5. Credenciais iniciais de teste, se houver e se forem seguras para ambiente local.
6. Testes executados e resultado.
7. Passos de teste manual para o usuário fazer no navegador, terminal, API client ou ambiente correspondente.
8. Resultado esperado em cada teste.
9. Confirmação de atualização do `docs/STATUS.md`.
10. Confirmação de registro no `docs/ERROS.md`, se houve erro.
11. Confirmação do commit ou comandos para o usuário executar.
12. Lembrete para fazer `git push`.
13. Próximo passo.

Use esta frase final:

Quando confirmar que esta fase está funcionando, abra um chat novo e cole novamente o prompt do passo 4 para a próxima fase.

Lembre-se: uma execução deste prompt deve construir apenas uma fase.
```

### 3.3. Como testar uma fase

"Ao final de cada fase, a IA deve explicar como você testa." Isso está coberto pela seção 8 do prompt (testes automatizados, validação, sintaxe, conexão com banco, migrations/schemas, servidor local, navegador, fluxos manuais, logs, build, endpoints, critérios de pronto) e pela seção 11 do prompt (itens 6–8: testes executados/resultado, passos de teste manual, resultado esperado em cada teste). Se a IA não puder executar algum teste, deve explicar por quê e entregar os passos manuais.

### 3.4. Modelo de reporte de erro quando uma fase falha (transcrito VERBATIM)

> Se uma fase falhar durante o teste, **não avance**. Copie o erro e envie para a IA **no mesmo chat da fase**. Modelo fornecido pelo capítulo (bloco "Copiar"):

```text
Encontrei este erro ao testar a fase atual:

[cole aqui o erro completo]

O que eu fiz antes do erro:
1. Abri a URL: [URL]
2. Cliquei em: [Informe]
3. Preenchi: [Informe]
4. O erro apareceu quando: [Informe]

Leia `docs/ERROS.md` antes de corrigir. Corrija apenas a fase atual. Depois teste novamente e registre a solução em `docs/ERROS.md`.
```

> A metodologia observa: "Esse modelo dá contexto suficiente para a IA investigar."

### 3.5. Vocabulário especializado (tabela da metodologia)

| Termo | Explicação simples |
|---|---|
| Construção incremental | Forma de construir o sistema aos poucos, em partes menores. |
| Fase | Parte específica da construção do sistema. |
| Critério de pronto | Condição usada para saber se uma fase foi concluída corretamente. |
| Migration | Arquivo ou script usado para criar ou alterar a estrutura do banco de dados. |
| Persistência | A capacidade do sistema de guardar dados para uso posterior. |
| Autenticação | Processo de verificar quem é o usuário, geralmente por login e senha. |
| Autorização | Regra que define o que cada usuário pode acessar ou fazer. |
| Commit | Registro de uma alteração no Git. |
| Teste manual | Conferência feita pelo usuário no navegador ou pela interface do sistema. |

### 3.6. Regras, avisos, boas práticas e armadilhas

- **Nunca** pedir para a IA construir tudo de uma vez ("Crie todo o sistema agora...") — você perde controle.
- O prompt do passo 4 **não pode** construir mais de uma fase, nem adiantar partes, nem sair do escopo do FSD.
- Sempre executar em **chat novo**; o arquivo de contexto é `CLAUDE.md` no Claude Code e `AGENTS.md` no Codex e no Antigravity.
- **Sem raciocínio** nesta etapa (o passo 3 usava raciocínio).
- A IA deve seguir a **ordem do PLANO.md**, não escolher fases por conta própria.
- Antes de resolver erro novo, consultar `docs/ERROS.md`.
- Não marcar a fase como concluída se os critérios de pronto não forem atendidos.
- Não instalar bibliotecas/frameworks fora do FSD sem perguntar.
- Não presumir tecnologia (PHP, MySQL, XAMPP, Laravel, Node, Python, Supabase, Firebase, Next.js, SQLite, PostgreSQL, usuário `root`, senha vazia...) se não estiver definido no FSD.
- Segurança obrigatória mesmo durante a construção (ver lista completa na seção 4 do prompt); regras do FSD/arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) têm prioridade; não copiar regras de outra stack.
- Não apagar dados / não sobrescrever banco sem autorização; não criar tabelas/campos fora do FSD sem justificar e confirmar.
- Commit ao final da fase, com `git push`; nunca commit de segredos/tokens/chaves/logs/dumps/temporários/builds ignorados.
- Comentários de código apenas quando ajudam e **em português do Brasil**.
- Nomes claros para arquivos/funções/classes/métodos/rotas/componentes/tabelas/campos/variáveis; evitar duplicação.
- Ao final de todas as fases, o próximo passo é o **prompt de validação de segurança do passo 5**, em chat novo.
- Fase com pendência real que dependa do usuário/ambiente → registrar claramente em `docs/STATUS.md`.

### 3.7. Erros comuns e como resolver

| Situação | Resolução |
|---|---|
| Fase falha no teste | **Não avançar.** Copiar o erro completo e o contexto (URL, cliques, preenchimentos, momento do erro) e colar no mesmo chat da fase (modelo "Encontrei este erro..."). A IA consulta `ERROS.md`, corrige apenas a fase atual, testa de novo e registra a solução em `ERROS.md`. |
| IA não sabe se fase está pronta | Conferir critérios de pronto; só marcar concluída se atendidos. |
| Erro novo aparecendo | Consultar `docs/ERROS.md` primeiro (pode já haver solução conhecida). |
| Decisão técnica importante faltando | Parar e perguntar ao usuário antes de continuar. |
| IA inventando funcionalidade fora do FSD | Regra do prompt: não inventar; não avançar para outra fase; não construir itens "fora de escopo". |

---

## 4. Itens acionáveis (documentos, pastas, comandos e prompts)

### 4.1. Documentos / arquivos envolvidos
- `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md` — os "arquivos vivos" lidos/atualizados a cada etapa.
- Arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).
- `.gitignore` e `.gitattributes` — criados/revisados no passo 3.
- `.env.example`, `config.example.*` — versionáveis; `.env` real — nunca versionar.
- Entregáveis do passo 3: Git inicializado; `.gitignore`/`.gitattributes` criados/revisados; primeiro commit; repositório GitHub; `STATUS.md` e `ERROS.md` atualizados.

### 4.2. Comandos-chave
- Passo 3: `git status`; `git add --dry-run .`; `git init`; `git branch -M main`; `git add .`; `git commit -m "Estrutura inicial do projeto"`; `git remote -v`; `gh repo create <nome> --private --source=. --remote=origin --push`; `git remote add origin <url>`; `git push -u origin main`; `git remote set-url origin <url>`.
- SSH: `ls ~/.ssh`; `ssh-keygen -t ed25519 -C "seu-email@exemplo.com"`; `eval "$(ssh-agent -s)"`; `ssh-add ~/.ssh/id_ed25519`; `cat ~/.ssh/id_ed25519.pub`; `ssh -T git@github.com`.
- Rotina diária (pós-fase): `git add .`; `git commit -m "descreva a alteração"`; `git push`.
- Passo 4: `git status`; `git add .`; `git commit -m "Fase X: <resumo da fase>"`; `git push`.

### 4.3. Prompts prontos que um desenvolvedor precisa executar (resumo)
1. **Prompt do passo 3** — Git e GitHub (chat novo, com raciocínio).
2. **Prompt de apoio para problemas com SSH** — se a conexão SSH falhar.
3. **Prompt do passo 4** — "Prompt 04 - Construir a próxima fase" (chat novo, sem raciocínio); repetir uma vez por fase até o PLANO.md ficar completo.
4. **Modelo de reporte de erro** — quando uma fase falhar no teste (colar no mesmo chat da fase).
5. Após todas as fases: **prompt de validação de segurança do passo 5** (não incluído nestes capítulos; apenas referenciado).

### 4.4. Formatos a preencher
- Registro de erro em `docs/ERROS.md`: `## <data> - <título curto do erro>` + Sintoma / Causa / Solução aplicada / Como evitar no futuro.
- Atualização de `docs/STATUS.md` (fim de fase): fase construída, tarefas concluídas, pendências, arquivos principais alterados, testes executados e resultado, data, próxima fase recomendada.

### 4.5. Conteúdo não presente nestes capítulos
- Não há aqui o texto do prompt do passo 2 (que cria `docs/PLANO.md`), nem do prompt de validação de segurança do passo 5 — apenas referências a eles.
- Não há capítulo dedicado exclusivamente a "testes"; o conteúdo de teste está nas seções 8 e 11 do prompt do passo 4 e na seção "O que fazer quando algo falhar".
- A metodologia não traz neste grupo um checklist formal "pronto" para o Passo 4 além dos critérios de pronto por fase e da "Saída esperada"/"O que a IA deve entregar" transcritos acima.

# APES IA5K — Extração de Metodologia

## Grupo: "Testando as etapas da codificação" + "Passo 5: Revisão de segurança"

---

# 1. Visão geral do grupo

Este grupo cobre o momento **entre a construção e a publicação**: primeiro, como **testar** cada fase construída pela IA e como **relatar erros** corretamente (capítulo 9); depois, a **revisão de segurança** do projeto inteiro, feita só depois que todas as fases do `docs/PLANO.md` foram concluídas (capítulo 10).

Fluxo geral da metodologia (contexto): o capítulo 9 é a continuação direta do "prompt do passo 4" (construção em fases). A regra central é **"Sistema criado não é a mesma coisa que sistema testado"** — uma fase só é considerada pronta quando é confirmado que funciona. O capítulo 10 acontece **após todas as fases do `docs/PLANO.md`** estarem concluídas, é o último passo antes do deploy (o passo 6 virá em "chat novo + prompt do passo 6").

Arquivos/documentos de estado usados ao longo do grupo: `docs/FSD.md`, `docs/DESIGN.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity), `docs/INSUMOS.md`.

---

# 2. Capítulos

---

## Capítulo: `codificacao-9.txt`

### Tema do capítulo

**Testando as etapas da codificação / Como relatar um erro para a IA.**

### Objetivo do capítulo

Mostrar como uma pessoa leiga (que não precisa entender cada linha de código) pode testar o que a IA construiu, usando passos simples, observação cuidadosa e bons pedidos de correção. Ensinar a conferir o resultado, identificar falhas, copiar mensagens de erro, pedir correções do jeito certo e garantir que a IA registre o que aconteceu em `docs/ERROS.md` e `docs/STATUS.md`.

### Passos EXATOS na ordem

1. **Executar a fase** com o prompt do passo 4 (contexto do capítulo anterior).
2. **Receber da IA as instruções de teste** — ao final de cada execução do prompt do passo 4, a IA deve explicar como testar a fase. O teste bom diz **o que fazer** e **o que deve acontecer**, permitindo que um usuário iniciante valide a entrega sem abrir o código.
3. **Testar manualmente** a fase — conferir se o sistema faz o que deveria fazer (ver perguntas de teste abaixo), usando navegador, terminal, ferramenta de API ou a interface do sistema.
4. **Testar também o caminho de erro** ("teste de erro"), sempre que possível — campo vazio, e-mail inválido, senha errada, acesso sem login, registro inexistente, usuário tentando acessar o que não pode, data em formato inválido.
5. **Se algo falhar**: relatar o erro à IA usando o modelo de relato (nunca apenas "Deu erro."), colando a mensagem completa do erro e separando os passos.
6. **Classificar o tipo de erro** — erro técnico (sistema quebrou, ex.: erro 500) ou erro de regra de negócio (sistema funciona, mas a regra está errada, ex.: usuário comum excluiu registro só de administrador) — e comunicar qual dos dois parece ser o caso.
7. **Não avançar para a próxima fase com erro aberto** — se a fase atual falhou, corrigir antes de continuar ("Se o login não funciona, não adianta construir o painel. Se o banco não conecta, não adianta criar cadastros. Se as permissões estão erradas, não adianta seguir para relatórios. Cada fase depende da anterior.").
8. **Se o teste é difícil/técnico demais** (integração com API, processamento em background, webhook, envio de e-mail, controle de permissões complexo, relatórios com filtros): pedir para a IA transformar o teste em passos simples para pessoa leiga.
9. **Usar o checklist de teste da fase** após cada execução do prompt do passo.
10. **Se os testes da IA forem vagos**: usar o "Prompt para pedir testes melhores".
11. **Se suspeitar que a IA construiu algo diferente do combinado**: usar o "Prompt para validar a fase contra o FSD".
12. **Depois de testar com tudo funcionando**: usar o "Prompt para encerrar a fase depois dos testes" (atualiza STATUS.md/ERROS.md, verifica Git, faz commit e indica próximo passo).

### Perguntas que um bom teste responde

- O login funciona?
- O cadastro salva?
- O campo obrigatório está sendo validado?
- O usuário comum consegue acessar apenas o que deve?
- O botão leva para a tela correta?
- A mensagem de erro é compreensível?
- O sistema continua funcionando depois de atualizar a página?

### Avisos / Regras

- **"Sistema criado não é a mesma coisa que sistema testado."** — regra central do capítulo.
- Um erro comum é confiar apenas no resumo final da ferramenta ("A fase foi concluída com sucesso"). Sintomas de fase "concluída" mas quebrada: página em branco; erro de conexão; botão que não funciona; formulário que não salva; login que aceita qualquer senha; tela quebrada no celular; dados aparecendo para o usuário errado; imagem que não carrega; mensagem técnica exposta para o usuário.
- Testar não é "olhar se a tela ficou bonita" nem "clicar em qualquer lugar sem objetivo".
- Testar = comparar o **comportamento real** do sistema com o **comportamento esperado**. Se combinam → ótimo. Se não → existe algo para corrigir.
- Nunca relatar erro só com "Deu erro." — é pouco contexto. A IA precisa saber o que você fez e o que aconteceu.
- Ao relatar, tente dizer se o caso é **erro técnico** ou **erro de regra de negócio** (regra de negócio = regra do funcionamento do sistema que define como ele deve se comportar no mundo real).
- **Não avance para a próxima fase se a fase atual falhou.**
- Pode-se enviar **print da tela com erro** para a IA.
- Teste manual: feito por pessoa (clicando, preenchendo, conferindo). Teste automatizado: executado por comando/código (verificar sintaxe, testes de unidade, conexão com banco, validar build, suíte de testes). O comando exato depende da stack do `docs/FSD.md`. O usuário **não precisa decorar comandos** — a IA deve informar quais testes fazem sentido para o projeto.
- **Caminho feliz**: quando o usuário faz tudo certo (preenche campos corretamente, usa senha correta, clica no botão certo, segue o fluxo esperado). Mas sistemas reais precisam lidar com erros: "Um sistema bom não funciona apenas quando tudo dá certo. Ele também responde bem quando algo dá errado."

### Modelos / Estruturas de documentos citados

- `docs/ERROS.md` — registrar soluções/correções.
- `docs/STATUS.md` — atualizar após correção.
- `docs/FSD.md` — define stack (comandos de teste) e regras.
- `docs/DESIGN.md` — conferir se a tela segue o design.
- `docs/PLANO.md` — usado no prompt de validação.
- Git: fase registrada em commit + `git push`.

### Vocabulário técnico (tabela da metodologia — Termo / Explicação simples)

| Termo | Explicação simples |
|---|---|
| Teste | Conferência feita para saber se uma parte do sistema funciona como deveria. |
| Resultado esperado | O que deveria acontecer se tudo estivesse correto. |
| Resultado obtido | O que realmente aconteceu durante o teste. |
| Bug | Comportamento errado do sistema. |
| Erro | Falha ou mensagem que impede algo de funcionar corretamente. |
| Teste manual | Teste feito por uma pessoa, clicando, preenchendo e conferindo o sistema. |
| Teste automatizado | Teste executado por comando ou código, sem depender de uma pessoa clicando em tudo. |
| Log | Registro técnico do que aconteceu no sistema. |
| Validação | Conferência de dados antes de salvar ou processar uma informação. |

---

### PROMPTS COMPLETOS (transcritos VERBATIM) — capítulo `codificacao-9.txt`

#### Prompt: Modelo de relato de erro (bloco "Copiar", usado "quando algo falhar")

> Encontrei este erro ao testar a fase atual:
>
> [cole aqui a mensagem completa do erro]
>
> O que eu fiz antes do erro:
> 1. Abri a URL: [URL]
> 2. Cliquei em: [Explique]
> 3. Preenchi: [Explique]
> 4. O erro apareceu quando: [Explique]
>
> Resultado esperado:
> [explique o que deveria acontecer]
>
> Resultado obtido:
>
> [explique o que aconteceu de verdade]
>
> Leia `docs/ERROS.md` antes de corrigir. Corrija apenas a fase atual. Depois teste novamente, atualize `docs/STATUS.md` e registre a solução em `docs/ERROS.md`.

#### Prompt: Exemplo de relato de erro de regra de negócio (bloco "Copiar")

> O sistema não quebrou, mas acredito que a regra está errada.
>
> Entrei como usuário comum e consegui acessar a tela de administração.
> Pelo FSD, essa tela deveria ser exclusiva para administradores.
>
> Leia o FSD, confirme a regra correta e corrija apenas essa permissão.

#### Prompt: Para teste difícil para o usuário (bloco "Copiar")

> Transforme os testes desta fase em um passo a passo para uma pessoa leiga.
>
> Para cada teste, informe:
> - o que eu devo fazer;
> - onde devo clicar ou qual comando devo rodar;
> - qual resultado esperado;
> - como identificar que deu errado.

#### Checklist: Checklist de teste da fase (bloco "Copiar" — usar "depois de cada execução do prompt do passo")

> [ ] A IA informou o que foi construído.
> [ ] A IA informou como testar.
> [ ] O teste manual tem passos claros.
> [ ] Cada passo tem resultado esperado.
> [ ] Testei o caminho principal da fase.
> [ ] Testei pelo menos um caso de erro, quando aplicável.
> [ ] Conferi se a tela segue o DESIGN.md, quando há interface.
> [ ] Conferi permissões, quando a fase envolve acesso.
> [ ] Copiei mensagens de erro completas, se apareceram.
> [ ] Pedi correção sem avançar para outra fase.
> [ ] A IA atualizou ERROS.md, se houve erro.
> [ ] A IA atualizou STATUS.md.
> [ ] A fase foi registrada em commit.
> [ ] Fiz git push ou deixei claro que falta fazer.

#### Prompt: Para pedir testes melhores (bloco "Copiar" — usar "se a IA entregar testes vagos")

> Os testes estão genéricos demais.
>
> Reescreva os testes desta fase como um passo a passo para uma pessoa leiga.
>
> Para cada teste, informe:
> 1. o que devo fazer;
> 2. onde devo clicar, digitar ou qual comando devo executar;
> 3. qual resultado esperado;
> 4. o que pode indicar erro.
>
> Não avance para a próxima fase.

#### Prompt: Para validar a fase contra o FSD (bloco "Copiar" — usar "se você suspeitar que a IA construiu algo diferente do combinado")

> Compare a fase construída com `docs/FSD.md`, `docs/DESIGN.md`, `docs/PLANO.md` e `docs/STATUS.md`.
>
> Verifique:
> - se a fase construída corresponde à fase pendente;
> - se alguma funcionalidade fora do escopo foi criada;
> - se alguma regra do FSD foi ignorada;
> - se o DESIGN.md foi respeitado;
> - se os critérios de pronto foram atendidos.
>
> Se encontrar divergências, corrija apenas o que pertence à fase atual.

#### Prompt: Para encerrar a fase depois dos testes (bloco "Copiar" — usar "quando você testou e tudo funcionou")

> Testei a fase atual e está funcionando conforme os passos informados.
>
> Agora finalize a etapa:
> - confirme se `docs/STATUS.md` está atualizado;
> - confirme se `docs/ERROS.md` foi atualizado, caso tenha havido erro;
> - verifique o Git;
> - faça o commit da fase ou me entregue os comandos;
> - indique o próximo passo.

---

## Capítulo: `codificacao-10.txt`

### Tema do capítulo

**Passo 5: Revisão de segurança.**

### Objetivo do capítulo

Fazer a IA revisar o código do projeto inteiro com olhar de segurança antes da publicação: procurar falhas, classificar os problemas por gravidade, corrigir o que puder corrigir com segurança, registrar as soluções e explicar como o usuário deve testar. A revisão acontece **depois que todas as fases do `docs/PLANO.md` foram concluídas**.

### Quando usar o prompt (pré-condições)

O prompt de revisão de segurança **só deve ser usado depois que todas as fases de construção estiverem concluídas**. Antes de rodar, confira se:

- todas as fases do `PLANO.md` foram concluídas;
- o `STATUS.md` está atualizado;
- os principais testes manuais foram feitos;
- os erros conhecidos foram corrigidos ou registrados;
- o Git tem commits das fases concluídas;
- o projeto está funcionando no ambiente local.

Aviso: **Não use este prompt no meio da construção**, a menos que esteja fazendo uma revisão parcial por algum motivo específico (e aí deixe isso claro no relatório).

### Passos EXATOS na ordem

1. **Confirmar as pré-condições** (todas as fases concluídas, STATUS.md atualizado, etc.).
2. **Abrir um chat novo com raciocínio** e executar o **Prompt do passo 5** (ATENÇÃO da metodologia: "Execute este prompt em um chat novo com raciocínio").
3. **Arquivo de contexto**: o prompt cita o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).
4. **A IA reconstrói o contexto** (seção 1 do prompt): lê o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, revê todo o código e identifica stack, arquitetura, ambientes, estratégias de autenticação/autorização, persistência, integrações, uploads, configuração, rotas, regras de segurança do FSD e erros registrados.
5. **A IA verifica se a construção foi concluída** (seção 2): confere `docs/STATUS.md`; se houver fases funcionais pendentes, avisa que a revisão final deve acontecer só após a conclusão; se for revisão parcial desejada pelo usuário, deixa claro no relatório.
6. **A IA roda o checklist de segurança** (seção 3) conforme a stack do projeto (não aplicar mecanicamente regra de tecnologia que não faz parte do projeto).
7. **A IA classifica os achados por gravidade** (seção 4): Crítico / Alto / Médio / Baixo.
8. **A IA corrige o que for seguro corrigir** (seção 5), perguntando ao usuário antes de alterar algo que impacte funcionamento, regra de negócio, fluxo, estrutura de dados ou decisão de arquitetura.
9. **A IA atualiza arquivos vivos** (seção 6): `docs/STATUS.md` e, se relevante, `docs/ERROS.md`.
10. **A IA versiona as correções** (seção 7): `git status`, confirmar que nenhum segredo será versionado, commit com mensagem clara, lembrar `git push`.
11. **A IA entrega o relatório final ao usuário** (seção 8) — 11 itens de entrega (abaixo).
12. **O usuário faz os testes manuais de segurança** (lista abaixo).
13. **Frase final do prompt**: "Revisão de segurança concluída. Próximo passo: chat novo + prompt do passo 6."
14. **Não fazer deploy nesta etapa** — se a IA tentar publicar, usar o "Prompt se a IA quiser fazer deploy".

### O que a IA deve entregar (relatório — seção 8 do prompt)

1. Resumo geral da revisão.
2. Lista dos pontos que estavam corretos.
3. Lista dos achados por gravidade.
4. Correções aplicadas.
5. Pendências que dependem do usuário, se houver.
6. Testes executados.
7. Testes manuais de segurança para o usuário fazer.
8. Confirmação de atualização de `docs/STATUS.md`.
9. Confirmação de atualização de `docs/ERROS.md`, se aplicável.
10. Confirmação de commit ou comandos para o usuário executar.
11. Próximo passo.

### Checklist de segurança (seção 3 do prompt — revisar "conforme a stack do projeto", "quando aplicável")

**Autenticação e senhas**
- senhas não são salvas em texto puro;
- senhas usam mecanismo seguro de hash da stack;
- verificação de senha é feita com método seguro;
- regras mínimas de senha do FSD são respeitadas;
- login não revela se o e-mail existe ou não, salvo se o FSD permitir;
- logout encerra corretamente a sessão ou token;
- recuperação ou troca de senha segue o FSD, se existir.

**Autorização e controle de acesso**
- usuários acessam apenas o que o FSD permite;
- perfis, papéis ou permissões são respeitados;
- URLs, rotas, endpoints ou páginas internas são protegidas;
- ações administrativas não podem ser executadas por usuários comuns;
- usuário não consegue acessar dados de outro usuário, conta, empresa ou organização;
- permissões são validadas no servidor, não apenas na interface.

**Sessão, tokens e estado de login**
- sessão ou token expira conforme o FSD;
- rotas internas exigem login;
- logout remove o estado de autenticação;
- cookies, tokens ou sessões usam configurações seguras conforme a stack;
- não há exposição desnecessária de tokens no front-end, URL ou logs.

**Proteção contra injeção**
- consultas ao banco não concatenam entrada do usuário de forma insegura;
- ORM, query builder, prepared statements ou mecanismos equivalentes são usados corretamente;
- filtros, buscas, ordenações e paginações não permitem manipulação indevida;
- comandos de sistema, se existirem, não recebem entrada insegura.

**Proteção contra XSS**
- saídas em tela são escapadas ou sanitizadas conforme a stack;
- campos preenchidos por usuários não são exibidos como HTML perigoso;
- mensagens, comentários, descrições e nomes não permitem execução de scripts;
- uso de HTML rico, Markdown ou editor visual tem sanitização adequada.

**Proteção contra CSRF**
- formulários ou requisições que alteram dados têm proteção contra CSRF;
- ações sensíveis não podem ser disparadas por simples acesso a uma URL;
- APIs usam mecanismo de proteção adequado à arquitetura definida.

**Validação de entradas**
- campos obrigatórios são validados no servidor;
- e-mails têm formato validado;
- números respeitam limites;
- datas são válidas;
- arquivos enviados respeitam tipo e tamanho permitidos;
- IDs recebidos pela URL ou formulário são validados;
- entradas inválidas não quebram o sistema.

**Arquivos sensíveis e configuração** (verificar, sem "quando aplicável")
- arquivos reais de configuração com segredos não estão versionados;
- `.env`, chaves, tokens, certificados e credenciais estão protegidos;
- arquivos de exemplo não contêm senhas reais;
- logs não expõem dados sensíveis;
- backups e dumps não estão no Git;
- arquivos internos não ficam acessíveis publicamente;
- pasta de documentação, prompts e contexto da IA não são tratados como área pública do sistema.

**Erros e logs** (verificar, sem "quando aplicável")
- mensagens para o usuário são simples e genéricas;
- detalhes técnicos ficam apenas em logs protegidos;
- stack traces não aparecem para o usuário final;
- eventos sensíveis são registrados conforme o FSD;
- logs não armazenam senhas, tokens ou dados excessivos.

**Uploads e arquivos enviados por usuários**
- tipo de arquivo permitido é validado;
- tamanho máximo é validado;
- arquivos não executáveis são tratados com segurança;
- nomes de arquivos são normalizados;
- uploads não permitem sobrescrever arquivos críticos;
- arquivos privados não ficam acessíveis publicamente sem controle.

**APIs e integrações externas**
- chaves de API não aparecem no código ou no front-end sem necessidade;
- chamadas externas tratam erros;
- timeouts ou falhas são tratados;
- dados recebidos de APIs externas são validados;
- webhooks, se existirem, têm validação de origem ou assinatura quando aplicável.

**Interface e exposição de informações**
- menus não mostram ações proibidas para o perfil;
- mesmo que o menu esconda algo, o servidor também bloqueia o acesso;
- mensagens de erro não revelam detalhes internos;
- dados sensíveis não aparecem em telas inadequadas;
- páginas de teste ou debug não ficam acessíveis ao usuário final.

### Classificação de gravidade (seção 4)

- **Crítico** — pode expor dados, permitir invasão, acesso indevido grave ou controle do sistema.
- **Alto** — pode comprometer segurança importante ou permitir ação indevida relevante.
- **Médio** — risco real, mas com impacto ou exploração mais limitado.
- **Baixo** — melhoria recomendada, ajuste preventivo ou boa prática.

Para cada achado, informar: título do problema; gravidade; onde foi encontrado; explicação simples; risco prático; correção recomendada; se foi corrigido agora ou se depende do usuário.

### Regras de correção (seção 5)

- Corrigir apenas o que for seguro e **sem mudar regras de negócio importantes**.
- **Perguntar ao usuário antes** de alterar algo que impacte: funcionamento, regra de negócio, fluxo de usuário, estrutura de dados ou decisão de arquitetura.
- Ao corrigir: preserve a stack definida no FSD; preserve o design definido no DESIGN.md; não crie funcionalidades fora do escopo; não quebre fases já concluídas; teste novamente depois de corrigir; registre a correção em `docs/ERROS.md`, quando fizer sentido.

### Registro em `docs/ERROS.md` (seção 6 — formato)

> ## <data> - <título curto do problema>
>
> - Sintoma:
> - Causa:
> - Solução aplicada:
> - Como evitar no futuro:

### Comandos Git (seção 7)

- `git status` — verificar estado e confirmar que nenhum segredo será versionado.
- `git add .`
- `git commit -m "Revisão de segurança e boas práticas"` (exemplo de mensagem clara).
- `git push` — a IA deve lembrar o usuário de fazer.
- Se não puder executar o commit, a IA entrega os comandos para o usuário copiar.

### Avisos / Regras

- **"Funcionar não é o mesmo que estar seguro."** — regra central do capítulo.
- Segurança não é apenas "ter uma senha": envolve proteger dados, controlar acessos, evitar vazamento, impedir manipulação indevida e reduzir riscos antes da publicação.
- Uma aplicação web disponível para outras pessoas precisa proteger três coisas: **quem pode entrar** (autenticação); **o que cada pessoa pode fazer** (autorização); **quais dados cada pessoa pode ver ou alterar** (isolamento de dados). Analogia da metodologia: "prédio comercial — não basta ter uma porta bonita".
- Os problemas de segurança **não aparecem apenas olhando a tela** — por isso a revisão é uma etapa própria.
- Exemplos de problemas em sistema aparentemente pronto: usuário comum acessa tela de administrador; campo aceita código malicioso; consulta ao banco pode ser manipulada; senha salva de forma insegura; página interna abre sem login; mensagem de erro mostra detalhes técnicos; arquivo de configuração acessível pela URL; usuário vê dados de outro usuário.
- **Não presuma tecnologia** — o prompt manda não presumir PHP, MySQL, Laravel, Node.js, Python, Supabase, Firebase, Next.js ou qualquer outra, se não estiver definida no FSD ou no arquivo de contexto.
- Não aplicar mecanicamente regras de tecnologias que não fazem parte do projeto.
- Nesta etapa, o objetivo é **revisar e corrigir segurança — NÃO fazer deploy** (a publicação é feita depois, fora da metodologia).
- O relatório não deve ser apenas técnico: precisa explicar o risco em linguagem simples.

### Falhas comuns explicadas (em linguagem simples)

- **SQL Injection** — ataque em que alguém tenta manipular uma consulta enviada ao banco de dados (ex.: campo de login onde o atacante coloca trecho de comando no lugar do e-mail). Pode permitir acesso indevido, vazamento ou alteração de dados. Proteção depende da stack: prepared statements, ORM, query builder ou mecanismos seguros do framework. Regra: "entrada do usuário nunca deve ser encaixada de forma insegura em comandos de banco".
- **XSS** — alguém insere código malicioso em uma página (ex.: script em um campo de comentário executado no navegador de outro usuário). Pode roubar informações, alterar tela ou executar ações indevidas. Proteção: escapar, sanitizar ou controlar como o conteúdo do usuário aparece. "Texto enviado por usuário deve aparecer como texto, não como código executável."
- **CSRF** — ataque que tenta fazer o usuário executar uma ação sem perceber (ex.: usuário logado, em outra aba, acessa página maliciosa que envia requisição ao sistema como se fosse ele). Proteção: em muitos frameworks, com tokens em formulários.
- **Controle de acesso** — define quem pode acessar o quê. Falha comum: a interface esconde um botão, mas a URL continua acessível (ex.: menu não mostra "Administração", mas digitar `/admin` abre a página). A interface pode ajudar, mas a validação real precisa acontecer no servidor, na rota, no endpoint ou no mecanismo seguro da stack.
- **Isolamento de dados** — garantir que cada usuário veja apenas os dados que pode ver (ex.: cliente não vê pedidos de outro cliente; professor não edita turma de outro professor, salvo se o FSD permitir; empresa não acessa dados de outra empresa). Falha grave, pode expor informações privadas.
- **Arquivos sensíveis** — arquivos que não devem ficar acessíveis ao público e não devem ser enviados ao GitHub se contiverem dados reais: `.env`; configuração real do banco; chaves privadas; tokens; certificados; logs; backups; dumps de banco.
- **Mensagens de erro** — mensagens técnicas demais revelam informações internas. Exemplo ruim: "Erro SQL na tabela users, linha 42, arquivo /app/models/User.php". Exemplo melhor para o usuário: "Não foi possível concluir a operação. Tente novamente." Os detalhes técnicos podem ir para um log protegido.

### Testes manuais de segurança (para o usuário fazer depois da correção)

- Entrar como usuário comum e tentar acessar tela de administrador.
- Enviar formulário com campo obrigatório vazio.
- Tentar acessar página interna sem login.
- Digitar senha errada e observar a mensagem.
- Tentar alterar registro de outro usuário.
- Abrir uma URL de arquivo sensível.
- Testar logout e voltar pelo botão do navegador.

### Vocabulário técnico (tabela da metodologia — Termo / Explicação simples)

| Termo | Explicação simples |
|---|---|
| Segurança de aplicação | Conjunto de cuidados para proteger o sistema, os usuários e os dados. |
| Vulnerabilidade | Falha que pode ser explorada para causar dano ou acesso indevido. |
| SQL Injection | Ataque em que alguém tenta manipular comandos enviados ao banco de dados. |
| XSS | Ataque em que alguém tenta inserir código malicioso em uma página. |
| CSRF | Ataque que tenta fazer o usuário executar uma ação sem perceber. |
| Autenticação | Processo de verificar quem é o usuário. |
| Autorização | Regra que define o que o usuário pode acessar ou fazer. |
| Sessão | Registro temporário que mantém o usuário logado. |
| Hash de senha | Forma segura de guardar uma senha sem salvar o texto original. |
| Log | Registro de eventos importantes ou erros do sistema. |
| Dado sensível | Informação que não deve ser exposta, como senha, token, documento, dado pessoal ou credencial. |

---

### PROMPTS COMPLETOS (transcritos VERBATIM) — capítulo `codificacao-10.txt`

#### Prompt do passo 5 (bloco "Copiar" — o prompt principal do capítulo)

> Responda sempre em **português do Brasil**.
>
> Você é um(a) especialista em segurança de aplicações web, revisando um sistema antes da publicação.
>
> Sua missão é revisar o projeto inteiro com foco em segurança, boas práticas e riscos que possam afetar usuários, dados, acesso, autenticação, autorização, persistência, arquivos sensíveis e publicação.
>
> Explique os achados em linguagem simples, para um usuário leigo.
>
> Não avance para deploy nesta etapa.
>
> ## 1. Reconstruir o contexto
>
> Leia integralmente, nesta ordem:
>
> - arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
> - `docs/FSD.md`
> - `docs/DESIGN.md`
> - `docs/INSUMOS.md`
> - `docs/PLANO.md`
> - `docs/STATUS.md`
> - `docs/ERROS.md`
>
> Depois, revise todo o código e todos os arquivos relevantes do projeto.
>
> Identifique:
>
> - stack do projeto;
> - arquitetura;
> - ambiente de desenvolvimento;
> - ambiente de produção;
> - estratégia de autenticação, se houver;
> - estratégia de autorização, se houver;
> - banco de dados ou mecanismo de persistência, se houver;
> - integrações externas, se houver;
> - uploads, se houver;
> - arquivos de configuração;
> - rotas, páginas, endpoints ou áreas internas;
> - regras de segurança previstas no FSD;
> - erros já registrados em `docs/ERROS.md`.
>
> Não presuma PHP, MySQL, Laravel, Node.js, Python, Supabase, Firebase, Next.js ou qualquer outra tecnologia se isso não estiver definido no FSD ou no arquivo de contexto.
>
> ## 2. Verificar se a construção foi concluída
>
> Antes da revisão, confira `docs/STATUS.md`.
>
> Se ainda houver fases funcionais pendentes, avise o usuário que a revisão de segurança final deve acontecer apenas depois da conclusão das fases.
>
> Se a maioria do sistema estiver concluída e o usuário quiser mesmo uma revisão parcial, deixe isso claro no relatório.
>
> ## 3. Checklist de segurança
>
> Revise os itens abaixo conforme a stack do projeto.
>
> Não aplique mecanicamente uma regra de uma tecnologia que não faz parte do projeto.
>
> ### Autenticação e senhas
>
> Verifique, quando aplicável:
>
> - senhas não são salvas em texto puro;
> - senhas usam mecanismo seguro de hash da stack;
> - verificação de senha é feita com método seguro;
> - regras mínimas de senha do FSD são respeitadas;
> - login não revela se o e-mail existe ou não, salvo se o FSD permitir;
> - logout encerra corretamente a sessão ou token;
> - recuperação ou troca de senha segue o FSD, se existir.
>
> ### Autorização e controle de acesso
>
> Verifique, quando aplicável:
>
> - usuários acessam apenas o que o FSD permite;
> - perfis, papéis ou permissões são respeitados;
> - URLs, rotas, endpoints ou páginas internas são protegidas;
> - ações administrativas não podem ser executadas por usuários comuns;
> - usuário não consegue acessar dados de outro usuário, conta, empresa ou organização;
> - permissões são validadas no servidor, não apenas na interface.
>
> ### Sessão, tokens e estado de login
>
> Verifique, quando aplicável:
>
> - sessão ou token expira conforme o FSD;
> - rotas internas exigem login;
> - logout remove o estado de autenticação;
> - cookies, tokens ou sessões usam configurações seguras conforme a stack;
> - não há exposição desnecessária de tokens no front-end, URL ou logs.
>
> ### Proteção contra injeção
>
> Verifique, quando aplicável:
>
> - consultas ao banco não concatenam entrada do usuário de forma insegura;
> - ORM, query builder, prepared statements ou mecanismos equivalentes são usados corretamente;
> - filtros, buscas, ordenações e paginações não permitem manipulação indevida;
> - comandos de sistema, se existirem, não recebem entrada insegura.
>
> ### Proteção contra XSS
>
> Verifique, quando aplicável:
>
> - saídas em tela são escapadas ou sanitizadas conforme a stack;
> - campos preenchidos por usuários não são exibidos como HTML perigoso;
> - mensagens, comentários, descrições e nomes não permitem execução de scripts;
> - uso de HTML rico, Markdown ou editor visual tem sanitização adequada.
>
> ### Proteção contra CSRF
>
> Verifique, quando aplicável:
>
> - formulários ou requisições que alteram dados têm proteção contra CSRF;
> - ações sensíveis não podem ser disparadas por simples acesso a uma URL;
> - APIs usam mecanismo de proteção adequado à arquitetura definida.
>
> ### Validação de entradas
>
> Verifique, quando aplicável:
>
> - campos obrigatórios são validados no servidor;
> - e-mails têm formato validado;
> - números respeitam limites;
> - datas são válidas;
> - arquivos enviados respeitam tipo e tamanho permitidos;
> - IDs recebidos pela URL ou formulário são validados;
> - entradas inválidas não quebram o sistema.
>
> ### Arquivos sensíveis e configuração
>
> Verifique:
>
> - arquivos reais de configuração com segredos não estão versionados;
> - `.env`, chaves, tokens, certificados e credenciais estão protegidos;
> - arquivos de exemplo não contêm senhas reais;
> - logs não expõem dados sensíveis;
> - backups e dumps não estão no Git;
> - arquivos internos não ficam acessíveis publicamente;
> - pasta de documentação, prompts e contexto da IA não são tratados como área pública do sistema.
>
> ### Erros e logs
>
> Verifique:
>
> - mensagens para o usuário são simples e genéricas;
> - detalhes técnicos ficam apenas em logs protegidos;
> - stack traces não aparecem para o usuário final;
> - eventos sensíveis são registrados conforme o FSD;
> - logs não armazenam senhas, tokens ou dados excessivos.
>
> ### Uploads e arquivos enviados por usuários
>
> Verifique, quando aplicável:
>
> - tipo de arquivo permitido é validado;
> - tamanho máximo é validado;
> - arquivos não executáveis são tratados com segurança;
> - nomes de arquivos são normalizados;
> - uploads não permitem sobrescrever arquivos críticos;
> - arquivos privados não ficam acessíveis publicamente sem controle.
>
> ### APIs e integrações externas
>
> Verifique, quando aplicável:
>
> - chaves de API não aparecem no código ou no front-end sem necessidade;
> - chamadas externas tratam erros;
> - timeouts ou falhas são tratados;
> - dados recebidos de APIs externas são validados;
> - webhooks, se existirem, têm validação de origem ou assinatura quando aplicável.
>
> ### Interface e exposição de informações
>
> Verifique, quando aplicável:
>
> - menus não mostram ações proibidas para o perfil;
> - mesmo que o menu esconda algo, o servidor também bloqueia o acesso;
> - mensagens de erro não revelam detalhes internos;
> - dados sensíveis não aparecem em telas inadequadas;
> - páginas de teste ou debug não ficam acessíveis ao usuário final.
>
> ## 4. Classificar achados por gravidade
>
> Para cada problema encontrado, classifique a gravidade:
>
> **Crítico** - pode expor dados, permitir invasão, acesso indevido grave ou controle do sistema.
> **Alto** - pode comprometer segurança importante ou permitir ação indevida relevante.
> **Médio** - risco real, mas com impacto ou exploração mais limitado.
> **Baixo** - melhoria recomendada, ajuste preventivo ou boa prática.
>
> Para cada achado, informe:
>
> - título do problema;
> - gravidade;
> - onde foi encontrado;
> - explicação simples;
> - risco prático;
> - correção recomendada;
> - se foi corrigido agora ou se depende do usuário.
>
> ## 5. Corrigir o que for seguro corrigir
>
> Corrija os problemas que puder corrigir com segurança e sem mudar regras de negócio importantes.
>
> Antes de alterar algo que impacte funcionamento, regra de negócio, fluxo de usuário, estrutura de dados ou decisão de arquitetura, pergunte ao usuário.
>
> Ao corrigir:
>
> - preserve a stack definida no FSD;
> - preserve o design definido no DESIGN.md;
> - não crie funcionalidades fora do escopo;
> - não quebre fases já concluídas;
> - teste novamente depois de corrigir;
> - registre a correção em `docs/ERROS.md`, quando fizer sentido.
>
> ## 6. Atualizar arquivos vivos
>
> Atualize `docs/STATUS.md` registrando:
>
> - revisão de segurança executada;
> - principais achados;
> - correções aplicadas;
> - pendências de segurança, se existirem;
> - próximos passos.
>
> Se encontrou ou corrigiu problemas relevantes, registre em `docs/ERROS.md`:
>
> ## <data> - <título curto do problema>
>
> - Sintoma:
> - Causa:
> - Solução aplicada:
> - Como evitar no futuro:
>
> ## 7. Versionar as correções
>
> Depois das correções e testes, verifique o Git:
>
> `git status`
>
> Confirme que nenhum segredo será versionado.
>
> Depois faça commit com uma mensagem clara, por exemplo:
>
> `git add .`
> `git commit -m "Revisão de segurança e boas práticas"`
>
> Se não puder executar o commit, entregue os comandos para o usuário copiar.
>
> Lembre o usuário de fazer:
>
> `git push`
>
> ## 8. Entregar ao usuário
>
> Ao final, entregue:
>
> 1. Resumo geral da revisão.
> 2. Lista dos pontos que estavam corretos.
> 3. Lista dos achados por gravidade.
> 4. Correções aplicadas.
> 5. Pendências que dependem do usuário, se houver.
> 6. Testes executados.
> 7. Testes manuais de segurança para o usuário fazer.
> 8. Confirmação de atualização de `docs/STATUS.md`.
> 9. Confirmação de atualização de `docs/ERROS.md`, se aplicável.
> 10. Confirmação de commit ou comandos para o usuário executar.
> 11. Próximo passo.
>
> Use esta frase final:
>
> Revisão de segurança concluída. Próximo passo: chat novo + prompt do passo 6.
>
> Lembre-se: nesta etapa, o objetivo é revisar e corrigir segurança. Não faça deploy.

#### Exemplo: Formato de um bom achado de segurança ("O que a IA deve entregar" — bloco "Copiar")

> Gravidade: Alto
>
> Problema:
> Usuários comuns conseguem acessar a rota administrativa digitando a URL diretamente.
>
> Risco:
> Mesmo que o menu esconda a opção, alguém poderia acessar a área de administração manualmente.
>
> Correção aplicada:
> Foi adicionada validação de permissão no servidor antes de carregar a página.
>
> Como testar:
> Entre como usuário comum e tente acessar a URL administrativa. O sistema deve negar acesso.

#### Lista (bloco "Copiar"): Arquivos sensíveis — exemplos

> .env
> configuração real do banco
> chaves privadas
> tokens
> certificados
> logs
> backups
> dumps de banco

#### Exemplos de mensagens de erro (blocos "Copiar")

Exemplo ruim:

> Erro SQL na tabela users, linha 42, arquivo /app/models/User.php

Exemplo melhor para o usuário:

> Não foi possível concluir a operação. Tente novamente.

#### Prompt: Para pedir testes de segurança mais claros (bloco "Copiar" — usar "se a IA entregar testes vagos")

> Reescreva os testes de segurança em linguagem simples para uma pessoa leiga.
>
> Para cada teste, informe:
> 1. qual usuário devo usar;
> 2. qual URL, tela ou ação devo acessar;
> 3. o que devo tentar fazer;
> 4. qual resultado esperado;
> 5. o que indicaria falha.

#### Prompt: Se a IA quiser fazer deploy (bloco "Copiar")

> Pare.
>
> Nesta etapa, o objetivo é apenas revisar segurança, corrigir problemas, testar e registrar as alterações.
>
> Não faça deploy agora.
> A publicação será feita depois, fora desta metodologia, na hospedagem que você escolher.

#### Checklist: Checklist da revisão de segurança (bloco "Copiar" — usar "ao final")

> [ ] A IA leu o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`).
> [ ] A IA leu FSD.md, DESIGN.md, PLANO.md, STATUS.md e ERROS.md.
> [ ] A IA revisou o código do projeto.
> [ ] A IA classificou achados por gravidade.
> [ ] Problemas corrigíveis foram corrigidos.
> [ ] Decisões sensíveis foram perguntadas antes.
> [ ] Testes foram executados.
> [ ] Testes manuais foram explicados.
> [ ] STATUS.md foi atualizado.
> [ ] ERROS.md foi atualizado, se houve problema.
> [ ] Commit foi feito.
> [ ] A IA lembrou de fazer git push.

---

# 3. Itens acionáveis

### Documentos de saída / arquivos vivos a manter atualizados
- `docs/FSD.md` — fonte da stack, regras e permissões.
- `docs/DESIGN.md` — design a respeitar.
- `docs/PLANO.md` — fases do projeto.
- `docs/STATUS.md` — atualizar após cada correção e após a revisão de segurança (revisão executada, achados, correções, pendências, próximos passos).
- `docs/ERROS.md` — registrar erros/soluções com o formato `## <data> - <título curto>; Sintoma; Causa; Solução aplicada; Como evitar no futuro`.
- `docs/INSUMOS.md` — lido na reconstrução de contexto do passo 5.
- Arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity) — contexto do agente, lido no passo 5.

### Fluxo de trabalho executável (resumo)
1. Para cada fase: executar prompt do passo 4 → testar → usar checklist de teste da fase → relatar erros com o modelo de relato → corrigir sem avançar → encerrar com o prompt de encerramento.
2. Depois de todas as fases: conferir pré-condições (PLANO.md concluído, STATUS.md atualizado, testes manuais feitos, erros tratados, commits feitos, ambiente local funcionando).
3. Abrir **chat novo com raciocínio** e executar o **Prompt do passo 5**.
4. Fazer testes manuais de segurança (7 itens).
5. Se a IA quiser deploy, usar o "Prompt se a IA quiser fazer deploy".
6. Ao final: frase padrão "Revisão de segurança concluída. Próximo passo: chat novo + prompt do passo 6." **Não fazer deploy.**

### Comandos
- `git status` — antes do commit, confirmar que nenhum segredo será versionado.
- `git add .`
- `git commit -m "Revisão de segurança e boas práticas"` (mensagem de exemplo).
- `git push` — lembrado pela IA / feito pelo usuário.

### Prompts prontos que um desenvolvedor precisa usar (lista completa)
Capítulo `codificacao-9.txt`:
1. Modelo de relato de erro.
2. Exemplo de relato de erro de regra de negócio.
3. Prompt para teste difícil para o usuário (transformar em passo a passo leigo).
4. Prompt para pedir testes melhores.
5. Prompt para validar a fase contra o FSD.
6. Prompt para encerrar a fase depois dos testes.
(+ Checklist de teste da fase — 14 itens.)

Capítulo `codificacao-10.txt`:
1. Prompt do passo 5 (revisão de segurança completa).
2. Prompt para pedir testes de segurança mais claros.
3. Prompt se a IA quiser fazer deploy.
(+ Checklist da revisão de segurança — 12 itens.)

### Conteúdo ausente neste grupo
- Comandos de teste automatizado específicos: **não presentes** — a metodologia diz explicitamente que "o comando exato depende da stack definida no docs/FSD.md" e que o usuário não precisa decorar comandos (a IA deve informar).
- Exemplos de código ou implementação concreta de correções de segurança: **não presentes**.
- Instruções do passo 6 (documentação): **não presentes** — apenas mencionado como próximo passo ("chat novo + prompt do passo 6").

