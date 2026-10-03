# Referência APES IA5K — Codificação: estrutura, chat de ajuda, insumos e preparação

# Grupo 6 — Início da Codificação: Introdução, Ferramentas (Chat de ajuda) e Preparação do Trabalho

Arquivos analisados:

---

## 1. Visão geral do grupo

Este grupo abre a **fase de codificação** do método. Na fase anterior (análise), o projeto foi transformado em documentos de planejamento; agora o objetivo é transformar esses documentos em um sistema web funcionando.

Os três capítulos são **conceituais e preparatórios** — eles NÃO contêm os prompts numerados de execução (prompt 01, 02, 03, etc.). Eles estabelecem:
- a mentalidade da codificação com IA (a IA constrói, o humano conduz/valida/decide);
- o papel dos documentos de entrada (`docs/FSD.md` e `docs/DESIGN.md`);
- os arquivos vivos de acompanhamento (`docs/STATUS.md` e `docs/ERROS.md`);
- as ferramentas de IA codificadora (Antigravity, Codex, Claude Code) e o arquivo de contexto;
- o princípio de "um prompt por etapa" / trabalho por fases.

A sequência geral do fluxo de codificação (o "esqueleto" que os próximos capítulos preenchem) é:
1. Validar os insumos do projeto.
2. Planejar e preparar a estrutura.
3. Inicializar Git e GitHub.
4. Construir o sistema em fases (o prompt 04 é reutilizado uma vez por fase).
5. Fazer revisão de segurança.
6. Criar documentação final.

O fluxo termina na documentação; depois dela, o usuário publica o sistema na hospedagem que escolher (fora da metodologia).

Posição no fluxo: este grupo vem logo após a fase de análise (que gerou FSD.md e DESIGN.md) e antes dos capítulos que apresentam os prompts numerados de cada etapa.

---

## 2. Capítulos

### 2.1 `codificacao-1.txt` — "Introdução"

**Objetivo do capítulo:** explicar a transição da fase de análise para a fase de codificação, definir o papel do humano (conduzir, validar, decidir) e da IA codificadora (escrever, organizar, testar), apresentar os dois documentos de entrada e os dois arquivos vivos do projeto, e listar o que é preciso ter antes de continuar.

#### Passos na ordem (conteúdo do capítulo, na ordem apresentada)

1. Contexto da fase: a IA passa a criar arquivos, organizar pastas, preparar banco de dados, montar telas, testar funcionalidades e registrar progresso.
2. Explicação de que não é preciso saber programar; o foco é conduzir a IA.
3. Revisão do que já foi feito na fase de análise (documentos em `docs/` dentro da pasta do projeto).
4. Apresentação dos dois documentos principais de entrada: `docs/FSD.md` e `docs/DESIGN.md`, com o papel de cada um.
5. Demonstração da diferença entre pedir "crie um sistema" sem documentos versus pedir com documentos.
6. O que muda na nova fase: tarefas que a IA codificadora pode executar (ler arquivos, criar pastas, escrever código, preparar configs, criar scripts de banco, rodar comandos, corrigir erros, registrar andamento, explicar como testar no navegador).
7. Ferramentas citadas: Antigravity, Codex ou Claude Code.
8. Explicação do modelo de prompts em sequência (um prompt por função) e por que evitar pedir tudo de uma vez.
9. Regra de ouro: a IA não deve improvisar — deve seguir FSD.md e DESIGN.md; se algo não estiver definido, perguntar; se estiver fora do escopo, não criar.
10. Papel do FSD.md na codificação (perguntas que ele responde) e papel do DESIGN.md (consistência visual).
11. O fluxo da metodologia (6 etapas, listadas acima) e a nota de que o prompt 04 será usado mais de uma vez (uma fase por execução).
12. Justificativa do uso de chat novo em cada etapa (conversas longas confundem a IA; o projeto passa a depender dos arquivos, não da memória da conversa).
13. Apresentação dos arquivos vivos `docs/STATUS.md` e `docs/ERROS.md`, com exemplo de registro de erro.
14. Checklist "O que você precisa ter antes de continuar".
15. Atenção sobre a stack: fluxo padrão = PHP + MySQL local (XAMPP) + publicação em hospedagem PHP/MySQL; outras stacks exigem adaptar os prompts.

#### Prompts / blocos "Copiar" do capítulo (VERBATIM)

**Bloco 1 — Documentos de entrada (copiar da metodologia):**
```
docs/FSD.md
docs/DESIGN.md
```

**Bloco 2 — Pedido sem documentos (contraexemplo, o que NÃO fazer):**
```
Crie um sistema de agendamento para mim.
```

**Bloco 3 — Pedido com documentos (o jeito certo):**
```
Leia docs/FSD.md e docs/DESIGN.md.

Construa apenas a próxima fase pendente do projeto, seguindo exatamente a especificação, sem inventar funcionalidades fora do escopo.
```

**Bloco 4 — Arquivos vivos do projeto:**
```
docs/STATUS.md
docs/ERROS.md
```

**Bloco 5 — Exemplo de registro de erro no ERROS.md (template VERBATIM):**
```
## 2026-06-22 - Erro ao conectar no banco local

- Sintoma:
O sistema exibiu erro de conexão ao abrir a página inicial.

- Causa:
O MySQL do XAMPP estava desligado.

- Solução aplicada:
O MySQL foi iniciado no painel do XAMPP e a conexão voltou a funcionar.

- Como evitar no futuro:
Antes de testar o sistema localmente, verificar se Apache e MySQL estão ligados.
```

#### Modelos / estruturas de documentos citados

- `docs/FSD.md` — "manual de construção do sistema": regras, telas, funcionalidades, permissões, dados, critérios de aceitação e decisões técnicas.
- `docs/DESIGN.md` — "referência visual": cores, estilos, componentes, referências visuais e cuidados com UX.
- `docs/STATUS.md` — arquivo vivo: mostra o que já foi feito, o que está pendente e qual é a próxima fase.
- `docs/ERROS.md` — arquivo vivo: registra problemas encontrados e como foram resolvidos.
- Estrutura de exemplo de projeto no XAMPP: `C:\xampp\htdocs\meu-sistema` contendo `docs\FSD.md` e `docs\DESIGN.md`.

#### Regras, avisos, boas práticas e armadilhas

- **Regra central:** durante a codificação, a IA deve seguir o FSD.md e o DESIGN.md. Se algo não estiver definido, ela deve perguntar. Se estiver fora do escopo, ela não deve criar.
- **Armadilha:** IA que improvisa — exemplo: pediu-se sistema simples de controle de solicitações (login, cadastro de solicitações, listagem, alteração de status) e a IA adiciona chat interno, envio de e-mail, gráfico avançado e integração com WhatsApp. Cada funcionalidade nova aumenta complexidade, chance de erro, tempo de teste, pontos de segurança e dificuldade de manutenção. Resultado perigoso: "o sistema que parece impressionante, mas não corresponde ao que foi planejado".
- **Sem FSD:** a IA pode criar cadastro incompleto (faltando CPF, status, data de nascimento, observações internas), login sem perfis (administrador vs. usuário comum) e estrutura de pastas genérica.
- **Sem DESIGN:** cada tela sai de um jeito (login de um visual, painel de outro), sensação ruim para o usuário final mesmo com funcionalidade correta. Objetivo não é "bonito por acaso", é coerência.
- **Armadilha "pedir tudo de uma vez":** a IA pode se perder, esquecer regras, misturar etapas, deixar testes para trás ou criar solução grande demais para revisar.
- **Prática-chave:** "dividir para controlar" — fase termina, você testa; se funcionar, segue; se falhar, pede correção; depois registra o progresso e continua.
- **Por que chat novo em cada etapa:** conversas longas confundem a IA; o projeto passa a depender dos arquivos do projeto, não da memória da conversa ("é como trocar de professor, mas entregar o caderno completo antes da próxima aula").
- **Valor do ERROS.md:** quando o projeto cresce, pequenos erros se repetem; ter histórico economiza tempo e evita repetir tentativas ruins.
- **Atenção sobre stack:** o fluxo foi preparado para PHP + MySQL no XAMPP local + publicação em hospedagem PHP/MySQL; vários prompts mencionam esse ambiente. Trocar a stack (Laravel, Node.js, Python, Supabase, Firebase, outra hospedagem) exige adaptar comandos, estrutura de pastas, forma de rodar localmente, dependências, regras de deploy e cuidados de segurança — não basta trocar o nome da tecnologia numa frase. Regra guardada: "O método é reaproveitável. A tecnologia precisa ser ajustada com cuidado."

#### Checklist mencionado — "O que você precisa ter antes de continuar"

- [ ] Uma pasta para o projeto no computador. Se usar XAMPP, dentro de `C:\xampp\htdocs`. Exemplo: `C:\xampp\htdocs\meu-sistema`
- [ ] O arquivo `docs/FSD.md`. Exemplo: `C:\xampp\htdocs\meu-sistema\docs\FSD.md`
- [ ] O arquivo `docs/DESIGN.md`. Exemplo: `C:\xampp\htdocs\meu-sistema\docs\DESIGN.md`
- [ ] As imagens ou logos do projeto, se existirem
- [ ] Uma ferramenta escolhida: Antigravity, Codex ou Claude Code
- [ ] XAMPP instalado, se seguindo o fluxo PHP + MySQL local
- [ ] Git instalado
- [ ] Uma conta no GitHub

#### Vocabulário (tabela da metodologia: Termo / Explicação simples)

| Termo | Explicação simples |
|---|---|
| Codificação | Processo de transformar uma ideia ou especificação em arquivos de sistema. |
| Sistema web | Sistema acessado pelo navegador, como uma área administrativa, painel, cadastro ou ferramenta online. |
| FSD | Documento que descreve como o sistema deve funcionar e como deve ser construído. |
| DESIGN.md | Documento que orienta a aparência visual do sistema. |
| IA codificadora | Ferramenta de IA capaz de ler arquivos, criar código, rodar comandos e ajudar a testar o projeto. |
| Prompt | Pedido escrito que você envia para a IA. |
| Escopo | Limite do que faz parte do projeto. O que está fora do escopo não deve ser criado. |
| Fase | Parte menor da construção do sistema, feita separadamente para facilitar teste e revisão. |
| Deploy | Publicação do sistema em um servidor para que ele possa ser usado de verdade. |

#### Erros comuns e como resolver

- IA inventa funcionalidades fora do escopo → corrigir: a regra é seguir FSD.md e DESIGN.md; o que não estiver definido, a IA deve perguntar; o que estiver fora do escopo, não deve criar.
- IA escolhe caminhos técnicos sem perguntar / improvisa estrutura → corrigir: o FSD.md deve responder (quais telas, quais dados, quais usuários por área, quais regras, qual banco, como organizar, quais critérios de pronto); a IA deve consultá-lo antes de construir.

---

### 2.2 `codificacao-2.txt` — "As ferramentas que podem codificar com você"

**Objetivo do capítulo:** apresentar as três IAs codificadoras (Antigravity, Codex, Claude Code), orientar a escolha de ferramenta, explicar a necessidade de abrir a ferramenta dentro da pasta do projeto, definir o arquivo de contexto por ferramenta (CLAUDE.md / AGENTS.md), os cuidados ao aprovar comandos e qual modelo (de IA) usar em cada etapa.

#### Passos na ordem (conteúdo do capítulo, na ordem apresentada)

1. Distinção entre chat comum (responde, explica, gera trechos) e IA codificadora (trabalha dentro da pasta do projeto: lê arquivos, cria arquivos, altera código, executa comandos, identifica erros, sugere testes) — "pense nela como uma pessoa desenvolvedora trabalhando ao seu lado".
2. A IA precisa de instruções claras: não deve adivinhar o sistema, deve seguir os documentos da fase de análise.
3. Como escolher a ferramenta: recomendação = comece pela que você já paga ou pela que tem mais limite de uso disponível; é possível combinar ferramentas (ex.: ChatGPT para análise, Antigravity para codificação). Ponto principal: escolher a ferramenta antes de começar e ajustar os prompts para ela, para evitar duplicidade de arquivos e confusão.
4. O que as três têm em comum: devem ser abertas dentro da pasta do projeto (senão a IA não encontra `docs/FSD.md`, `docs/DESIGN.md`, os arquivos de código ou a estrutura criada).
5. Como abrir a pasta do projeto em cada ferramenta (Antigravity, Claude Code, Codex) — seções citadas na metodologia, sem instruções detalhadas de passos no texto extraído.
6. Estrutura inicial da pasta do projeto (só `docs/` com FSD.md e DESIGN.md).
7. Diferença mais importante entre as ferramentas: o **arquivo de contexto**.
8. Definição de arquivo de contexto + conteúdo-exemplo (o que ele "diz").
9. Regra de mapeamento ferramenta → arquivo de contexto (tabela) e o arquivo correspondente a cada ferramenta.
10. Antes de usar os prompts: escolher a ferramenta; o arquivo de contexto é `CLAUDE.md` no Claude Code e `AGENTS.md` no Codex e no Antigravity.
11. Cuidados ao aprovar comandos (regra simples + exemplos seguros e exemplo perigoso + pergunta de segurança).
12. Qual modelo usar: etapas de mais pensamento (planejamento, revisão de segurança, documentação final) → modelo mais forte; construção de fases simples → modelo equilibrado/mais rápido; exceção: fase complexa → voltar ao modelo mais forte.

#### Prompts / blocos "Copiar" do capítulo (VERBATIM)

**Bloco 1 — Exemplo de pasta local no XAMPP:**
```
C:\xampp\htdocs\meu-sistema
```

**Bloco 2 — Outro exemplo de pasta:**
```
C:\xampp\htdocs\sistema-agendamentos
```

**Bloco 3 — Estrutura da pasta do projeto no início do processo:**
```
docs/
 FSD.md
 DESIGN.md
```

**Bloco 4 — Conteúdo-exemplo de um arquivo de contexto (o que a "placa na entrada do projeto" diz):**
```
Este projeto usa estas tecnologias.
Responda em português do Brasil.
Siga estas regras de segurança.
Leia estes documentos antes de alterar qualquer coisa.
Atualize o STATUS.md ao terminar.
Registre erros no ERROS.md.
```

**Bloco 5 — Pergunta a se fazer antes de aprovar um comando:**
```
Este comando combina com a etapa atual?
```

**Bloco 6 — Exemplo de comando seguro em contexto:**
```
git status
```
"Esse comando apenas mostra o estado do Git."

**Bloco 7 — Exemplo de comando seguro em contexto:**
```
php -v
```
"Esse comando mostra a versão do PHP instalada."

**Bloco 8 — Exemplo de comandos seguros em contexto (registram alterações no Git):**
```
git add .
git commit -m "Fase 1: infraestrutura"
```

**Bloco 9 — Comando que exige mais cuidado (NÃO aprovar sem entender):**
```
rm -rf .
```
"Esse comando pode apagar arquivos da pasta atual. Um iniciante não deve aprovar algo assim sem entender exatamente o motivo."

**Bloco 10 — Pergunta de segurança quando estiver em dúvida:**
```
Explique em linguagem simples o que este comando faz antes de eu aprovar.
Ele pode apagar arquivos ou alterar algo importante?
```

#### Modelos / estruturas de documentos citados

- Pasta do projeto (XAMPP): `C:\xampp\htdocs\meu-sistema`, `C:\xampp\htdocs\sistema-agendamentos`.
- Estrutura inicial do projeto: `docs/` contendo `FSD.md` e `DESIGN.md` (a estrutura final terá mais arquivos).
- Arquivos de contexto: `CLAUDE.md` (Claude Code), `AGENTS.md` (Codex e Antigravity). Antigravity também pode usar `GEMINI.md`, mas a metodologia usa `AGENTS.md` nele.
- Arquivos vivos citados: `STATUS.md` e `ERROS.md` (atualizados conforme o conteúdo-exemplo do arquivo de contexto).

#### Regras, avisos, boas práticas e armadilhas

- Antes de colar qualquer prompt, **confirme que a ferramenta está aberta na pasta certa**.
- **Evitar duplicidade:** criar apenas o arquivo de contexto necessário para a ferramenta escolhida — não criar todos os arquivos de contexto possíveis.
- **Regra de mapeamento (tabela da metodologia):**

| Ferramenta escolhida | Arquivo de contexto usado no treinamento |
|---|---|
| Claude Code | CLAUDE.md |
| Codex | AGENTS.md |
| Antigravity | AGENTS.md |

- Os prompts da metodologia citam o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).
- **Cuidados ao aprovar comandos:** a IA pode pedir permissão para listar arquivos, criar pastas, instalar bibliotecas, testar conexão com banco, rodar migrations, verificar Git, fazer commit. Regra simples: antes de aprovar, perguntar "Este comando combina com a etapa atual?" Exemplos seguros em contexto: `git status`, `php -v`, `git add .` + `git commit -m "..."`. Exemplo perigoso: `rm -rf .`. Em dúvida, pedir explicação com a pergunta do Bloco 10.
- **Qual modelo usar:** planejamento (02 – Planejar e preparar), revisão de segurança (05 – Revisão de segurança) e documentação final (06 – Documentação final) → modelo mais forte (risco de decisão ruim é maior). Construção de fases bem descritas (04 – Construir fase) → modelo equilibrado ou mais rápido. Exceção: fase complexa, com muitas regras, ou IA começando a se perder → voltar ao modelo mais forte.

#### Erros comuns e como resolver

- IA não encontra os arquivos do projeto → corrigir: abrir a ferramenta dentro da pasta do projeto.
- Duplicidade de arquivos de contexto / confusão → corrigir: escolher UMA ferramenta e criar apenas o arquivo de contexto dela.
- Aprovar comando destrutivo por engano → corrigir: aplicar a regra "Este comando combina com a etapa atual?" e pedir explicação em linguagem simples antes de aprovar (`rm -rf .` como alerta).

#### Checklist / passos de decisão mencionados

- Escolher a ferramenta de codificação antes de rodar os prompts (por custo/limite disponível ou combinação de ferramentas).
- Verificar se a ferramenta está aberta na pasta do projeto.
- Conferir o mapeamento ferramenta → arquivo de contexto (CLAUDE.md vs. AGENTS.md).

---

### 2.3 `codificacao-3.txt` — "O fluxo: um prompt por etapa"

**Objetivo do capítulo:** explicar o princípio central do método — dividir a codificação em uma sequência de prompts menores, cada um com função clara —, apresentar a ordem do fluxo e alertar sobre o perigo de pular etapas.

#### Passos na ordem (conteúdo do capítulo, na ordem apresentada)

1. Contraste: NÃO usar um único prompt gigante para construir o sistema inteiro (risco: a IA esquece regra, pula teste, mistura decisões, cria fora do escopo).
2. Analogia da obra: conferir a planta → preparar o terreno → organizar o backup → construir → revisar segurança → documentar. Analogia da receita de bolo (existe ordem porque uma etapa depende da outra).
3. Contraexemplo: pedido de "sistema completo" de uma vez gera resultado difícil de controlar (lista de dúvidas: seguiu a especificação? estrutura correta? banco certo? design respeitado? seguro? como testo? onde parou? o que falta?).
4. Cada prompt responde a uma pergunta específica (mapeamento pergunta → etapa).
5. Como o fluxo funciona: ordem planejada de instruções; a IA valida documentos antes de codificar, prepara estrutura antes de construir módulos, revisa segurança antes de publicar, documenta para facilitar mudanças futuras.
6. Apresentação da ordem do fluxo (7 etapas).
7. Aviso sobre o perigo de pular etapas.

#### Prompts / blocos "Copiar" do capítulo (VERBATIM)

**Bloco 1 — Pedido contraproducente (o que NÃO fazer — pedir tudo de uma vez):**
```
Crie um sistema completo de cadastro de clientes com login, painel administrativo, banco de dados, relatórios e publicação.
```

(Nota: este é o único bloco "Copiar" deste capítulo; é um contraexemplo de como NÃO pedir. Os prompts numerados das etapas são estudados nos próximos capítulos — não presentes aqui.)

#### Modelos / estruturas de documentos citados

- Não há modelos de documentos novos neste capítulo (remete aos conceitos já vistos). Não presente neste capítulo.

#### Regras, avisos, boas práticas e armadilhas

- **Um prompt por etapa:** cada prompt do fluxo resolve uma parte do processo; não se escreve um pedido novo do zero a cada vez.
- **Cada prompt responde a uma pergunta (tabela implícita):**

| Pergunta | Etapa correspondente |
|---|---|
| A especificação está pronta? | Validar insumos |
| O projeto está preparado? | Planejar e preparar |
| O Git está configurado? | Inicializar Git |
| Qual fase será construída agora? | Construir cada fase |
| A segurança foi revisada? | Revisão de segurança |
| A documentação ficou pronta? | Documentação final |

- **A ordem do fluxo (sequência oficial do treinamento):**
  1. Validar insumos;
  2. Planejar e preparar;
  3. Inicializar Git;
  4. Construir cada fase;
  5. Revisão de segurança;
  6. Documentação final.

- **O perigo de pular etapas (alertas textuais):**
  - Pular a validação → pode descobrir tarde demais que o FSD está incompleto.
  - Pular o planejamento → a IA pode construir sem ordem clara.
  - Pular o Git → fica sem histórico e sem backup.
  - Pular a revisão de segurança → pode publicar um sistema vulnerável.
  - Pular a documentação final → fica difícil fazer alterações depois.
- O fluxo existe para reduzir esses riscos; "um fluxo organizado evita improviso".

#### Vocabulário (tabela da metodologia: Termo / Explicação simples)

| Termo | Explicação simples |
|---|---|
| Prompt | Instrução escrita que você envia para a IA. |
| Fluxo | Sequência organizada de etapas para realizar um trabalho. |
| Etapa | Parte do processo com começo, meio e fim. |
| Fase | Parte da construção do sistema, como banco de dados, login ou um módulo específico. |
| Chat novo | Nova conversa aberta com a IA para executar uma etapa específica. |
| Contexto | Informações que a IA usa para entender o projeto. |
| Arquivo de contexto | Arquivo que guarda regras e orientações para a IA trabalhar no projeto. |
| Arquivo vivo | Arquivo atualizado ao longo do projeto, como STATUS.md e ERROS.md. |

#### Erros comuns e como resolver

- Pular etapas ("pode dar vontade de pular direto para o prompt 04") → evite; cada etapa remove um risco específico (FSD incompleto, construção sem ordem, falta de histórico/backup, vulnerabilidades publicadas, dificuldade de manutenção).
- Pedir o sistema inteiro de uma vez → o resultado é difícil de controlar; usar a sequência de prompts menores.

---

## 3. Itens acionáveis (documentos, pastas, comandos e prompts a executar)

**Documentos / arquivos a existir na pasta do projeto (ex.: `C:\xampp\htdocs\meu-sistema`):**
- [ ] `docs/FSD.md` — especificação funcional (entrada da codificação).
- [ ] `docs/DESIGN.md` — guia visual (entrada da codificação).
- [ ] `docs/STATUS.md` — arquivo vivo de andamento (criado/atualizado ao longo do fluxo).
- [ ] `docs/ERROS.md` — arquivo vivo de erros e soluções (criado/atualizado ao longo do fluxo).
- [ ] Imagens/logos do projeto, se existirem.
- [ ] Arquivo de contexto na raiz do projeto: `AGENTS.md` (Codex/Antigravity) ou `CLAUDE.md` (Claude Code) — com conteúdo orientando: tecnologias do projeto, responder em português do Brasil, regras de segurança, ler documentos antes de alterar, atualizar STATUS.md ao terminar, registrar erros no ERROS.md.

**Pré-requisitos de ambiente:**
- [ ] Pasta do projeto dentro de `C:\xampp\htdocs` (se fluxo XAMPP).
- [ ] XAMPP instalado (fluxo PHP + MySQL local).
- [ ] Git instalado.
- [ ] Conta no GitHub.

**Comandos citados no grupo (para reconhecer ao aprovar):**
- `git status` — seguro (mostra estado do Git).
- `php -v` — seguro (mostra versão do PHP).
- `git add .` e `git commit -m "Fase 1: infraestrutura"` — seguros (registram alterações).
- `rm -rf .` — perigoso (pode apagar arquivos da pasta atual); não aprovar sem entender.

**Prompts prontos deste grupo (para copiar e colar):**
1. Prompt de abertura de etapa com documentos (Bloco 3 do capítulo 2.1): "Leia docs/FSD.md e docs/DESIGN.md. Construa apenas a próxima fase pendente do projeto, seguindo exatamente a especificação, sem inventar funcionalidades fora do escopo."
2. Template de registro de erro no ERROS.md (Bloco 5 do capítulo 2.1): cabeçalho `## DATA - Título do erro` + seções `- Sintoma:`, `- Causa:`, `- Solução aplicada:`, `- Como evitar no futuro:`.
3. Conteúdo base do arquivo de contexto (Bloco 4 do capítulo 2.2): "Este projeto usa estas tecnologias. / Responda em português do Brasil. / Siga estas regras de segurança. / Leia estes documentos antes de alterar qualquer coisa. / Atualize o STATUS.md ao terminar. / Registre erros no ERROS.md."
4. Pergunta de triagem de comandos (Bloco 5 do capítulo 2.2): "Este comando combina com a etapa atual?"
5. Pergunta de segurança antes de aprovar comando duvidoso (Bloco 10 do capítulo 2.2): "Explique em linguagem simples o que este comando faz antes de eu aprovar. Ele pode apagar arquivos ou alterar algo importante?"

**Próximo passo do fluxo (não presente nestes capítulos):** os prompts numerados das etapas (prompts 01–07, incluindo o reutilizável prompt 04 para cada fase) são estudados nos capítulos seguintes da metodologia.

---

## Avisos sobre conteúdo ausente

- **Prompts numerados (01–07) NÃO estão neste grupo.** Os três capítulos são introdutórios; a metodologia afirma que cada etapa "tem um prompt próprio" e que serão estudados nos próximos capítulos. Este grupo só contém o prompt de abertura genérico (cap. 2.1, Bloco 3) e contraexemplos.
- **Não há "Prompt do passo X" numerados** com títulos do tipo "Prompt do passo 1" etc. Os blocos "Copiar" deste grupo são principalmente comandos de terminal, caminhos de pasta, estruturas de arquivo e contraexemplos, além de dois prompts utilizáveis (item 3 acima).
- O capítulo 2.2 contém as seções "Como abrir a pasta do projeto em cada ferramenta" (Antigravity, Claude Code, Codex), mas o texto extraído não traz o passo a passo interno dessas seções — apenas os títulos.
- Não há checklists formais numerados, apenas o checklist de pré-requisitos no capítulo 2.1 e regras de decisão nos capítulos 2.2 e 2.3 (reproduzidos acima).

# APES IA5K — Fase de Codificação (Etapa de Entrada)

Extração de metodologia dos capítulos:
- `codificacao-4.txt` — **Passo 0: Chat de ajuda da fase de codificação** (Prompt inicial do chat de ajuda)
- `codificacao-5.txt` — **Passo 1: Validando insumos** (Prompt do passo 1)
- `codificacao-6.txt` — **Passo 2: Preparação da estrutura inicial** (Prompt do passo 2)

> **AVISO DE COBERTURA:** A tarefa original previa um "Passo 3 — Git e GitHub". **Nenhum dos três arquivos contém esse conteúdo.** `codificacao-6.txt` cobre o Passo 2 (Preparação da estrutura inicial), e o conteúdo de Git/GitHub (configurar repositório, commit inicial, push, etc.) **não está presente nestes capítulos**. Nada sobre Git/GitHub além de menções avulsas (termos "commit", "git status", "enviar segredos ao GitHub", "enviar segredos ao Git") aparece no material.

---

## 1. Visão geral do grupo

Estes três capítulos formam a **porta de entrada da fase de codificação** do fluxo "APES IA5K". Eles antecedem a construção de qualquer funcionalidade.

A sequência lógica é:

1. **Passo 0 (codificacao-4.txt):** criar um **chat de ajuda separado**, com prompt próprio, para tirar dúvidas técnicas durante toda a fase — protegendo os chats principais de execução.
2. **Passo 1 (codificacao-5.txt):** **validar os insumos** — a IA lê `docs/FSD.md` e `docs/DESIGN.md`, revisa a especificação, ajusta inconsistências com aprovação do usuário, inventaria todos os arquivos da pasta `docs/` e gera `docs/INSUMOS.md`. **Nenhum código é escrito.**
3. **Passo 2 (codificacao-6.txt):** **preparar o terreno** — a IA lê os documentos, cria `docs/PLANO.md` (plano de fases), arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`), `docs/STATUS.md` e `docs/ERROS.md` (arquivos vivos), monta a estrutura base do projeto e movimenta assets apontados no inventário. **Ainda sem funcionalidades.**

Princípio transversal do grupo: **um chat novo por passo, um prompt por passo, sem misturar papéis**. O chat de ajuda explica; os chats de fluxo executam. A validação acontece antes de qualquer código; o plano e a estrutura vêm antes de qualquer tela.

---

## 2. Capítulo: codificacao-4.txt — Passo 0: Chat de ajuda da fase de codificação

### 2.1 Objetivo do capítulo

Criar um chat separado, exclusivo para tirar dúvidas técnicas durante a fase de codificação. A IA que atua nesse chat deve **explicar, nunca executar**: não altera arquivos, não decide o projeto e não roda o fluxo oficial. O objetivo é separar aprendizado de execução para evitar que uma dúvida vire decisão sem querer e proteger a memória de contexto dos chats principais.

### 2.2 Passos EXATOS na ordem

1. Antes de rodar os prompts da fase de codificação, **criar um chat separado** apenas para dúvidas.
2. Colar o **Prompt inicial do chat de ajuda** (transcrito na íntegra abaixo).
3. Usar esse chat sempre que houver dúvida sobre conceito, termo, comando, erro, mensagem ou decisão já documentada.
4. Usar o chat correto de cada etapa quando for **executar** o fluxo (validar, preparar, construir, revisar, documentar).
5. Quando uma explicação gerar uma **decisão importante**, copiar essa decisão para o chat correto da etapa.
6. Usar modelo sem raciocínio avançado por padrão; modelo mais forte apenas se a dúvida for complexa.

### 2.3 Por que o chat de ajuda existe (regras de contexto)

- Cada chat acumula **contexto** (o conjunto de informações que a IA usa para entender a conversa). Misturar dúvidas com construção confunde a IA — ela pode interpretar uma pergunta simples como decisão do projeto.
- **Exemplo do problema:** no chat do passo de autenticação, perguntar "O que é autenticação com dois fatores?" pode fazer a IA entender que você quer adicionar o recurso ao sistema, mesmo sem estar no `docs/FSD.md`.
- O chat de ajuda funciona como "sala de estudo ao lado da obra": aprende ali, decide e executa nos chats corretos.

### 2.4 Diferença em relação à fase de análise

- Na fase de análise o chat de dúvidas era mais aberto (sistema ainda em descoberta).
- Na fase de codificação o projeto já tem documentos oficiais — `docs/FSD.md` (como o sistema deve **funcionar**) e `docs/DESIGN.md` (como o sistema deve **parecer**). O chat de ajuda usa esses documentos como referência para explicar conceitos **dentro do contexto do seu próprio sistema**.

### 2.5 O que pode ser perguntado

Termos e conceitos: migration, commit, deploy, variável de ambiente, build, endpoint, autenticação, autorização, XSS, CSRF, SQL Injection, GitHub Actions, rsync, SSH, arquivo .env, erro 500, mensagem de erro no terminal, entre outros.

Perguntas contextualizadas (exemplos literalmente citados):
- "Explique o que é uma migration usando o sistema descrito em `docs/FSD.md` como exemplo."
- "Explique o que é controle de acesso considerando os perfis de usuário do meu projeto."
- "Explique em linguagem simples o que este comando faz: `git status`"
- "Recebi este erro durante um teste local. Explique o que ele significa antes de eu pedir correção no chat da fase: [cole aqui o erro]"

### 2.6 O que NÃO deve ser feito neste chat

Evitar pedidos de execução, como:
- Crie o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`).
- Atualize o STATUS.md.
- Construa a próxima fase.
- Corrija o código agora.
- Faça commit.
- Configure o deploy.
- Altere o FSD.
- Mude a arquitetura.
- Crie uma nova funcionalidade.
- Decida qual stack usar.
- Publique o sistema.

O chat de ajuda não deve alterar arquivos do projeto, não deve tomar decisões oficiais, e não deve executar os prompts oficiais da fase.

### 2.7 Regras do chat de ajuda

- **Regra importante:** não decide nada sozinho; explica, traduz termos, mostra exemplos e ajuda a entender opções. Se uma explicação gerar uma decisão importante, copie essa decisão para o chat correto.
- Ao receber mensagem de erro: primeiro ajudar a entender o erro em linguagem simples; se precisar corrigir arquivos, orientar a levar o erro para o chat da fase correspondente.
- Em dúvida sobre informações atuais/ferramentas/versões/boas práticas que possam ter mudado: **pesquisar antes de responder**.

### 2.8 PROMPT COMPLETO — "Prompt inicial do chat de ajuda" (VERBATIM)

> Bloco "Copiar" usado para iniciar o chat de ajuda da fase de codificação. (Antes de colar, o usuário deve ter os documentos `docs/FSD.md` e `docs/DESIGN.md`.)

```
## Objetivo

Atue como professor de desenvolvimento assistido por IA, analista de sistemas e programador experiente.

Este chat é exclusivo para tirar dúvidas e explicar termos técnicos relacionados à fase de codificação do meu projeto.

Estou construindo um sistema a partir dos documentos:

- `docs/FSD.md`
- `docs/DESIGN.md`

Leia os documentos citados integralmente e use-os como referência para explicar conceitos dentro do contexto do meu projeto.

Vou tirar dúvidas sobre codificação com IA, estrutura de projeto, Git, GitHub, banco de dados, segurança, testes, deploy, arquivos de contexto, prompts, erros, comandos, arquitetura, interface e boas práticas de desenvolvimento.

Responda sempre:

- em português do Brasil;
- com linguagem simples;
- com explicações adequadas para iniciantes;
- sem assumir que eu já sei programar;
- explicando termos técnicos antes de usá-los;
- com exemplos práticos quando ajudarem na compreensão;
- de forma objetiva, sem se estender demais;
- sem tomar decisões finais pelo projeto principal;
- sem alterar documentos do projeto;
- sem escrever código de produção, a menos que eu peça apenas um exemplo didático.

Este chat não deve executar os prompts oficiais da fase de codificação.

Este chat não deve criar, alterar ou atualizar arquivos como:

- `docs/FSD.md`
- `docs/DESIGN.md`
- `docs/INSUMOS.md`
- `docs/PLANO.md`
- `docs/STATUS.md`
- `docs/ERROS.md`
- arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
- arquivos de código do sistema.

Esses arquivos serão criados ou alterados nos chats corretos do fluxo.

Quando uma pergunta envolver decisão importante sobre o sistema, explique o assunto e me avise que essa decisão deve ser levada para o chat correto da etapa adequada.

Quando eu trouxer uma mensagem de erro, ajude primeiro a entender o erro em linguagem simples. Se for necessário corrigir arquivos do projeto, me oriente a levar o erro para o chat da fase correspondente.

Quando houver dúvida sobre informações atuais, ferramentas, versões, recursos recentes ou boas práticas que possam ter mudado, pesquise antes de responder.

Responda SIM se entendeu.
```

### 2.9 Prompts de exemplo complementares (VERBATIM)

Exemplos citados no capítulo para uso rotineiro no chat de ajuda:

1. **Entendendo um termo:**
```
O que é migration? Explique como se eu nunca tivesse programado e use um exemplo relacionado ao sistema descrito no meu FSD.
```

2. **Entendendo um erro:**
```
Explique em linguagem simples o que este erro quer dizer:

[cole aqui o erro]

Não corrija o projeto. Apenas me ajude a entender o significado e o que eu devo levar para o chat da fase correta.
```

3. **Levando uma decisão ao chat correto (após a IA explicar o conceito):**
```
Quero avaliar a inclusão de autenticação com dois fatores no sistema.

Analise o impacto dessa decisão no FSD, na experiência do usuário, na segurança, no fluxo de login e na complexidade de implementação.
```

### 2.10 Modelos/estruturas citados

- Arquivos de referência: `docs/FSD.md`, `docs/DESIGN.md`.
- Arquivos protegidos (não tocar no chat de ajuda): `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, `AGENTS.md`, `CLAUDE.md`, arquivos de código.

### 2.11 Vocabulário definido neste capítulo

| Termo | Explicação simples |
|---|---|
| Contexto | Conjunto de informações que a IA usa para entender a conversa; acumula-se por chat |

### 2.12 Checklists

- Não há checklist formal. A separação de papéis é: **dúvida → chat de ajuda; execução → chat da etapa; decisão → chat correto da etapa**.

---

## 3. Capítulo: codificacao-5.txt — Passo 1: Validando insumos

### 3.1 Objetivo do capítulo

Antes de pedir qualquer código, garantir que a IA tem **bons materiais de entrada (insumos)**. A IA lê os documentos principais, confere coerência, identifica os arquivos da pasta `docs/` e cria `docs/INSUMOS.md` (inventário). O objetivo é evitar que a codificação comece sobre informações incompletas, confusas ou contraditórias. **Nesta etapa não se escreve código.**

Por que valida de novo (já houve validação na fase de análise): agora a IA é uma **IA codificadora**, com acesso à pasta do projeto, aos arquivos reais e a recursos de construção; consegue ler a estrutura local, conferir nomes, comparar documentos e perceber detalhes práticos que passaram despercebidos antes.

### 3.2 O que são insumos

Materiais que a IA usa para fazer o trabalho: documentos, imagens, regras, referências e arquivos que ajudam a entender o que deve ser construído. Nesta etapa os principais são:

```
docs/FSD.md
docs/DESIGN.md
arquivos adicionais dentro da pasta docs/
```

- `FSD.md` explica o funcionamento do sistema.
- `DESIGN.md` orienta a aparência visual.
- Demais arquivos de `docs/` podem incluir imagens, logos, ícones, PDFs, referências visuais ou materiais de apoio.

### 3.3 Passos EXATOS na ordem

1. Abrir **chat novo**, com a ferramenta aberta **dentro da pasta do projeto**.
2. Colar o **Prompt do passo 1** (transcrito na íntegra abaixo).
3. A IA lê integralmente `docs/FSD.md` e `docs/DESIGN.md`.
4. A IA identifica no FSD: stack, ambiente de desenvolvimento, ambiente de produção, arquitetura, banco de dados (se houver), restrições técnicas, critérios de aceitação, organização sugerida da implementação.
5. A IA procura problemas que impeçam ou atrapalhem a codificação (contradições, ambiguidades, lacunas, conflitos).
6. A IA lista dúvidas objetivas e numeradas, com sugestões de resposta; **pergunta ao usuário e aguarda**.
7. Com aprovação, ajusta `docs/FSD.md` e/ou `docs/DESIGN.md`, mostrando o que/por que/qual impacto.
8. A IA inventaria todos os arquivos de `docs/` (identificando pelo nome e conteúdo; perguntando quando não tiver certeza).
9. A IA cria `docs/INSUMOS.md` com a tabela de inventário.
10. A IA entrega o relatório de coerência, resumo de stack/ambientes, dúvidas pendentes e a frase final.
11. Abrir chat novo e colar o prompt do próximo passo.

### 3.4 Regras e avisos importantes

- **A pasta `docs/` não vai para produção.** `docs/` guarda instruções para construir (documentação); `assets/` guarda arquivos usados pelo sistema funcionando. Se uma imagem de `docs/` precisar aparecer no sistema, ela será **copiada depois** para a pasta de assets.
- A IA **não deve escolher agora a pasta de assets** por conta própria — apenas marcar no inventário quais arquivos provavelmente precisarão ser copiados.
- A IA **pode corrigir pequenas inconsistências óbvias** (erro de digitação, nome escrito de duas formas), avisando o usuário — mas **não deve inventar decisões de negócio importantes**.
- **Não presuma stack específica**: leia o FSD e use apenas o que está definido nele.
- Não se escreve código, não se cria estrutura de pastas, não se instala dependências, não se copia arquivos para assets nesta etapa.

### 3.5 Por que criar um inventário

Sem inventário, a IA pode encontrar um arquivo `logo-final-2-ajustada.png` e não saber se é a logo principal, versão antiga, referência ou descartado. Com o inventário, o uso fica claro — ex.: "É a logo principal do sistema, usada na tela de login e no topo do painel. Deve ser copiada para `assets/img/`." Isso evita perguntas repetidas e reduz erros.

### 3.6 PROMPT COMPLETO — "Prompt do passo 1" (VERBATIM)

> Usar em **chat novo**, com a ferramenta aberta dentro da pasta do projeto. A IA apenas valida e cria o inventário.

```
Responda sempre em **português do Brasil**.

Você é um(a) analista técnico(a) cuidadoso(a). Antes de qualquer código, sua missão é **garantir que a especificação está pronta e sem furos** para construir o sistema. NÃO escreva código nesta etapa.

## Contexto

- A stack, a arquitetura, o ambiente de desenvolvimento, o ambiente de produção e as restrições técnicas do projeto estão definidos em `docs/FSD.md`.
- A especificação principal está em `docs/FSD.md` (funcional/técnica).
- As orientações visuais estão em `docs/DESIGN.md`.
- A pasta `docs/` pode ter outros arquivos de apoio, como logos, ícones, imagens de referência, PDFs ou documentos complementares.
- Não presuma uma stack específica. Leia o FSD e use apenas as tecnologias, ambientes e restrições que estiverem definidos nele.

## Tarefa 1 - Ler e revisar a especificação

1. Leia **integralmente** `docs/FSD.md` e `docs/DESIGN.md`.

2. Identifique no `docs/FSD.md`:
 - stack definida para o projeto;
 - ambiente de desenvolvimento;
 - ambiente de produção;
 - arquitetura prevista;
 - banco de dados, se houver;
 - restrições técnicas;
 - critérios de aceitação;
 - organização sugerida da implementação.

3. Procure problemas que **impeçam ou atrapalhem** a codificação: 
 - contradições entre FSD e DESIGN;
 - regras ambíguas ou incompletas;
 - lacunas técnicas, ou seja, algo necessário para construir que não foi definido;
 - conflitos entre funcionalidades, regras de negócio e arquitetura;
 - conflitos com a stack, os ambientes e as restrições definidas no FSD;
 - trechos que pareçam depender de uma tecnologia não definida no FSD;
 - decisões importantes que estejam vagas demais para orientar a codificação.

4. Liste suas dúvidas de forma **objetiva e numerada**, em linguagem simples.

5. Para cada dúvida, proponha uma sugestão de resposta para o usuário apenas confirmar ou ajustar.

6. **Pergunte ao usuário** e aguarde as respostas. Não invente decisões de negócio importantes por conta própria.

7. Com a aprovação do usuário, **ajuste** `docs/FSD.md` e/ou `docs/DESIGN.md`, mostrando claramente:
 - o que foi alterado;
 - por que foi alterado;
 - qual impacto isso tem na futura codificação.

8. Mudanças pequenas e seguras, como corrigir uma inconsistência óbvia, padronizar um nome escrito de duas formas ou ajustar erro de digitação, você pode aplicar já avisando o usuário.

## Tarefa 2 - Inventariar os arquivos de docs/

1. Liste **todos** os arquivos da pasta `docs/`.

2. Para cada arquivo, diga o que ele é:
 - `FSD.md` e `DESIGN.md` você já conhece;
 - para os demais arquivos, como imagens, ícones, PDFs, planilhas ou documentos complementares, tente identificar pelo nome e pelo conteúdo.

3. Se não tiver certeza do que é um arquivo ou de onde ele deve ser usado, **pergunte ao usuário**.

Exemplo: Encontrei `logo_branca.png`. Ela é a logo para fundos escuros? Onde devo usá-la?

4. Atenção a um ponto importante: a pasta `docs/` é uma pasta de documentação e apoio. Ela **não deve ser tratada automaticamente como pasta pública do sistema**.

5. Qualquer arquivo que o sistema precise usar em execução, como logos exibidas em telas, imagens de interface, ícones ou arquivos visuais, deverá ser copiado mais tarde para a pasta pública ou de assets definida pela stack e pela arquitetura do FSD.

6. Não escolha agora uma pasta de assets por conta própria. Apenas marque no inventário quais arquivos provavelmente precisarão ser copiados para a área pública do projeto durante a construção.

7. Crie o arquivo **`docs/INSUMOS.md`** registrando o inventário com, no mínimo:

**Inventário de insumos do projeto**

| Arquivo | O que é | Usado pelo sistema em execução? | Onde será usado | Observações |
|---|---|---|---|---|

Use a coluna “Onde será usado” para indicar o provável uso, como “tela de login”, “cabeçalho”, “referência visual”, “documentação” ou “a confirmar”.

## Saída esperada

1. Relatório curto dizendo se a especificação está **coerente e pronta** ou o que precisou ser ajustado.

2. Resumo da stack e dos ambientes identificados no `docs/FSD.md`.

3. Lista de dúvidas pendentes, se existirem, com sugestões de resposta.

4. O arquivo `docs/INSUMOS.md` criado.

5. Uma frase final ao finalizar:

Insumos validados. Próximo passo: abrir um chat novo e colar o prompt do próximo passo.

Lembre-se: nesta etapa **não se escreve código, não se cria estrutura de pastas, não se instala dependências e não se copia arquivos para assets**. O objetivo é validar os documentos e inventariar os insumos.
```

### 3.7 Modelo do inventário (`docs/INSUMOS.md`)

Estrutura mínima exigida (colunas):

| Arquivo | O que é | Usado pelo sistema em execução? | Onde será usado | Observações |

Exemplo preenchido citado no capítulo:

| Arquivo | O que é | Usado pelo sistema em produção? | Onde será usado |
|---|---|---|---|
| FSD.md | Especificação funcional e técnica | Não | Referência para codificação |
| DESIGN.md | Guia visual do sistema | Não | Referência para criação das telas |
| logo-principal.png | Logo principal do sistema | Sim | Tela de login e cabeçalho |
| referencia-painel.png | Imagem de referência visual | Não | Apenas inspiração para layout |

### 3.8 O que a IA deve entregar (checklist de saída)

1. Relatório curto dizendo se a especificação está pronta.
2. O arquivo `docs/INSUMOS.md` criado.
3. Orientação para abrir um chat novo e seguir para o próximo passo.
4. Se houver dúvidas importantes, listar as dúvidas antes de prosseguir.

### 3.9 Frase final padrão do passo

> "Insumos validados. Próximo passo: abrir um chat novo e colar o prompt do próximo passo."

### 3.10 Vocabulário técnico (tabela da metodologia)

| Termo | Explicação simples |
|---|---|
| Insumos | Materiais de entrada usados pela IA para construir o sistema |
| Validação | Conferência feita antes de avançar, para encontrar erros, lacunas ou contradições |
| Especificação | Documento que explica o que o sistema precisa fazer |
| Contradição | Quando dois trechos dizem coisas incompatíveis |
| Lacuna | Informação importante que está faltando |
| Inventário | Lista organizada dos arquivos encontrados e do uso de cada um |
| Produção | Ambiente real onde o sistema será publicado para uso |
| Assets | Arquivos usados pelo sistema, como imagens, CSS, JavaScript e ícones |

---

## 4. Capítulo: codificacao-6.txt — Passo 2: Preparação da estrutura inicial

### 4.1 Objetivo do capítulo

Preparar o terreno para a construção: transformar a especificação em **plano de execução** e criar os arquivos que guiarão a codificação daqui para frente, com continuidade mesmo em chats novos. A IA cria o plano de implementação, o arquivo de contexto da IA, os arquivos vivos de acompanhamento e a estrutura base do projeto. **Ainda não é momento de criar telas e funcionalidades.**

Por que o plano importa: sem ele, a IA pode construir fora de ordem (criar cadastro antes do banco, login antes de entender os perfis, pastas desalinhadas com a arquitetura) ou esquecer de registrar progresso.

### 4.2 Arquivos principais desta etapa

```
docs/PLANO.md
docs/STATUS.md
docs/ERROS.md
AGENTS.md
```

Se estiver usando **Claude Code**, o arquivo de contexto é `CLAUDE.md`:

```
docs/PLANO.md
docs/STATUS.md
docs/ERROS.md
CLAUDE.md
```

### 4.3 Passos EXATOS na ordem

1. **Atenção:** executar o prompt em **chat novo com raciocínio**.
2. Colar o **Prompt do passo 2** (transcrito na íntegra abaixo).
3. A IA lê integralmente `docs/FSD.md`, `docs/DESIGN.md` e `docs/INSUMOS.md`.
4. Identifica a base técnica (stack, arquitetura, ambientes, banco, dependências, comandos, configuração, restrições, organização da implementação) — perguntando ao usuário se item essencial faltar.
5. Cria `docs/PLANO.md` (plano de construção em fases, baseado no FSD).
6. Cria arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) na raiz com caminhos relativos e protocolo de arquivos vivos.
7. Cria `docs/STATUS.md` (arquivo vivo de andamento).
8. Cria `docs/ERROS.md` (memória de erros com modelo de registro).
9. Define as regras de segurança no arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) adequadas à stack.
10. Prepara a estrutura base do projeto (Fase 1).
11. Trata os arquivos marcados em `docs/INSUMOS.md` (copia/movimenta para a área de assets conforme a stack).
12. Respeita os limites da etapa (não constrói funcionalidades).
13. Revisa a portabilidade dos caminhos no arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`).
14. Entrega a saída esperada e a frase final.

### 4.4 Aviso de portabilidade de ferramenta (AGENTS.md × CLAUDE.md × GEMINI.md)

- Os prompts citam o **arquivo de contexto** do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).
- **Codex / Antigravity:** manter o prompt como está.
- **Claude Code:** o arquivo de contexto é `CLAUDE.md` (no Codex e no Antigravity, `AGENTS.md`), tanto para criar quanto para ler.
- **GEMINI.md não é criado** neste treinamento no fluxo principal. O Antigravity também pode trabalhar com `GEMINI.md`, mas a metodologia usa `AGENTS.md` nele para evitar duplicidade de arquivos com a mesma função.

### 4.5 O que é cada arquivo (regras de conteúdo)

**arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`)** — orientação fixa para a IA trabalhar no projeto: responder sempre em português do Brasil; seguir a stack definida no FSD; não inventar funcionalidades fora do escopo; reler os documentos antes de começar; atualizar STATUS.md ao terminar; registrar erros em ERROS.md; respeitar regras de segurança; testar antes de concluir uma fase. Evita repetir todas as regras em cada prompt.

**PLANO.md** — organiza a construção em **fases** (partes menores do projeto). Exemplo genérico citado: Fase 1 Infraestrutura; Fase 2 Banco de dados; Fase 3 Autenticação e sessão; Fase 4 Cadastro principal; Fase 5 Painel administrativo; Fase 6 Relatórios; Fase 7 Ajustes finais. As fases **não são inventadas livremente**: saem do FSD (organização sugerida da implementação, módulos, critérios de aceitação).

**STATUS.md** — mostra o andamento: o que já foi feito, o que falta, qual a próxima fase, quando cada etapa concluída, observações importantes. Muito usado ao abrir chats novos — a IA relê o STATUS.md em vez de depender da memória da conversa anterior.

**ERROS.md** — memória prática de problemas: sintoma, causa, solução aplicada, como evitar que aconteça de novo. Se o mesmo problema voltar, a IA consulta o histórico antes de resolver do zero.

### 4.6 Cuidado com arquivos de configuração

Muitos sistemas precisam de arquivos de configuração (nome/usuário/senha do banco, chaves de API, modo de ambiente, SMTP, endereços de serviços externos). **Informações sensíveis não devem ser enviadas ao GitHub.** Criar dois tipos de arquivo:

- um **arquivo de exemplo**, sem dados reais;
- um **arquivo real**, usado apenas no ambiente local ou de produção.

Exemplo genérico: `config.example` / `config.local`. Por stack: PHP puro → `config.example.php` / `config.php`; Node → `.env.example` / `.env`; Laravel → `.env.example` / `.env`. A IA deve seguir o padrão da stack definida no FSD.

### 4.7 Estrutura inicial do projeto

A estrutura precisa seguir o FSD — não forçar uma estrutura única. Exemplo de projeto PHP simples citado:

```
app/
config/
database/
public/
assets/
logs/
```

Em Laravel, Node etc., a estrutura será diferente. A IA pode sugerir, mas deve **justificar com base no FSD**.

### 4.8 PROMPT COMPLETO — "Prompt do passo 2" (VERBATIM)

> Versão generalista, sem stack fixa. Cita o arquivo de contexto do projeto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity). Executar em **chat novo com raciocínio**.

```
Responda sempre em **português do Brasil**.

Você é um(a) arquiteto(a) de software cuidadoso(a). Sua missão é **preparar o terreno** para a construção do sistema descrito em `docs/FSD.md` e `docs/DESIGN.md`.

Nesta etapa, você deve criar o plano de implementação, o arquivo de contexto, os arquivos vivos e a estrutura inicial do projeto.

Não construa as funcionalidades principais ainda.

## Antes de tudo

Leia integralmente:

* `docs/FSD.md`
* `docs/DESIGN.md`
* `docs/INSUMOS.md`

Trabalhe sempre dentro do que a especificação define.

Não invente funcionalidades fora de escopo.

A stack, a arquitetura, o ambiente de desenvolvimento, o ambiente de produção, o banco de dados, as dependências, os comandos, a estrutura de pastas e as restrições técnicas devem ser extraídos do `docs/FSD.md`.

Não presuma PHP, MySQL, XAMPP, Laravel, Node.js, Python, Supabase, Firebase ou qualquer outra tecnologia se isso não estiver definido no FSD.

## 1. Identificar a base técnica do projeto

Com base no `docs/FSD.md`, identifique e apresente um resumo curto de:

* stack do projeto;
* arquitetura definida;
* ambiente de desenvolvimento;
* ambiente de produção;
* banco de dados, se houver;
* gerenciador de dependências, se houver;
* framework CSS, biblioteca de interface ou design system, se houver;
* comandos necessários para instalar, rodar e testar, se estiverem definidos;
* estratégia de configuração do ambiente;
* restrições técnicas importantes;
* organização sugerida da implementação.

Se algum item essencial não estiver definido no FSD e for necessário para preparar o projeto, pergunte ao usuário antes de decidir.

## 2. Criar o plano de construção - `docs/PLANO.md`

Crie `docs/PLANO.md` com as fases incrementais do sistema.

As fases devem ser baseadas no FSD, especialmente em:

* organização sugerida da implementação;
* módulos funcionais;
* entidades;
* telas;
* integrações;
* critérios de aceitação;
* dependências entre partes do sistema.

Cada fase deve ter:

* objetivo da fase;
* checklist de tarefas;
* critérios de pronto;
* arquivos, pastas ou áreas prováveis que serão alterados;
* observações de dependência, quando houver.

As fases saem do FSD. Não presuma funcionalidades.

Estrutura típica, que deve ser adaptada ao projeto real descrito no FSD:

```text
Fase 1 - Infraestrutura e base do projeto
Fase 2 - Banco de dados e persistência, se aplicável
Fase 3 - Autenticação, sessão e controle de acesso, se aplicável
Fase 4 em diante - Um módulo funcional por fase, na ordem definida pelo FSD
Fase final - Itens transversais do FSD, como relatórios, exportações, logs, integrações, ajustes finais ou acabamentos, se houver
```

Use o roteiro de implementação e os critérios de aceitação do FSD para nomear e ordenar as fases reais deste projeto.

## 3. Criar o arquivo de contexto para a IA (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity)

Crie, na raiz do projeto, o arquivo de contexto (`CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity).

Ele serve para a IA entender o projeto em qualquer chat futuro.

Importante sobre caminhos de arquivos:

No arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)), use sempre caminhos relativos à raiz do projeto.

Use, por exemplo:

- `docs/FSD.md`
- `docs/DESIGN.md`
- `docs/INSUMOS.md`
- `docs/PLANO.md`
- `docs/STATUS.md`
- `docs/ERROS.md`

Não use caminhos absolutos da máquina local.

Não use links no formato `file:///`.

Não inclua caminhos como `C:\xampp\htdocs\...`, `/home/usuario/...` ou qualquer caminho completo específico do computador atual.

O arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)) deve funcionar em qualquer ambiente onde o projeto for aberto, por isso os caminhos precisam ser portáveis.

O arquivo deve conter, de forma resumida e objetiva:

* **Idioma:** responder sempre em português do Brasil.
* **Stack, arquitetura e restrições:** exatamente como definidas no FSD. Não invente nem presuma.
* **Ambientes:** desenvolvimento, teste e produção, conforme definidos no FSD.
* **Estrutura de pastas:** conforme o FSD ou conforme a estrutura criada nesta etapa.
* **Comandos principais:** instalar, rodar, testar, validar, migrar banco ou executar build, quando aplicável.
* **Regras de segurança:** adequadas à stack definida no FSD.
* **Protocolo dos arquivos vivos:** ao iniciar qualquer trabalho, reler `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md` e `docs/ERROS.md`; ao terminar, atualizar `docs/STATUS.md` e registrar erros e soluções em `docs/ERROS.md`, se houver.
* **Boas práticas:** código claro, funções pequenas, nomes descritivos, comentários úteis em português do Brasil quando ajudarem, sem duplicação desnecessária e sem funcionalidades fora do escopo.
* **Interface:** seguir `docs/DESIGN.md` nas telas, componentes, cores, espaçamentos e referências visuais.

Inclua no arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)) este protocolo:

```text
Antes de iniciar qualquer trabalho:
1. Ler `docs/FSD.md`.
2. Ler `docs/DESIGN.md`.
3. Ler `docs/INSUMOS.md`.
4. Ler `docs/PLANO.md`.
5. Ler `docs/STATUS.md`.
6. Ler `docs/ERROS.md`.

Use sempre caminhos relativos à raiz do projeto.
Não transformar estes caminhos em links absolutos.
Não usar links `file:///`.
Não registrar caminhos locais da máquina atual dentro do arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`).

Ao terminar qualquer trabalho:
1. Atualizar `docs/STATUS.md`.
2. Registrar erros e soluções em `docs/ERROS.md`, se houver.
3. Informar ao usuário o que foi feito.
4. Informar como testar ou validar a entrega.
```

## 4. Criar os arquivos vivos

Crie o arquivo `docs/STATUS.md`.

Ele deve registrar:

* estado atual do projeto;
* fases do `docs/PLANO.md`;
* checklist por fase;
* fase atual;
* próximo passo recomendado;
* data ou momento da última atualização.

Depois desta etapa, marque a Fase 1, ou equivalente, como concluída apenas se a infraestrutura inicial realmente tiver sido criada.

Crie também o arquivo `docs/ERROS.md`.

Ele deve começar com uma explicação curta de uso e um modelo de registro:

```text
## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:
```

## 5. Definir as regras de segurança no contexto

Inclua no arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)) as regras de segurança adequadas à stack definida no FSD.

Não use uma checklist fixa incompatível com a tecnologia do projeto.

Considere, quando aplicável:

* proteção contra injeção em banco de dados;
* proteção contra XSS;
* proteção contra CSRF;
* armazenamento seguro de senhas;
* autenticação e controle de sessão;
* controle de acesso por perfil ou permissão;
* isolamento de dados por usuário, conta, empresa ou organização, quando aplicável;
* proteção de arquivos sensíveis;
* uso seguro de variáveis de ambiente ou arquivos de configuração;
* mensagens de erro seguras;
* logs protegidos;
* validação de entradas;
* sanitização de saídas;
* proteção em uploads, se houver;
* segurança no consumo de APIs externas, se houver;
* cuidados com chaves, tokens e credenciais;
* proteção das rotas, endpoints ou páginas internas.

Se o FSD definir regras específicas de segurança, elas têm prioridade.

## 6. Preparar a estrutura base do projeto - Fase 1

Crie a estrutura inicial de pastas e arquivos conforme a stack, a arquitetura e os padrões definidos no FSD.

Não force uma estrutura genérica se o FSD definir outra.

Se o FSD não trouxer uma estrutura detalhada, proponha uma estrutura mínima compatível com a stack escolhida e explique antes de aplicar.

Quando aplicável à stack do projeto, prepare:

* pastas principais do projeto;
* arquivo inicial de entrada da aplicação;
* arquivos de configuração de exemplo, sem segredos reais;
* arquivos reais locais necessários para desenvolvimento, sem enviar segredos ao Git;
* estrutura para banco de dados, migrations, schemas ou scripts de persistência;
* estrutura de assets públicos;
* estrutura de componentes de interface;
* estrutura de logs;
* estrutura de testes;
* proteções básicas de arquivos, rotas ou pastas sensíveis;
* instalação local de dependências previstas no FSD;
* configuração inicial do framework CSS, biblioteca de interface ou design system definido no FSD;
* comandos de inicialização ou scripts úteis, quando a stack exigir.

Não instale bibliotecas, frameworks ou ferramentas que não estejam definidos no FSD sem perguntar ao usuário.

## 7. Tratar arquivos identificados em `docs/INSUMOS.md`

Leia `docs/INSUMOS.md`.

Para cada arquivo marcado como usado pelo sistema em execução, prepare sua cópia ou movimentação para o local adequado da estrutura do projeto, conforme a stack e a arquitetura definidas no FSD.

Exemplos:

* logos que aparecerão na interface;
* ícones usados em telas;
* imagens de fundo;
* arquivos públicos necessários para o sistema.

A pasta `docs/` é uma pasta de documentação e apoio. Ela não deve ser tratada automaticamente como pasta pública do sistema.

Se ainda houver dúvida sobre o uso de algum arquivo, pergunte ao usuário antes de copiar.

## 8. Respeitar os limites desta etapa

Crie apenas o que foi definido para esta etapa.

Não construa as funcionalidades principais agora.

Não crie módulos completos.

Não implemente telas finais de negócio.

Não avance para fases funcionais.

A construção das próximas fases será feita depois, com outro prompt, uma fase por vez.

## 9. Revisar portabilidade dos caminhos no arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`))

Antes de finalizar, revise o conteúdo do arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)).

Verifique se ele usa apenas caminhos relativos à raiz do projeto.

O arquivo não deve conter:

- caminhos começando com `file:///`;
- caminhos completos do Windows, como `C:\...`;
- caminhos completos do Linux ou servidor, como `/home/...`;
- caminhos específicos da pasta local onde o projeto está aberto.

Se encontrar algum caminho absoluto, substitua por caminho relativo.

Exemplo incorreto:

`[docs/FSD.md](file:///c:/xampp/htdocs/projeto/docs/FSD.md)`

Exemplo correto:

Ler `docs/MANUTENCAO.md`.

O objetivo é que o arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)) funcione em qualquer computador, ferramenta ou ambiente onde o repositório for aberto.

## Saída esperada

Ao final, entregue:

1. Resumo da stack, arquitetura e ambientes identificados no FSD.
2. Lista do que foi criado:
 * `docs/PLANO.md`;
 * arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`);
 * `docs/STATUS.md`;
 * `docs/ERROS.md`;
 * estrutura inicial de pastas e arquivos.
3. Confirmação de que o arquivo de contexto do projeto (`CLAUDE.md` ou arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)) usa apenas caminhos relativos do projeto e não contém caminhos absolutos, links `file:///` ou caminhos locais da máquina atual.
4. Confirmação de que a Fase 1, ou fase equivalente de infraestrutura/base, foi concluída e marcada no `docs/STATUS.md`, se isso realmente tiver sido feito.
5. Indicação clara da próxima fase pendente.
6. Uma frase final:

```text
Terreno preparado. Próximo passo: chat novo + prompt do próximo passo.
```

Lembre-se: nesta etapa você prepara o projeto. A construção das funcionalidades principais será feita nos próximos prompts.
```

### 4.9 Modelos de documentos citados

- **Modelo de registro de erro (ERROS.md):**
```
## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:
```
- **Protocolo do arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`)** (bloco de texto a ser incluído): "Antes de iniciar qualquer trabalho: 1. Ler FSD; 2. Ler DESIGN; 3. Ler INSUMOS; 4. Ler PLANO; 5. Ler STATUS; 6. Ler ERROS. Ao terminar: 1. Atualizar STATUS; 2. Registrar erros em ERROS; 3. Informar o que foi feito; 4. Informar como testar." — transcrito integralmente na seção 4.8.
- **Estrutura típica de fases do PLANO.md** — transcrita integralmente na seção 4.8.
- **Exemplo de estrutura de pastas (PHP simples):** `app/`, `config/`, `database/`, `public/`, `assets/`, `logs/`.
- **Exemplo de arquivos de configuração:** `config.example`/`config.local`; `config.example.php`/`config.php`; `.env.example`/`.env`.

### 4.10 O que a IA deve entregar (resumo)

Novos arquivos no projeto:
```
docs/PLANO.md
docs/STATUS.md
docs/ERROS.md
AGENTS.md          (ou CLAUDE.md se for Claude Code)
```
Além de estrutura inicial de pastas e arquivos compatível com o FSD.

### 4.11 Vocabulário técnico (tabela da metodologia)

| Termo | Explicação simples |
|---|---|
| Stack | Conjunto de tecnologias usadas no projeto, como linguagem, banco de dados, framework e ferramentas |
| Arquitetura | Forma como o sistema será organizado por dentro |
| Estrutura de pastas | Organização dos arquivos do projeto em pastas específicas |
| Arquivo de contexto | Arquivo que orienta a IA sobre como trabalhar naquele projeto |
| Arquivo vivo | Arquivo atualizado durante o projeto para registrar progresso, erros e decisões |
| Plano de implementação | Sequência de fases que a IA seguirá para construir o sistema |
| Critério de pronto | Condição usada para saber se uma fase foi concluída corretamente |
| Dependência | Biblioteca, pacote ou ferramenta externa usada pelo sistema |

### 4.12 Erros comuns e como resolver

- **Caminhos absolutos no arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`)** (ex.: `[docs/FSD.md](file:///c:/xampp/htdocs/projeto/docs/FSD.md)`) — o arquivo deixa de ser portátil; corrigir para caminhos relativos (ex.: "Ler `docs/MANUTENCAO.md`").
- **Instalar bibliotecas/frameworks fora do FSD** — proibido sem perguntar ao usuário.
- **Misturar ferramenta de contexto** — criar `AGENTS.md` no Claude Code (ou `CLAUDE.md` no Codex/Antigravity) gera o arquivo errado para a sua ferramenta.
- **Inventar fases sem base no FSD** — fases devem sair do FSD (organização sugerida, módulos, critérios de aceitação).
- **Enviar segredos ao Git** — arquivos reais de configuração não devem ir ao repositório; manter apenas o exemplo sem dados reais.
- **Tratar `docs/` como pasta pública** — assets usados em execução devem ser copiados para a área pública/assets, não usados direto de `docs/`.
- **Marcar Fase 1 como concluída sem ter criado a infraestrutura** — só marcar se a infraestrutura inicial realmente tiver sido criada.

---

## 5. Itens acionáveis (para o desenvolvedor executar)

### 5.1 Documentos de saída criados nesta etapa do fluxo

| Documento | Capítulo | Conteúdo |
|---|---|---|
| `docs/INSUMOS.md` | Passo 1 | Inventário de insumos da pasta `docs/` (colunas: Arquivo / O que é / Usado pelo sistema em execução? / Onde será usado / Observações) |
| `docs/PLANO.md` | Passo 2 | Plano de construção em fases (objetivo, checklist, critérios de pronto, arquivos afetados, dependências) |
| arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) | Passo 2 | Arquivo de contexto da IA, na raiz do projeto, com caminhos relativos, protocolo de arquivos vivos e regras de segurança |
| `docs/STATUS.md` | Passo 2 | Arquivo vivo de andamento (estado, fases, checklist por fase, fase atual, próximo passo, última atualização) |
| `docs/ERROS.md` | Passo 2 | Memória de erros (sintoma, causa, solução aplicada, como evitar) |
| Estrutura base de pastas e arquivos | Passo 2 | Conforme o FSD (ex. PHP: `app/`, `config/`, `database/`, `public/`, `assets/`, `logs/`) |

### 5.2 Comandos/ações manuais

- Abrir um **chat novo** para cada passo; o prompt do passo 1 e do passo 2 exigem chat novo (o passo 2, com raciocínio).
- O arquivo de contexto é `CLAUDE.md` no Claude Code e `AGENTS.md` no Codex e no Antigravity (não criar `GEMINI.md`).
- Após o passo 1: aguardar a IA listar dúvidas e respondê-las; aprovar ajustes ao FSD/DESIGN.
- Após cada passo: anotar a frase final padrão e colar o prompt do próximo passo em um chat novo.
- Configuração: manter arquivos de exemplo sem segredos (`config.example`, `.env.example`) e arquivos reais fora do Git.

### 5.3 Prompts prontos para colar (na ordem do fluxo)

1. **Prompt inicial do chat de ajuda** (criar chat separado de dúvidas) — seção 2.8.
2. **Prompt do passo 1** (validar insumos + criar `docs/INSUMOS.md`) — seção 3.6.
3. **Prompt do passo 2** (plano + contexto + arquivos vivos + estrutura base) — seção 4.8.

### 5.4 Frases finais padrão que indicam o avanço

- Fim do passo 1: "Insumos validados. Próximo passo: abrir um chat novo e colar o prompt do próximo passo."
- Fim do passo 2: "Terreno preparado. Próximo passo: chat novo + prompt do próximo passo."

### 5.5 Conteúdo NÃO presente nestes capítulos

- **Passo 3 — Git e GitHub (configuração de repositório, commit inicial, push, branches, .gitignore): NÃO está presente em nenhum dos três arquivos.** O material termina no Passo 2. Menções isoladas a Git/GitHub existem apenas como termos didáticos ("O que é commit?", "git status", "enviar segredos ao GitHub", "sem enviar segredos ao Git").
- Não há checklist formal numerado nos capítulos (apenas a "estrutura típica" de fases e o modelo de registro de erro).
- Não há tabela de "Erros comuns e como resolver" estruturada na metodologia — os erros estão implícitos nas regras dos prompts (compilados na seção 4.12).

