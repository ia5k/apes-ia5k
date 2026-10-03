# Referência APES IA5K — Fundamentos da análise, vocabulário, chat de dúvidas e design system

# Grupo 1 — Fundamentos: Fluxo de análise, Vocabulário especializado e Índice da metodologia


Capítulos analisados neste grupo:
- `analise-1.txt` → **Capítulo 1: Entendendo o fluxo de análise**
- `analise-2.txt` → **Capítulo 2: Vocabulário especializado**
- **Índice / visão geral da metodologia**

---

## 1. Visão geral do grupo

Estes capítulos formam a **fundação** da Fase de Análise do fluxo. A metodologia contém duas fases: **Análise** (antes de programar) e **Codificação** (com IA codificadora como Claude Code, Antigravity ou Codex).

- O **Capítulo 1** explica o **propósito da fase de análise**: transformar uma ideia inicial em documentos claros e organizados por meio de conversa com IA em linguagem natural, **sem programar ainda**. Apresenta os conceitos de **programação por conversa** (conversa natural) e **spec-driven development** (organização da conversa em documentos/especificações), a tabela geral dos **7 passos do fluxo** (Passos 0–6), os dois arquivos de saída principais (`docs/DESIGN.md` e `docs/FSD.md`), a "regra de ouro dos chats" (quando usar chat novo vs. mesmo chat), a separação entre dúvidas e decisões, o vocabulário técnico básico, os modelos de IA recomendados e o que o fluxo evita.
- O **Capítulo 2** apresenta o **vocabulário especializado** da análise: por que as palavras certas melhoram a resposta da IA, e todas as tabelas de termos (análise, dados, telas e interface, usuários e segurança, construção do sistema, uploads/exportações, ambientes, documentos do fluxo). Inclui conceitos explicados em detalhe (CRUD, RBAC, Auditoria, Soft delete, Logs, MVC, API/integrações, Configurações globais) e exemplos práticos de "frase vaga → frase precisa".
- O **índice** mostra a estrutura completa da metodologia e a preparação do ambiente (ferramentas de IA, XAMPP, Node.js/NPX/Python, Git). Não contém prompts.

Onde se encaixa: estes capítulos são **pré-requisito conceitual** para os capítulos 3–9 da Fase de Análise (Passos 0 a 6), que serão extraídos em outros grupos.

---

## 2. Capítulo 1 — Entendendo o fluxo de análise (`analise-1.txt`)

### 2.1 Objetivo do capítulo

Explicar o que é a fase de análise, por que fazê-la antes de codificar, como programação por conversa e spec-driven development se combinam, e dar a visão geral dos 7 passos do fluxo, das regras de uso de chats, dos documentos gerados e do modelo de IA recomendado.

### 2.2 Passos exatos na ordem (tabela "Visão geral dos passos")

| Passo | Nome | Onde roda | O que entra | O que sai |
|---|---|---|---|---|
| 0 | Chat de dúvidas | Chat separado, que fica aberto durante todo o fluxo | Suas dúvidas sobre termos, conceitos e decisões possíveis | Respostas e explicações para ajudar no aprendizado |
| 1 | Criar ou escolher o Design System | Chat próprio, ferramenta visual ou arquivo pronto fornecido no treinamento | Referência visual, imagem, HTML/CSS, modelo pronto ou Design System já definido | Arquivo DESIGN.md |
| 2 | Explorar a ideia | Chat novo, com modelo de raciocínio | Sua ideia inicial do sistema | Decisões funcionais registradas na conversa |
| 3 | Criar o PRD | Mesmo chat do Passo 2 | Tudo o que foi discutido e consolidado no Passo 2 | Arquivo PRD.md |
| 4 | Decisões Técnicas do Projeto | Chat novo, com modelo de raciocínio | PRD.md e DESIGN.md | Arquivo DECISOES_TECNICAS.md |
| 5 | Criar o FSD | Chat novo, com modelo de raciocínio | PRD.md, DECISOES_TECNICAS.md e DESIGN.md | Arquivo FSD.md |
| 6 | Validar o FSD | Chat novo, com modelo de raciocínio | PRD.md, DECISOES_TECNICAS.md, DESIGN.md e FSD.md | FSD.md revisado, corrigido e aprovado para codificação |

### 2.3 Todos os prompts/blocos "Copiar" (transcrição VERBATIM)

**Bloco Copiar — Arquivos de saída principais da fase:**

```
docs/DESIGN.md
docs/FSD.md
```

> Nota: este bloco contém apenas os nomes dos dois arquivos que o usuário deve criar/guardar. O DESIGN.md orienta a aparência do sistema; o FSD.md orienta o funcionamento do sistema. Serão usados depois pela IA que vai codificar.

**Bloco Copiar — Exemplo de início de programação por conversa (barbearia):**

```
Quero criar um sistema simples para uma barbearia controlar agendamentos, clientes e serviços.
```

**Bloco Copiar — Exemplo de perguntas que a IA pode fazer em resposta:**

```
O sistema terá login?
Os clientes poderão agendar sozinhos?
A barbearia terá mais de um profissional?
Será necessário enviar lembretes?
```

**Bloco Copiar — Exemplo do pedido "tentador" que gera dúvidas:**

```
Crie um sistema de agendamento para uma clínica.
```

**Bloco Copiar — Exemplo de regra de negócio:**

```
Um cliente não pode marcar dois horários no mesmo dia com o mesmo profissional.
```

> As perguntas que "ficam sem resposta" quando se pede direto para criar (apresentadas como lista, não como bloco Copiar): Quem pode acessar o sistema? / Existem usuários com permissões diferentes? / O cliente pode cancelar o agendamento? / O sistema precisa evitar horários duplicados? / O administrador pode editar serviços? / Os dados precisam ser exportados? / O sistema terá painel administrativo? / O layout seguirá algum padrão visual?

### 2.4 Modelos/estruturas de documentos citados

- `docs/DESIGN.md` — orienta a aparência das telas e componentes; responde a perguntas como: quais cores usar, como devem ser os botões, formulários, tabelas, e como mostrar erro, sucesso ou carregamento. Sem ele, a IA tende a decidir a aparência sozinha.
- `docs/PRD.md` — PRD vem de *Product Requirements Document* (Documento de Requisitos do Produto). Descreve **o que** o sistema deve fazer, quem vai usar, quais problemas resolve e quais funcionalidades precisa ter. **Não** define linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem nem detalhes técnicos de implementação. É "uma descrição bem organizada da solução". É o documento ideal para enviar à aprovação final do cliente (quando se desenvolve para terceiros).
- `docs/FSD.md` — FSD vem de *Functional Specification Document* (Documento de Especificação Funcional). Detalha **como** o sistema deve funcionar: fluxos, telas, permissões, dados, regras, validações e comportamentos esperados.
- Lógica PRD → FSD → DESIGN.md: primeiro se entende **o que** fazer, depois **como** funciona, e o DESIGN.md entra junto com o FSD para a parte visual. A IA codificadora recebe dois tipos de orientação: FSD.md (como o sistema funciona) e DESIGN.md (como a interface deve parecer).
- Pasta `docs/` do repositório: onde FSD.md e DESIGN.md ficam no projeto final.
- Repositório: pasta principal do projeto, geralmente controlada pelo Git; guarda código, documentos e histórico de alterações.

### 2.5 Regras, avisos, boas práticas e armadilhas

**A regra de ouro dos chats** (sobre contexto):
- Contexto = conjunto de informações que a IA usa para entender a conversa atual (memória temporária do chat).
- Conversas longas fazem a IA considerar tudo o que foi dito (ideias aprovadas, descartadas, dúvidas, exemplos, ajustes) — útil, mas pode gerar confusão.
- **Mesmo chat**: use quando o passo seguinte precisa aproveitar tudo o que foi conversado no passo anterior (ex.: Passo 3 roda no mesmo chat do Passo 2, porque o PRD aproveita toda a conversa de exploração).
- **Chat novo com arquivos anexados**: use quando o passo seguinte precisa apenas dos documentos finais, e não da conversa inteira (ex.: Passo 5 roda em chat novo, porque o FSD deve nascer dos documentos aprovados, não de conversa com rascunhos, dúvidas e ideias descartadas).
- **Chat de dúvidas separado**: use para perguntas gerais, sem misturar com decisões oficiais do sistema.

**Como separar dúvidas de decisões:**
- Dúvidas gerais de aprendizado (ex.: "O que é soft delete?", "O que significa autenticação?", "O que é CRUD?") → vão para o Chat de dúvidas do Passo 0.
- Decisões do sistema (ex.: "Este sistema precisa ter login?", "Os usuários poderão excluir registros?", "O administrador poderá cadastrar outros usuários?") → ficam no chat da etapa em que se está trabalhando, para a IA usá-las na criação dos documentos.
- Regra-mnemônica: **dúvida para aprender → chat de dúvidas; decisão sobre o sistema → chat do projeto**.

**Modelo de IA recomendado:**
- Em quase todos os passos, usar **modelo com raciocínio** (thinking/reasoning), porque a tarefa exige análise, comparação, organização de ideias e identificação de problemas (entender sistema, organizar informações, apontar lacunas, sugerir melhorias, transformar conversa em documentos).
- **Exceção**: o chat de dúvidas — para dúvidas simples ("o que é CRUD?", "o que é MySQL?") um modelo sem raciocínio costuma ser suficiente.

**Como usar o fluxo:**
- Seguir os passos na ordem. **Não pular etapas.**
- Não avançar com dúvidas importantes em aberto: "Um FSD criado em cima de um PRD confuso tende a gerar código confuso."
- Codificação sem DESIGN.md tende a gerar interfaces menos consistentes.

**O que este fluxo evita** (armadilhas do uso de IA):
- código gerado antes da ideia estar clara;
- telas criadas sem relação com as necessidades reais;
- interface visual inconsistente;
- botões, formulários e tabelas com padrões diferentes;
- banco de dados incompleto;
- regras de negócio esquecidas;
- funcionalidades duplicadas;
- falta de padrão visual;
- decisões importantes espalhadas pela conversa;
- IA codificadora inventando partes do sistema;
- dificuldade para revisar, corrigir ou continuar o projeto depois.

**Outros avisos:**
- Não é preciso decorar nomes técnicos, escrever documentação manualmente ou entender análise de sistemas a fundo — os prompts fazem a orientação.
- Nenhum fluxo garante sistema perfeito; o objetivo é dar à IA uma direção muito melhor.
- Analogia: criar software com IA sem análise é como pedir para construir uma casa apenas dizendo "quero uma casa bonita" — com análise, você entrega uma planta mais clara; com Design System, uma referência visual.
- A fase de análise roda em chats de LLM (ChatGPT, Gemini, Claude). Também é possível usar IAs com capacidade de codificação (Codex, Claude Code, Antigravity), **porém fique atento ao consumo de limites de uso destas ferramentas**.
- Regra de negócio é definida como "uma condição que define como o sistema deve funcionar em uma situação real" — não é detalhe técnico, é decisão importante do sistema.

### 2.6 Checklists mencionados

Não há checklist estruturado (com caixas de seleção) neste capítulo. O mais próximo é a sequência do fluxo na prática ("Você começa com uma referência visual. Depois conversa com a IA. Organiza as decisões. Gera os documentos. E só então codifica") e a lista de passos da tabela da seção 2.2.

### 2.7 Vocabulário especializado/termos definidos (tabela da metodologia)

| Termo | Explicação simples |
|---|---|
| LLM | Tipo de IA capaz de entender e gerar textos, como ChatGPT, Gemini ou Claude. |
| Programação por conversa | Forma de criar software conversando com a IA em linguagem natural, ajustando o projeto aos poucos. |
| Spec-driven development | Forma de desenvolver software usando especificações como guia antes da codificação. |
| Especificação | Documento que descreve como o sistema deve funcionar. |
| Design System | Conjunto de regras visuais e padrões de interface de um sistema. |
| DESIGN.md | Documento que orienta a IA sobre a aparência das telas e componentes. |
| PRD | Documento que explica o que o sistema deve fazer, com foco no produto e nas necessidades do usuário. |
| FSD | Documento que detalha como o sistema deve funcionar, com regras, fluxos, dados e comportamentos esperados. |
| IA codificadora | IA usada para criar ou alterar código, como Claude Code, Antigravity ou Codex. |
| Contexto | Conjunto de informações que a IA usa para entender a conversa atual. |
| Regra de negócio | Condição que define como o sistema deve agir em uma situação real. |

### 2.8 Erros comuns e como resolver

- **Pedir direto para a IA criar o sistema** (ex.: "Crie um sistema de agendamento para uma clínica.") → gera código com muitas perguntas sem resposta; a IA pode **inventar** regras de negócio, telas, permissões, estruturas ou padrões visuais, deixando o projeto frágil. Resolução: seguir o fluxo de análise (passos 0–6) antes de codificar.
- **Misturar dúvidas de aprendizado com decisões do projeto** no mesmo chat → a IA pode tratar uma dúvida conceitual como decisão oficial. Resolução: usar o Chat de dúvidas (Passo 0) separado.
- **Conversa longa demais para gerar um documento aprovado** → contexto cheio de rascunhos e ideias descartadas. Resolução: usar chat novo com arquivos anexados para os passos que exigem só os documentos finais (ex.: Passo 5).
- **Codificar sem DESIGN.md** → interfaces inconsistentes.
- **Avançar com dúvidas importantes em aberto** → código confuso.

---

## 3. Capítulo 2 — Vocabulário especializado (`analise-2.txt`)

### 3.1 Objetivo do capítulo

Apresentar o vocabulário essencial da análise de sistemas para melhorar a qualidade dos prompts e a precisão da IA. Não transforma o leitor em especialista técnico, nem exige decorar termos — serve como consulta durante o fluxo. Quando a IA usar um termo novo, o leitor deve recorrer ao chat de dúvidas do Passo 0.

### 3.2 Passos exatos na ordem

Não é um capítulo de passos procedimentais; é um capítulo de referência. Contudo, apresenta a sequência de uso: (1) entender por que o vocabulário importa; (2) consultar as tabelas de termos por domínio; (3) trocar frases vagas por descrições precisas ao escrever prompts; (4) quando surgir termo desconhecido, perguntar no chat de dúvidas e voltar ao fluxo principal.

### 3.3 Todos os prompts/blocos "Copiar" (transcrição VERBATIM)

**Bloco Copiar — Exemplo de frase vaga (tela para clientes):**

```
Quero uma tela para colocar clientes.
```

**Bloco Copiar — Exemplo de frase precisa (funcionalidade de cadastro):**

```
Quero uma funcionalidade de cadastro de clientes com inclusão, listagem, edição e exclusão de registros.
```

> O capítulo explica que a segunda frase dá mais direção à IA: informa que haverá um cadastro, que os dados serão registrados e que o usuário poderá executar ações específicas.

**Bloco Copiar — Exemplo vago (controlar contas):**

```
Quero controlar contas.
```

**Bloco Copiar — Exemplo preciso (contas a pagar):**

```
Quero um sistema web para controlar contas a pagar, com cadastro de fornecedores, registro de vencimentos, status de pagamento, filtro por período e exportação em CSV.
```

> A segunda descrição é mais útil porque usa termos específicos: sistema web; cadastro; fornecedores; vencimentos; status; filtro; exportação; CSV.

**Bloco Copiar — Descrição inicial vaga (clínica):**

```
Quero um sistema para controlar pacientes e consultas.
```

**Bloco Copiar — Mesma ideia com vocabulário preciso (clínica):**

```
Quero criar a versão 1 de um sistema web para uma clínica.

O sistema terá cadastro de pacientes, cadastro de profissionais e agendamento de consultas.

As personas principais serão administrador e atendente.

O administrador poderá gerenciar usuários e configurações gerais.
O atendente poderá cadastrar pacientes e agendar consultas.

Uma regra de negócio importante é impedir dois agendamentos no mesmo horário para o mesmo profissional.
```

> A IA já consegue identificar com essa descrição: o tipo de sistema; a primeira versão; as funcionalidades principais; os perfis de usuário; as permissões; uma regra de negócio importante.

**Bloco Copiar — Exemplo vago (área para clientes):**

```
Quero uma área para clientes.
```

**Bloco Copiar — Exemplo preciso (cadastro de clientes):**

```
Quero um cadastro de clientes com CRUD básico, busca por nome e e-mail, filtro por status e validação para impedir e-mails duplicados.
```

**Bloco Copiar — Exemplo vago (usuários diferentes):**

```
Quero que tenha usuários diferentes.
```

**Bloco Copiar — Exemplo preciso (autenticação e perfis):**

```
O sistema terá autenticação e dois perfis de usuário: administrador e operador. O administrador poderá gerenciar usuários. O operador poderá apenas cadastrar e consultar registros.
```

**Bloco Copiar — Exemplo vago (baixar os dados):**

```
Quero baixar os dados.
```

**Bloco Copiar — Exemplo preciso (exportação em CSV):**

```
O sistema terá exportação em CSV da listagem de clientes, respeitando os filtros aplicados na tela.
```

> Observação da metodologia: os exemplos continuam em linguagem natural; a diferença é que a linguagem está mais precisa.

**Bloco Copiar — Pergunta sugerida para o chat de dúvidas (termo novo 1):**

```
Explique o termo "soft delete" de forma simples, com um exemplo aplicado a um sistema web.
```

**Bloco Copiar — Pergunta sugerida para o chat de dúvidas (termo novo 2):**

```
Explique o que é RBAC e quando faz sentido usar isso em um sistema simples.
```

### 3.4 Modelos/estruturas de documentos citados

| Termo | Explicação simples |
|---|---|
| DESIGN.md | Documento que orienta o design da interface do sistema, como cores, telas, componentes, botões, formulários, tabelas, mensagens e estados visuais. |
| PRD.md | Documento de Requisitos do Produto. Explica o que o sistema deve fazer, quem vai usar, qual problema resolve e quais funcionalidades entram na primeira versão, sem entrar em detalhes técnicos de programação. |
| DECISOES_TECNICAS.md | Documento que registra as decisões técnicas do projeto, como stack, ambiente local, produção, arquitetura, autenticação, permissões, logs, auditoria, soft delete, configurações, uploads, exportações, APIs e integrações. |
| FSD.md | Documento de Especificação Funcional. Detalha como o sistema deve funcionar para orientar a codificação, usando como base o PRD, as decisões técnicas e o design. |
| Repositório | Pasta principal do projeto, geralmente controlada pelo Git, onde ficam código, documentos e histórico de alterações. |

**O que é o DESIGN.md** (seção dedicada): descreve o design da interface (interface = parte visual com a qual o usuário interage: telas, botões, formulários, menus, tabelas e mensagens). Pode conter: identidade visual; cores; tipografia; estrutura das telas; componentes; padrões de botões; formulários; tabelas; cards; menus; mensagens; estados de erro, sucesso, vazio e carregamento. É o "guia visual do sistema". **O FSD não precisa redesenhar tudo que já está no docs/DESIGN.md** — deve usar esse documento como referência e indicar que a IA codificadora precisa respeitá-lo.

### 3.5 Regras, avisos, boas práticas e armadilhas

- **Por que o vocabulário importa**: a IA responde melhor quando recebe instruções claras. Palavras certas não significam falar difícil; significam usar os termos que analistas, desenvolvedores e equipes de produto usam.
- Usar o vocabulário como **consulta durante o fluxo**, não decorar.
- Trocar frases vagas por instruções mais claras ao descrever ideias.
- **Quando surgir um termo novo durante a criação do PRD ou do FSD**: não pare o fluxo principal para discutir longamente no chat do projeto. Pergunte no chat de dúvidas (modelos de pergunta nas seções 3.3, blocos finais) e depois volte ao chat principal e continue o fluxo. Essa separação mantém a conversa de análise limpa e reduz o risco de a IA tratar uma dúvida conceitual como decisão oficial do projeto.
- Fechamento: o vocabulário não complica o processo; dá mais precisão às ideias. Você continua conversando em linguagem natural, mas com palavras que ajudam a organizar melhor o sistema.

### 3.6 Checklists mencionados

Não há checklist estruturado neste capítulo. Há a lista de exemplos de telas de listagem (título da tela; botão "Novo cliente"; campo de busca; filtros por status; tabela com nome, e-mail, telefone e data de cadastro; botões para visualizar, editar e excluir; paginação; mensagem para quando nenhum cliente for encontrado) — usada como descrição que ajuda a IA a criar interface mais completa.

### 3.7 Vocabulário especializado/termos definidos (todas as tabelas da metodologia)

**Vocabulário essencial da análise:**

| Termo | Explicação simples |
|---|---|
| Sistema web | Sistema acessado pelo navegador, como Chrome, Edge ou Firefox. |
| Produto | Neste contexto, é o sistema que será criado. |
| Funcionalidade | Algo que o sistema permite fazer, como cadastrar cliente, gerar relatório ou marcar uma conta como paga. |
| Requisito | Necessidade ou comportamento que o sistema precisa atender. |
| Regra de negócio | Regra que define como o sistema deve funcionar na prática. |
| Escopo | Conjunto de funcionalidades que entram no projeto. |
| Fora de escopo | O que não será feito nesta versão do sistema. |
| Versão 1 | Primeira versão funcional do sistema. Deve resolver o problema principal sem tentar fazer tudo de uma vez. |
| Persona | Perfil de usuário que vai usar o sistema, como administrador, funcionário, professor, cliente ou gerente. |
| Permissão | Define o que cada tipo de usuário pode acessar ou fazer. |
| Critério de aceitação | Condição usada para verificar se uma funcionalidade foi criada corretamente. |
| História de usuário | Frase simples que explica o que um usuário quer fazer e por qual motivo. |
| Fluxo de uso | Sequência de passos que o usuário executa dentro do sistema. |
| Contexto | Conjunto de informações que a IA usa para entender a conversa atual. |

**Vocabulário de dados:**

| Termo | Explicação simples |
|---|---|
| Banco de dados | Local onde o sistema guarda informações de forma organizada. |
| Tabela | Estrutura que guarda um tipo de informação. Por exemplo: tabela de clientes, tabela de produtos, tabela de pedidos. |
| Campo | Informação específica dentro de uma tabela. Em uma tabela de clientes, nome, e-mail e telefone podem ser campos. |
| Registro | Uma linha de informação salva em uma tabela. Por exemplo: um cliente cadastrado. |
| Entidade | Informação importante que o sistema precisa armazenar ou controlar, como cliente, produto, pedido, aluno ou agendamento. |
| Relacionamento | Ligação entre informações. Por exemplo: um pedido pertence a um cliente. |
| Status | Situação atual de algo dentro do sistema, como pendente, pago, cancelado ou concluído. |
| Validação | Conferência feita pelo sistema antes de aceitar uma informação. |
| Obrigatório | Campo que precisa ser preenchido para o sistema aceitar o cadastro. |
| Único | Informação que não pode se repetir, como o e-mail de um usuário. |

Exemplo prático de dados (cadastro de alunos): entidade principal = aluno; tabela = `alunos`; campos possíveis = nome, e-mail, telefone, data de nascimento, status; cada aluno salvo = um registro; impedir dois alunos com mesmo e-mail = validação; campo nome sempre preenchido = campo obrigatório.

**CRUD** (tabela):

| Letra | Significado | Explicação simples |
|---|---|---|
| C | Create | Criar um novo registro. |
| R | Read | Ler, visualizar ou listar registros. |
| U | Update | Atualizar ou editar um registro existente. |
| D | Delete | Excluir um registro. |

Em português: Cadastrar / Listar ou visualizar / Editar / Excluir. Exemplo (cadastro de clientes): cadastrar novo cliente; listar clientes; visualizar dados de um cliente; editar telefone, e-mail ou endereço; excluir um cliente quando permitido. **Nem toda funcionalidade precisa ter todas as ações do CRUD** — ex.: sistema financeiro pode cadastrar e visualizar pagamentos, mas não excluir pagamentos já confirmados; essa limitação é uma regra de negócio.

**Vocabulário de telas e interface:**

| Termo | Explicação simples |
|---|---|
| Tela | Página ou área do sistema onde o usuário realiza uma tarefa. |
| Formulário | Área com campos para preencher e enviar informações. |
| Campo | Espaço onde o usuário digita ou seleciona uma informação. |
| Botão | Elemento usado para executar uma ação, como salvar, cancelar ou excluir. |
| Menu | Lista de opções para navegar pelo sistema. |
| Tabela de listagem | Área que mostra vários registros em linhas e colunas. |
| Filtro | Recurso usado para encontrar informações específicas. |
| Busca | Recurso para pesquisar dados por palavras, nomes, códigos ou outros valores. |
| Paginação | Divisão de uma lista grande em várias páginas. |
| Card | Bloco visual usado para destacar informações. |
| Mensagem de erro | Aviso mostrado quando algo dá errado. |
| Mensagem de sucesso | Aviso mostrado quando uma ação foi concluída corretamente. |
| Estado vazio | Situação em que uma tela ainda não tem dados para mostrar. |
| Estado de carregamento | Indicação de que o sistema está processando ou buscando informações. |

**Vocabulário de usuários e segurança:**

| Termo | Explicação simples |
|---|---|
| Usuário | Pessoa que acessa o sistema. |
| Autenticação | Processo usado para identificar quem está entrando no sistema. O exemplo mais comum é login com e-mail e senha. |
| Login | Entrada do usuário no sistema. |
| Senha | Informação secreta usada para confirmar a identidade do usuário. |
| Sessão | Período em que o usuário permanece conectado ao sistema. |
| Perfil de usuário | Tipo de usuário dentro do sistema, como administrador, gerente, operador ou cliente. |
| Papel | Função atribuída a um usuário. É parecido com perfil. |
| Permissão | Define o que um usuário pode acessar ou fazer. |
| RBAC | Controle de acesso baseado em papéis. Define permissões conforme o papel do usuário. |
| Acesso negado | Situação em que o usuário tenta acessar algo sem permissão. |
| Log de segurança | Registro de eventos sensíveis, como tentativa de login inválida ou acesso negado. |
| Auditoria | Registro de quem criou ou alterou informações importantes. |

**Vocabulário técnico da construção do sistema:**

| Termo | Explicação simples |
|---|---|
| Stack | Conjunto de tecnologias usadas para criar o sistema, como linguagem, banco de dados e ferramentas. |
| Linguagem de programação | Linguagem usada para escrever o código do sistema, como PHP, JavaScript ou Python. |
| Biblioteca | Conjunto pronto de recursos que ajuda a criar partes do sistema sem começar tudo do zero. |
| Framework | Estrutura pronta que ajuda a organizar e acelerar o desenvolvimento de um sistema. |
| Front-end | Parte do sistema que o usuário vê e usa no navegador. |
| Back-end | Parte do sistema que processa regras, acessa o banco de dados e controla a lógica interna. |
| HTML | Linguagem usada para estruturar o conteúdo das páginas. |
| CSS | Linguagem usada para definir aparência visual, como cores, tamanhos e espaçamentos. |
| JavaScript | Linguagem usada para criar interações no navegador. |
| PHP | Linguagem muito usada para criar sistemas web no servidor. |
| MySQL | Banco de dados usado para guardar informações de muitos sistemas web. |
| Bootstrap | Biblioteca de interface que ajuda a criar layouts, botões, formulários e componentes visuais. |
| MVC | Padrão de organização que separa dados, interface e controle do sistema. |
| API | Forma padronizada para sistemas conversarem entre si. |
| Integração externa | Comunicação do sistema com ferramenta ou serviço de terceiros. |

**Uploads, anexos e exportações:**

| Termo | Explicação simples |
|---|---|
| Upload | Envio de arquivo para o sistema. |
| Anexo | Arquivo associado a um registro, como comprovante, contrato ou imagem. |
| Exportação | Geração de arquivo com dados do sistema. |
| CSV | Arquivo de texto organizado em colunas, muito usado para planilhas e importação de dados. |
| PDF | Formato comum para documentos prontos para leitura, impressão ou envio. |
| Excel | Formato de planilha usado para organizar e analisar dados. |
| Importação | Entrada de dados no sistema a partir de um arquivo externo. |

**Ambientes do sistema:**

| Termo | Explicação simples |
|---|---|
| Ambiente local | Computador onde o sistema é desenvolvido e testado antes da publicação. |
| Ambiente de testes | Local separado para validar o sistema antes da publicação real. |
| Homologação | Etapa em que o sistema é testado e aprovado antes de ir para uso real. |
| Produção | Ambiente real, usado pelos usuários finais. |
| Deploy | Processo de publicar o sistema no ambiente onde ele será usado. |
| Hospedagem | Serviço onde o sistema fica publicado para ser acessado pela internet. |
| Domínio | Endereço usado para acessar o sistema, como meusistema.com.br. |

**Tipos de log** (tabela):

| Tipo de log | Explicação simples |
|---|---|
| Log de erro | Registra falhas técnicas, como erro ao salvar no banco ou falha em uma integração. |
| Log de segurança | Registra eventos sensíveis, como login inválido, acesso negado ou tentativa suspeita. |

### 3.8 Conceitos explicados em detalhe (seções dedicadas)

- **RBAC** — *Role-Based Access Control* (controle de acesso baseado em papéis). Define o que cada tipo de usuário pode fazer. Exemplo: administrador pode gerenciar usuários; gerente pode ver relatórios; operador pode cadastrar registros; cliente pode ver apenas seus próprios dados. Sem esse controle, todos os usuários poderiam acessar tudo — em muitos sistemas, isso seria um risco.
- **Auditoria** — registra ações importantes: quem criou um registro, quando criou, quem alterou, quando alterou, qual informação foi alterada. Ajuda a investigar erros, acompanhar mudanças e aumentar a segurança. Exemplo: alguém alterou o valor de uma mensalidade; com auditoria, o administrador descobre quem fez e quando.
- **Soft delete** — exclusão lógica. Na exclusão comum, o registro é apagado definitivamente do banco. No soft delete, o registro deixa de aparecer na tela principal, mas continua guardado no banco. Exemplo: cliente excluído por engano pode ser recuperado. Ajuda a evitar perda acidental de informações, mas **nem todo sistema precisa dele**.
- **Logs** — registro automático de eventos importantes (diário técnico do sistema). O usuário comum não precisa ver detalhes técnicos do erro: o sistema pode mostrar mensagem simples e guardar os detalhes no log para investigação.
- **MVC** — *Model-View-Controller*, padrão de organização que separa responsabilidades: **Model** cuida dos dados, regras ligadas aos dados e comunicação com o banco; **View** cuida da interface que o usuário vê e utiliza; **Controller** recebe as ações do usuário, aciona o que precisa ser feito e escolhe qual resposta ou tela será exibida. Exemplo de fluxo: usuário clica para cadastrar cliente → View mostra o formulário → Controller recebe os dados enviados → Model organiza e salva os dados no banco → Controller decide qual resposta será exibida → View mostra mensagem de sucesso ou erro. Sem essa separação, o sistema mistura tela, consulta ao banco, validações, permissões e regras de negócio no mesmo arquivo, dificultando manutenção, revisão e evolução.
- **API e integrações externas** — API é forma padronizada para sistemas conversarem entre si (comparação com balcão de atendimento). Exemplo: sistema de agendamento integrado ao Google Calendar — o sistema envia os dados da consulta, a API do Google Calendar recebe o pedido, o compromisso é criado. Integração externa é essa comunicação com serviços de terceiros (pagamento, WhatsApp, Google Calendar, notas fiscais, API de outro fornecedor).
- **Uploads/anexos/exportações** — quando o FSD precisa definir: quais tipos de arquivo são permitidos; tamanho máximo dos arquivos; quem pode enviar anexos; quem pode baixar arquivos; quais dados entram na exportação; quais permissões são necessárias.
- **Ambientes** — exemplo do treinamento: o aluno desenvolve no próprio computador (ambiente local) e depois publica em hospedagem com PHP e MySQL (deploy).
- **Recursos estruturais do sistema** — recursos de base que tornam o sistema mais seguro, organizado e fácil de manter: autenticação; RBAC; auditoria; soft delete; log de erros; log de segurança; configurações globais; uploads e anexos; exportações; APIs; integrações externas. **Nem todo sistema precisa de todos esses recursos.**
- **Configurações globais** — opções administrativas que afetam o sistema como um todo: nome do sistema; logo; cores; tempo de sessão; ativar ou desativar logs; domínios permitidos; e-mail de contato; limite de upload; número de itens por página. Evitam que certas informações fiquem fixas no código (ex.: se o nome do sistema estiver em configuração global, o administrador altera sem modificar o código).

### 3.9 Erros comuns e como resolver

- **Falar difícil / decorar termos** → não é necessário; o vocabulário é para consulta.
- **Frases vagas nos prompts** ("Quero controlar contas", "Quero uma área para clientes", "Quero que tenha usuários diferentes", "Quero baixar os dados") → substituir por descrições precisas (contas a pagar com cadastro/vencimentos/status/filtro/exportação CSV; cadastro com CRUD, busca, filtro e validação de e-mails duplicados; autenticação com perfis e permissões; exportação em CSV respeitando filtros).
- **Parar o fluxo principal para discutir um termo novo** no chat do projeto → usar o chat de dúvidas (perguntar "Explique o termo..."/"Explique o que é...") e voltar; evita que a IA trate dúvida conceitual como decisão oficial.

---

## 4. Índice / visão geral da metodologia

### 4.1 Objetivo

Apresentar a metodologia (título, versão, revisão), preparar o ambiente de desenvolvimento e listar o sumário completo das fases de Análise, Codificação e Extras. Não contém prompts nem blocos "Copiar".

### 4.2 Conteúdo

**Cabeçalho da metodologia:**
- Título/objetivo: "Aprenda a planejar e criar sistemas web com inteligência artificial, mesmo sem saber programar."
- Versão v1.5; última revisão 23/07/2026; revisado regularmente para incluir novas técnicas, práticas aprimoradas e atualizações.

**Instalação e preparação do ambiente:**
- **Ferramentas de IA**: os fluxos podem ser usados com Antigravity, Claude Code e Codex — a lógica de análise, documentação e construção é a mesma, escolha a ferramenta de preferência. Guias citados: "Antigravity 2.0 na prática", "Claude Code na prática", "Codex na prática", "XAMPP: PHP e MySQL".
- **XAMPP**: cria ambiente local com Apache, PHP e MySQL para testar sistemas web antes de publicar em hospedagem. Tutorial citado: "Como instalar e configurar o XAMPP no Windows".
- **Node.js, NPX e Python**: Node.js executa ferramentas modernas; NPX vem junto e roda comandos sem instalar tudo manualmente; Python pode ser necessário para automações, dependências e recursos das IAs codificadoras. Tutoriais citados: "Como instalar Node.js e NPX", "Como instalar Python no Windows".
- **Git**: controla as versões do projeto — acompanhar alterações, voltar a versões anteriores e organizar a evolução do sistema durante a codificação.

**Sumário completo da metodologia:**

*Fase de Análise:*
1. Entendendo o fluxo de análise
2. Vocabulário especializado
3. Passo 0 – Chat de dúvidas
4. Passo 1 – Design System
5. Passo 2 – Explorar a ideia
6. Passo 3 – PRD
7. Passo 4 – Decisões Técnicas do Projeto
8. Passo 5 – FSD
9. Passo 6 – Validação do FSD

*Fase de Codificação:*
1. Introdução
2. Ferramentas
3. O fluxo – um prompt por etapa
4. Passo 0 – Chat de ajuda
5. Passo 1 – Validando insumos
6. Passo 2 – Preparação da estrutura inicial
7. Passo 3 – Git e GitHub
8. Passo 4 – Codificando em etapas
9. Testando as etapas da codificação
10. Passo 5 – Revisão de segurança
11. Passo 6 – Documentação
12. Pedindo alterações
13. Voltar uma versão (rollback)
14. Skills
15. Outras stacks
16. Erros comuns
17. Conclusão

*Extras:*
1. Passo 5 – FSD (IA Agêntica)
2. Passo 6 – Validação do FSD (IA Agêntica)

### 4.3 Regras, avisos, boas práticas

- Preparar o ambiente antes de começar o treinamento (ferramentas de IA + XAMPP + Node.js/NPX/Python + Git).
- É possível escolher qualquer ferramenta de codificação com IA; a lógica dos fluxos é a mesma.

### 4.4 Prompts, checklists, vocabulário, erros comuns

- Prompts: **não presente neste capítulo** (apenas índice e instruções de instalação).
- Checklists: não presente.
- Vocabulário/termos definidos: não presente (nomes de ferramentas apenas: Antigravity, Claude Code, Codex, XAMPP, Apache, PHP, MySQL, Node.js, NPX, Python, Git).
- Erros comuns e como resolver: não presente.

---

## 5. Itens acionáveis

Documentos de saída, pastas, comandos e prompts que um desenvolvedor/aluno precisa executar após estes capítulos:

**Ambiente (do índice):**
1. Instalar uma IA codificadora de escolha: Antigravity, Claude Code ou Codex (consultar guias "na prática").
2. Instalar o XAMPP (Apache + PHP + MySQL) para ambiente local; instalar/configurar no Windows conforme tutorial.
3. Instalar Node.js e NPX; instalar Python no Windows.
4. Instalar o Git para controle de versões do projeto.

**Fluxo de análise (do Capítulo 1 — sequência de 7 passos a executar):**
5. Passo 0: criar o **Chat de dúvidas** (chat separado, aberto durante todo o fluxo; usar modelo simples, sem necessidade de raciocínio). Mandar para ele dúvidas de aprendizado (ex.: "O que é soft delete?").
6. Passo 1: **Criar ou escolher o Design System** (chat próprio, ferramenta visual ou arquivo pronto fornecido no treinamento; insumos: referência visual, imagem, HTML/CSS, modelo pronto ou Design System já definido) → gera o arquivo **DESIGN.md**.
7. Passo 2: **Explorar a ideia** em chat novo, com modelo de raciocínio → decisões funcionais registradas na conversa.
8. Passo 3: **Criar o PRD** no mesmo chat do Passo 2 → arquivo **PRD.md**.
9. Passo 4: **Decisões Técnicas do Projeto** em chat novo, com modelo de raciocínio; entra PRD.md + DESIGN.md → arquivo **DECISOES_TECNICAS.md**.
10. Passo 5: **Criar o FSD** em chat novo, com modelo de raciocínio; entram PRD.md + DECISOES_TECNICAS.md + DESIGN.md → arquivo **FSD.md**.
11. Passo 6: **Validar o FSD** em chat novo, com modelo de raciocínio; entram PRD.md + DECISOES_TECNICAS.md + DESIGN.md + FSD.md → **FSD.md revisado, corrigido e aprovado para codificação**.

**Estrutura de arquivos resultante da fase:**
12. Pasta do projeto no computador contendo, ao final, na pasta `docs/`: `DESIGN.md` e `FSD.md` (o `PRD.md` e o `DECISOES_TECNICAS.md` também são gerados no fluxo e servem de insumo). Repositório controlado pelo Git.

**Prompts prontos transcritos neste grupo** (todos os blocos "Copiar"): os exemplos de início de programação por conversa, de perguntas da IA, o pedido "tentador" a evitar, a regra de negócio de exemplo, todos os pares vago→preciso do vocabulário e as duas perguntas prontas para o chat de dúvidas. Estão transcritos integralmente nas seções 2.3 e 3.3. Observação importante: **os prompts de execução dos passos 0–6 (os "Prompt do passo X") não estão neste grupo** — eles pertencem aos capítulos 3 a 9 da Fase de Análise, que não estão nestes três arquivos e serão extraídos dos arquivos dos grupos correspondentes.

# Metodologia "APES IA5K" — Grupo 2: Passo 0 (Chat de dúvidas) e Passo 1 (Design System)

> Todos os blocos de prompt transcritos VERBATIM, identificados pelo título que a metodologia lhes dá.

---

## 1. Visão geral do grupo

Este grupo cobre os **dois primeiros passos do fluxo de análise** da metodologia:

- **Passo 0 — Chat de dúvidas** (`analise-3.txt`): estabelece um **chat separado, de apoio, apenas para tirar dúvidas** de vocabulário e conceitos, protegendo o chat principal do projeto de poluição de contexto. Não decide nada; só explica. Inclui o **Prompt inicial** que configura esse chat.
- **Passo 1 — Design System** (`analise-4.txt`): define o **design system** como a "camada visual" do projeto, materializada no arquivo **`docs/DESIGN.md`**. Fornece um **DESIGN.md pronto para uso** (Admin Logic, front matter YAML + seções Markdown), e ensina **três caminhos** para criar um DESIGN.md próprio: a partir de **imagem**, a partir de **HTML/CSS**, ou usando a ferramenta **Stitch** (do Google). O DESIGN.md será consumido junto com o FSD.md na fase de codificação.

A ideia central do grupo: **separar aprendizado de decisão** (Passo 0) e **transformar intenção visual em regras claras para a IA** (Passo 1), para que a IA codificadora não invente o visual a cada tela.

Posição no fluxo: estes passos vêm **antes** da exploração da ideia, do PRD e do FSD. O DESIGN.md pronto será usado como entrada na **criação do FSD** (a IA do FSD considera `PRD.md` + `DESIGN.md`).

---

## 2. Capítulo 1 — Passo 0: Chat de dúvidas


### 2.1 Objetivo do capítulo

Criar um **chat separado, apenas para dúvidas**, como espaço de apoio ao projeto. Nele o usuário pode perguntar o significado de termos técnicos, pedir exemplos simples e entender conceitos que aparecerem durante a criação do sistema — **sem contaminar o chat principal** com explicações gerais que a IA possa confundir com decisões do projeto.

### 2.2 Passos exatos na ordem

1. **Antes de começar a criar a documentação do sistema**, crie um chat separado apenas para tirar dúvidas.
2. Use o **Prompt inicial** (abaixo) para iniciar esse chat de dúvidas.
3. **Ajuste as tecnologias do prompt** à sua stack, se necessário (trocar PHP, MySQL, HTML, CSS, JavaScript, Bootstrap por outras tecnologias).
4. Durante o fluxo, ao encontrar um termo desconhecido (ex.: CRUD, permissão), pergunte **neste chat** de dúvidas.
5. Ao entender o conceito, **volte ao chat principal** da etapa correta de análise e registre lá apenas o que for **decisão**.
6. Use modelo **sem raciocínio** para este chat (modelos com raciocínio ficam para explorar a ideia, PRD, revisão de inconsistências e FSD).

### 2.3 Regra central: dúvida × decisão

- Uma **dúvida** serve para entender.
- Uma **decisão** define como o sistema será.
- Regra prática: se a pergunta começa com **"o que é"** → dúvida; se começa com **"o sistema deve ter"** → decisão; se a resposta **muda o comportamento do sistema** → leve para o chat principal.
- Este chat **não deve decidir nada sozinho** e **não deve registrar decisões oficiais** do sistema.
- Se uma explicação gerar uma decisão importante, **copie essa decisão para o chat correto da etapa de análise**, em uma frase clara.
- O chat de dúvidas **não deve gerar documentos** do projeto (PRD, FSD, DESIGN.md); nem definir funcionalidades, regras de negócio, tecnologias, permissões, integrações ou decisões finais.

### 2.4 Modelo de IA a usar

- Use um **modelo sem raciocínio** (suficiente para explicações simples e diretas).
- Deixe os **modelos com raciocínio** para: explorar a ideia, criar o PRD, revisar inconsistências, montar o FSD.
- Exceção: se a dúvida for muito complexa, pode-se usar modelo com raciocínio.

### 2.5 Tabela da metodologia: "Diferença entre dúvida e decisão"

| Situação | Tipo | Onde tratar |
|---|---|---|
| O que é auditoria? | Dúvida | Chat de dúvidas |
| O sistema deve ter auditoria? | Decisão | Chat de explorar ideias |
| O que é dashboard? | Dúvida | Chat de dúvidas |
| Quais informações o dashboard deve mostrar? | Decisão | Chat de explorar ideias |
| O que é Bootstrap? | Dúvida | Chat de dúvidas |
| O sistema será feito com Bootstrap? | Decisão técnica | Chat de decisões técnicas |
| O que é soft delete? | Dúvida | Chat de dúvidas |
| O cadastro de clientes usará soft delete? | Decisão técnica e funcional | Chat de decisões técnicas |

### 2.6 Exemplos de boas perguntas para o chat de dúvidas (listados na metodologia)

O que é CRUD? / O que significa autenticação? / O que é auditoria em um sistema? / O que é Bootstrap? / O que significa regra de negócio? / O que é uma permissão de usuário? / O que é dashboard? / O que é API? / O que é deploy?

### 2.7 Exemplos de perguntas que NÃO devem ser feitas neste chat (são decisões)

O sistema deve ter pagamento parcial? / O gerente poderá excluir contas? / O sistema terá integração com banco? / O dashboard deve mostrar quais indicadores? / A auditoria deve ser obrigatória? / O sistema terá login com dois perfis de usuário? / Os clientes poderão editar seus próprios dados?

> Essas decisões devem ser feitas nos passos corretos da análise: **chat de exploração da ideia, criação do PRD ou criação do FSD** (e, para decisões técnicas, no chat de decisões técnicas).

### 2.8 Blocos "Copiar" — Exemplos de diálogo (transcritos verbatim)

**Exemplo 1 — pergunta feita no chat principal (o que NÃO fazer):**

```
O que é pagamento parcial?
```

**Exemplo 2 — pergunta no chat de dúvidas:**

```
O que é auditoria em um sistema?
```

**Exemplo 3 — decisão que deve ser levada ao chat principal após entender o conceito (frase clara):**

```
Quero incluir auditoria no sistema.

O sistema deve registrar quem criou, editou ou excluiu informações importantes, incluindo data, hora, usuário responsável e tipo de ação realizada.
```

**Exemplo 4 — pergunta de uso (termo "CRUD" em sistema de contas a pagar):**

```
O que é CRUD? Explique como se eu nunca tivesse programado e use um exemplo em um sistema de contas a pagar.
```

**Exemplo 5 — pergunta de uso (termo "permissão" durante a criação do PRD):**

```
O que é permissão de usuário em um sistema web? Explique com um exemplo simples.
```

**Exemplo 6 — decisão que o usuário escreve no chat principal depois do segundo exemplo de uso:**

```
O sistema terá dois perfis de usuário:

- administrador: pode acessar todas as funcionalidades;
- operador: pode cadastrar e consultar registros, mas não pode gerenciar usuários nem acessar configurações.
```

### 2.9 PROMPT PRINCIPAL — "Prompt inicial" (transcrição VERBATIM integral)

> Título na metodologia: **Prompt inicial** (abaixo do título "Prompt" / bloco "Copiar"). Texto integral:

```
## Objetivo

Atue como analista de sistemas e programador experiente.

Este chat é exclusivo para tirar dúvidas e explicar termos técnicos relacionados à criação de sistemas web.

Vou tirar dúvidas sobre sistemas web, PHP, MySQL, HTML, CSS, JavaScript, Bootstrap, análise de sistemas, regras de negócio, documentação, segurança, banco de dados, interface, deploy e boas práticas de desenvolvimento.

Responda sempre:

- com linguagem simples;
- com explicações adequadas para iniciantes;
- sem se estender demais;
- com exemplos práticos quando ajudarem na compreensão;
- explicando termos técnicos antes de usá-los;
- sem assumir que eu já sei programar;
- sem tomar decisões finais pelo projeto principal.

Este chat não deve gerar documentos do projeto, como PRD, FSD ou DESIGN.md. Esses documentos serão criados em outros chats, nas etapas corretas do fluxo.

Este chat também não deve definir funcionalidades, regras de negócio, tecnologias, permissões, integrações ou decisões finais do projeto principal.

Quando uma pergunta envolver uma decisão importante sobre o sistema, explique o assunto e me avise que essa decisão deve ser levada para o chat principal da etapa correta.

Quando houver dúvida sobre informações atuais, ferramentas, versões, recursos recentes ou boas práticas que possam ter mudado, faça pesquisa antes de responder.

Responda SIM se entendeu.
```

**Nota de uso do prompt (Importante):** o prompt referencia tecnologias comuns em sistemas web (PHP, MySQL, HTML, CSS, JavaScript, Bootstrap). Se o projeto usar outra linguagem/banco/biblioteca/framework, **ajuste antes de usar**:
- Python em vez de PHP → troque PHP por Python;
- PostgreSQL em vez de MySQL → troque MySQL por PostgreSQL;
- Tailwind CSS em vez de Bootstrap → troque Bootstrap por Tailwind CSS;
- Laravel → inclua Laravel na lista de assuntos;
- WordPress → inclua WordPress na lista de assuntos.

### 2.10 Fechamento do capítulo

O chat de dúvidas separa aprendizado de decisão. Isso ajuda a IA a trabalhar melhor, reduz confusão e melhora a qualidade dos documentos dos próximos passos.

---

## 3. Capítulo 2 — Passo 1: Design System


### 3.1 Objetivo do capítulo

Antes de pedir à IA para codificar, definir **como o sistema deve parecer** por meio de um **design system** consolidado no arquivo **`docs/DESIGN.md`**. Sem isso, a IA toma decisões visuais sozinha (cores, botões, espaçamentos, fontes, tabelas, menus, cards, formulários) e o resultado fica inconsistente — cada tela parece pertencer a um sistema diferente.

### 3.2 Conceito: o que é design system

**Design system** = conjunto de regras visuais e padrões de interface usados para manter a aparência de um sistema consistente. "Em linguagem simples, é como um manual visual." Define: cores; fontes de títulos e textos; botões; formulários; tabelas; espaçamento entre elementos; como mostrar erro, sucesso, aviso e carregamento; o estilo visual a seguir.

### 3.3 Por que isso importa ao codificar com IA

- Um desenvolvedor humano segue referências visuais, bibliotecas de componentes, padrões da empresa ou orientações de um designer. **A IA também precisa dessas referências.**
- Sem design system, um prompt como "Crie um painel administrativo para controlar clientes e pedidos." é **vago** — a IA pode gerar algo moderno demais, colorido demais, simples demais, parecido com template genérico, inconsistente com outras telas, ou difícil de adaptar depois.
- Com `docs/DESIGN.md`, a IA não inventa tudo do zero; segue um padrão.

### 3.4 PROMPTS de exemplo do capítulo (blocos "Copiar", transcritos verbatim)

**Exemplo de prompt VAGO (evitar):**

```
Crie um painel administrativo para controlar clientes e pedidos.
```

**Exemplo de prompt MELHOR (recomendado):**

```
Crie um painel administrativo para controlar clientes e pedidos respeitando o arquivo docs/DESIGN.md do projeto.

Use as cores, tipografia, espaçamentos, botões, tabelas, cards e padrões de estados definidos no design system.
```

### 3.5 Tabela da metodologia: "Vocabulário técnico" (Termo / Explicação simples)

| Termo | Explicação simples |
|---|---|
| Design system | Conjunto de regras visuais e padrões de interface de um produto. |
| Interface | Parte visual do sistema com a qual o usuário interage. |
| Componente | Bloco reutilizável da interface, como botão, card, menu, campo ou tabela. |
| Token de design | Valor padronizado usado no visual, como uma cor, tamanho de fonte ou espaçamento. |
| Tipografia | Regras de uso das fontes, tamanhos de texto, pesos e espaçamentos entre linhas. |
| Espaçamento | Distância entre os elementos da tela. |
| Estado visual | Aparência de um elemento em uma situação específica, como erro, sucesso, carregamento ou campo selecionado. |
| DESIGN.md | Arquivo em Markdown que descreve o design system para ser entendido por pessoas e ferramentas de IA. |

### 3.6 O que é o arquivo DESIGN.md

- Arquivo em **Markdown** (formato de escrita com texto puro e marcações como títulos, listas e blocos de código) que descreve o design system do projeto.
- No fluxo, ele **orienta a IA codificadora sobre como criar a interface**.
- É usado **junto com o FSD.md**: o FSD.md explica **como o sistema deve funcionar**; o DESIGN.md explica **como a interface deve parecer e se comportar visualmente**. Na fase de codificação, a IA deve consultar **os dois documentos**.
- O arquivo tem **duas partes principais**:
  1. **Front matter** — área de configuração no topo do arquivo, entre três traços (`---`...`---`), com dados estruturados (nome do design system, cores, fontes, tamanhos, espaçamentos). Ex.: `primary: '#0f2d7b'` informa a cor principal. "A parte estruturada mostra os valores exatos."
  2. **Parte explicativa** — texto comum com títulos e explicações de como aplicar as regras visuais (ex.: "Primary: Used for main navigation, primary actions, and active states."). "A parte explicativa mostra a intenção de uso." **A IA precisa das duas coisas.**

### 3.7 DESIGN.md PRONTO PARA USO (transcrição VERBATIM integral)

> Título na metodologia: **"DESIGN.md pronto para uso"** (índice de prompts). A metodologia manda: "Copie o conteúdo abaixo e salve em um arquivo chamado: `docs/DESIGN.md`". Se a pasta `docs` ainda não existir, ela será criada na etapa de codificação. Conteúdo integral:

```
---
name: Admin Logic
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#444651'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#757682'
  outline-variant: '#c5c5d3'
  surface-tint: '#425aa9'
  primary: '#0f2d7b'
  on-primary: '#ffffff'
  primary-container: '#2c4593'
  on-primary-container: '#a5b7ff'
  inverse-primary: '#b6c4ff'
  secondary: '#97378d'
  on-secondary: '#ffffff'
  secondary-container: '#fd8feb'
  on-secondary-container: '#7b1c74'
  tertiary: '#253549'
  on-tertiary: '#ffffff'
  tertiary-container: '#3b4b61'
  on-tertiary-container: '#abbbd4'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dce1ff'
  primary-fixed-dim: '#b6c4ff'
  on-primary-fixed: '#00164f'
  on-primary-fixed-variant: '#28418f'
  secondary-fixed: '#ffd7f3'
  secondary-fixed-dim: '#ffabee'
  on-secondary-fixed: '#390036'
  on-secondary-fixed-variant: '#7b1c73'
  tertiary-fixed: '#d3e4fe'
  tertiary-fixed-dim: '#b7c8e1'
  on-tertiary-fixed: '#0b1c30'
  on-tertiary-fixed-variant: '#38485d'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  headline-lg:
    fontFamily: Public Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Public Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Public Sans
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
  data-mono:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 16px
  margin: 24px
---

## Brand & Style

This design system is engineered for high-utility corporate environments where data density and clarity are paramount. The brand personality is authoritative yet unobtrusive, prioritizing functional efficiency over decorative flair. It targets administrative professionals, HR managers, and system auditors who require a "cockpit" view of organizational health.

The design style follows a **Corporate / Modern** aesthetic. It utilizes a refined structural grid, subtle tonal layering, and high-precision typography to organize complex information hierarchies. The interface aims to evoke a sense of stability, precision, and institutional trust, ensuring that users can process large volumes of administrative data without cognitive fatigue.

## Colors

The color strategy uses the primary brand blue (#2C4593) to anchor the interface in professionalism and trust, while the secondary plum (#95358B) is reserved for highlighting strategic insights and distinct administrative actions. 

- **Primary:** Used for main navigation, primary actions, and active states.
- **Secondary:** Used for analytical highlights, specific module accents (e.g., HR or Finance), and secondary CTA buttons.
- **Surface Scale:** A range of cool grays (Slate) provides the foundation for the "Data-Dense" look, using #F1F5F9 for backgrounds and #FFFFFF for content cards.
- **Functional Colors:** Standardized Red (Error), Amber (Warning), and Emerald (Success) are used sparingly to signal system status within list views and KPI cards.

## Typography

The typography system is split between **Public Sans** for structural headers and **Inter** for data-heavy content. 

- **Public Sans** provides an institutional, trustworthy feel for module headers and page titles.
- **Inter** is utilized for its exceptional legibility at small sizes. 
- **Data Precision:** For tables and KPI cards, "tabular figures" (monospaced numbers) must be enabled via `tnum` to ensure that numerical columns align perfectly for easy visual scanning and comparison.

## Layout & Spacing

This design system employs a **Fluid Grid** with a strict 4px baseline to maximize screen real estate. 

- **Grid:** A 12-column system is used for dashboard layouts. 
- **Density:** Padding is intentionally compact (8px-12px in list items) to allow for more rows of data per viewport. 
- **Modular Layouts:** Page structures should prioritize a "Top-Down" hierarchy: Global KPI cards at the top (spanning 3 columns each), followed by a primary Data Table or List View (spanning 8-12 columns), and optional side-panel modules for Task Management or Audit Logs.

## Elevation & Depth

To maintain a clean and professional appearance, this design system uses **Tonal Layers** supplemented by **Low-Contrast Outlines**. 

- **Layering:** The application background is #F8FAFC. Content containers (cards/lists) use #FFFFFF with a 1px border of #E2E8F0.
- **Depth:** Physical shadows are used only for transient elements like dropdown menus, tooltips, or modals. These shadows are "Ambient": highly diffused, low opacity (e.g., `0px 4px 12px rgba(0, 0, 0, 0.05)`), and neutral in tint.
- **Interactivity:** Hover states are indicated by a subtle shift in background color (e.g., white to #F1F5F9) rather than an increase in shadow depth, keeping the interface feeling grounded and stable.

## Shapes

The shape language is **Soft (0.25rem)**. This provides a modern touch without sacrificing the "serious" nature of administrative software. 

- **Standard Elements:** Buttons, input fields, and small cards use a 4px (0.25rem) radius.
- **Containers:** Larger modules or dashboard sections use 8px (0.5rem) to provide a clear visual container for grouped data.
- **Status Pills:** Status chips use a full-pill radius (100px) to distinguish them from actionable buttons and interactive fields.

## Components

- **KPI Cards:** Minimalist blocks containing a `label-md` title, a `headline-lg` value (using tabular figures), and a small trend indicator. No decorative icons; focus purely on the metric.
- **List Views:** High-density rows with 1px dividers. Use `body-sm` for secondary metadata and `data-mono` for IDs or numerical values. Column headers should be `label-md` and sticky.
- **Buttons:** 
  - *Primary:* Solid #2C4593 with white text. 
  - *Secondary:* Ghost style with #2C4593 border and text. 
  - *Tertiary:* Flat #95358B for specific administrative "Special" actions.
- **Input Fields:** Outlined style with a 1px #CBD5E1 border. Focused states use a 2px #2C4593 border. Labels are positioned above the field using `label-md`.
- **Administrative Modules:** Side-panels or collapsible "Drawers" are used for editing user permissions or viewing task details, maintaining the context of the main list view.
- **Status Chips:** Small, condensed pills with light background tints (e.g., Light Green bg with Dark Green text) to denote "Active," "Pending," or "Archived" states.
```

**Observações sobre o DESIGN.md pronto:**
- Foi criado para **sistemas administrativos**: painéis, CRMs simples, sistemas internos, cadastros, dashboards, controles financeiros, agendas, ferramentas de gestão.
- Estilo **corporativo, limpo e moderno**; valoriza clareza, organização e boa leitura de dados.
- Salvar em **`docs/DESIGN.md`** (a pasta `docs` é criada na etapa de codificação se não existir).

### 3.8 O DESIGN.md é obrigatório?

Não é obrigatório para criar um sistema com IA, mas aumenta muito o controle sobre o resultado visual. Sem ele, a IA cria a interface com base no próprio julgamento; com ele, ela tem um padrão para seguir. É especialmente importante quando o projeto tem várias telas (ex.: dashboard, login, cadastro de clientes, cadastro de produtos, listagem de pedidos, relatórios, configurações, tela de permissões, tela de logs) — principalmente se cada tela for criada em um momento ou chat diferente.

### 3.9 Posso reutilizar o mesmo DESIGN.md em vários sistemas?

Sim. Útil para: sistemas internos de uma empresa; painéis administrativos; projetos de uma mesma marca; sistemas vendidos para clientes diferentes com a mesma base visual; produtos de uma mesma empresa/agência/software house. Para variar a aparência, crie outro DESIGN.md (ex.: um para sistemas administrativos, um para landing pages, um para apps mobile, um para lojas virtuais, um para dashboards financeiros). **O importante é não deixar a IA adivinhar o visual toda vez.**

### 3.10 Caminhos para criar um DESIGN.md (pontos de partida)

Qualquer boa LLM pode ajudar (ChatGPT, Gemini, Claude), inclusive ferramentas de codificação (Claude Code, Codex, Antigravity) e ferramentas de interface (Stitch do Google, Claude Design). O ponto de partida pode ser: uma **descrição textual**; uma **imagem de referência**; um **print de tela**; um **site existente**; **arquivos HTML e CSS**; uma **interface criada no Stitch**; uma **interface gerada ou refinada em ferramenta visual de IA**. O importante: no final, ter um arquivo claro salvo como **`docs/DESIGN.md`**.

### 3.11 PROMPT — "Criar um DESIGN.md a partir de uma imagem" (transcrição VERBATIM integral)

> Título na metodologia: **"Prompt para criar um DESIGN.md a partir de imagem"** (índice: "Criar um DESIGN.md a partir de uma imagem"). Usar em uma IA que aceite análise de imagem. "O objetivo não é copiar cegamente a interface. O objetivo é extrair padrões visuais." Texto integral:

```
# Prompt para criar um DESIGN.md a partir de imagem

Analise a imagem anexada e crie um arquivo `DESIGN.md` para orientar uma IA codificadora na criação de interfaces semelhantes.

O objetivo não é copiar a imagem exatamente, mas extrair um design system reutilizável.

Analise e descreva:

1. Identidade visual geral
2. Paleta de cores, com valores hexadecimais aproximados
3. Tipografia sugerida
4. Espaçamentos
5. Arredondamento de bordas
6. Estilo de botões
7. Estilo de formulários
8. Estilo de tabelas, cards, menus e componentes principais
9. Estados visuais: sucesso, erro, alerta, vazio e carregamento
10. Regras de aplicação para manter consistência visual

Crie o arquivo no formato `DESIGN.md`.

Use:

- front matter em YAML no topo do arquivo;
- seções em Markdown após o front matter;
- linguagem clara para humanos;
- valores objetivos para que uma IA codificadora consiga aplicar o design system.

Não inclua explicações fora do arquivo.
Entregue apenas o conteúdo completo do `DESIGN.md`.
```

**Revisão após gerar a partir de imagem:** confira se as cores fazem sentido; se os nomes das fontes são possíveis de usar; se os componentes estão descritos com clareza; se o arquivo não está genérico demais; se o estilo combina com o tipo de sistema desejado.

### 3.12 PROMPT — "Criar um DESIGN.md a partir de HTML e CSS" (transcrição VERBATIM integral)

> Título na metodologia: **"Prompt para criar um DESIGN.md a partir de HTML e CSS"** (índice: "Criar um DESIGN.md a partir de HTML e CSS"). Útil quando há: página pronta, template comprado, landing page, layout antigo, interface exportada de ferramenta, arquivos gerados por outra IA. Enviar os arquivos HTML e CSS para a IA e usar o prompt. Texto integral:

```
# Prompt para criar um DESIGN.md a partir de HTML e CSS

Analise os arquivos HTML e CSS anexados e crie um arquivo `DESIGN.md` para orientar uma IA codificadora na criação de novas telas com o mesmo padrão visual.

O objetivo não é documentar cada linha do código, mas extrair o design system usado na interface.

Identifique:

1. Paleta de cores
2. Tipografia
3. Escala de espaçamento
4. Arredondamento de bordas
5. Sombras e profundidade
6. Estrutura de layout
7. Estilo de botões
8. Estilo de campos de formulário
9. Estilo de cards, tabelas, menus e mensagens
10. Padrões de responsividade
11. Estados visuais de erro, sucesso, alerta, carregamento e vazio
12. Recomendações para aplicar o mesmo visual em novas telas

Crie o arquivo no formato `DESIGN.md`.

Use:

- front matter em YAML no topo;
- explicações em Markdown;
- valores objetivos sempre que possível;
- nomes claros para cores, fontes, espaçamentos e componentes.

Não inclua código HTML ou CSS completo.
Não copie classes desnecessárias.
Entregue apenas o conteúdo final do `DESIGN.md`.
```

### 3.13 Caminho: criar DESIGN.md usando o Stitch (passo a passo)

**O que é:** o Stitch (do Google) é uma ferramenta de IA para criação de interfaces — gera telas para sites e apps a partir de descrições em texto e referências visuais. Ajuda a criar a identidade visual antes da codificação.

**Fluxo da ideia:** descrever o tipo de sistema → Stitch gera a interface visual → ajustar a interface conversando com a ferramenta → extrair/registrar as regras visuais em um DESIGN.md → o arquivo orienta a IA codificadora.

**Passo a passo sugerido no Stitch:**
1. Acesse o Stitch: `https://stitch.withgoogle.com`.
2. Marque a opção **"Web"** e crie um novo projeto.
3. Descreva o sistema que você quer criar.
4. Depois que o Stitch gerar a primeira versão, peça ajustes.
5. Se quiser direcionar melhor o visual, peça variações.
6. Escolha a versão que fizer mais sentido para o projeto.

**Exemplo de descrição inicial (bloco "Copiar", verbatim):**

```
Crie o design de um painel administrativo moderno para um sistema financeiro.

O sistema deve ter sidebar, cards de indicadores, tabela de lançamentos de receitas e despesas, categorias e gráficos dos gastos do mês.

Use um estilo limpo, profissional, claro e fácil de ler.
A interface será usada por pessoas que precisam consultar informações rapidamente.
```

**Exemplo de pedido de ajustes (bloco "Copiar", verbatim):**

```
Deixe a interface mais adequada para um sistema administrativo real.

Reduza elementos decorativos, melhore a leitura das tabelas, use espaçamentos mais consistentes e mantenha foco em clareza e organização.
```

**Exemplo de pedido de variações (bloco "Copiar", verbatim):**

```
Crie três variações visuais para este painel:

1. Corporativo e discreto
2. Moderno e leve
3. Mais colorido, mas ainda profissional

Mantenha a mesma estrutura geral da interface.
```

**Salvando os arquivos do projeto no Stitch:**
- Salve o projeto dentro da própria ferramenta para ajustes futuros (pode-se renomear o Design System clicando no ícone de lápis no topo da janela).
- Baixe os arquivos gerados pelo Stitch e guarde tudo com cuidado.
- Arquivo principal: **`DESIGN.md`** (contém o Design System). Também é útil salvar **`code.html`** (exemplo em HTML da tela criada) e **`screen.png`** (imagem da tela gerada) como referência visual adicional.
- **Para exportar:** clique na imagem do painel no canvas do Stitch → acesse a opção **Exportar** → escolha a opção **`.zip`** → clique em **Exportar** e baixe o arquivo ZIP → abra o ZIP no computador.

**Tabela da metodologia: arquivos dentro do ZIP do Stitch**

| Arquivo | Para que serve |
|---|---|
| code.html | Contém um modelo HTML da tela criada no Stitch. |
| screen.png | Contém uma imagem da tela da aplicação. |
| DESIGN.md | Contém o Design System do projeto. |

**Destino na codificação:** quando chegar à fase de codificação, leve esses arquivos para a pasta **`docs/`** — a IA codificadora usa o DESIGN.md como referência principal e consulta code.html e screen.png como apoio visual.

### 3.14 PROMPT — "Prompt para refinar o design antes de gerar o DESIGN.md" (transcrição VERBATIM integral)

> Título na metodologia: **"Prompt para refinar o design antes de gerar o DESIGN.md"**. "Só use este prompt se achar necessário." Texto integral:

```
Analise esta interface e refine o design para uso em um sistema web real.

Priorize:

- clareza visual;
- consistência entre componentes;
- boa leitura em tabelas;
- aparência profissional;
- uso moderado de cores;
- botões fáceis de identificar;
- formulários organizados;
- estados de erro, sucesso, vazio e carregamento.

Depois, descreva quais padrões visuais devem entrar em um arquivo DESIGN.md.
```

### 3.15 Sobre o Claude Design

O Claude Design também pode ajudar na criação de protótipos, telas, apresentações e peças visuais — explorar ideias de interface, testar estilos e criar referências visuais antes da codificação. O capítulo apenas cita essa possibilidade (o fluxo principal do treinamento usa um DESIGN.md pronto e ensina caminhos simples para criar o próprio). "A ferramenta pode variar, mas o objetivo é sempre o mesmo: transformar intenção visual em um documento claro para a IA codificadora seguir."

### 3.16 Cuidados ao criar um DESIGN.md com IA (checklist de revisão)

Um design system criado por IA deve ser revisado — "a IA pode gerar um arquivo bonito no texto, mas com problemas práticos". Verificar:
- se as cores têm bom contraste;
- se os nomes das cores são claros;
- se os tamanhos de fonte são legíveis;
- se os espaçamentos são coerentes;
- se os botões têm estilos bem definidos;
- se formulários, tabelas e cards foram cobertos;
- se há orientação para estados de erro, sucesso, vazio e carregamento;
- se o visual combina com o tipo de sistema;
- se o arquivo não ficou genérico demais.

**Um DESIGN.md genérico ajuda pouco.** Exemplos da metodologia:

**Exemplo fraco (evitar):**

```
Use cores modernas, botões bonitos e layout limpo.
```

**Orientação melhor (usar):**

```
Use azul escuro como cor principal para navegação e ações primárias.
Use fundo claro em tons de cinza frio.
Cards devem ter fundo branco, borda de 1px e raio de 8px.
Tabelas devem priorizar densidade, boa leitura e cabeçalhos fixos quando possível.
Mensagens de erro devem usar vermelho de forma discreta e explicar o problema em linguagem simples.
```

"A segunda versão dá direção real para a IA."

### 3.17 Como o DESIGN.md será usado no fluxo

- Nesta metodologia, o DESIGN.md será usado **principalmente na criação do FSD**.
- Quando o FSD for gerado, a IA deverá considerar o **PRD.md** e o **DESIGN.md**:
  - O PRD responde: **"O que o sistema precisa fazer?"**
  - O DESIGN.md responde: **"Como a interface deve parecer?"**
  - O FSD junta essas informações e prepara a codificação.
- Na fase de codificação, a IA codificadora deve receber instrução para respeitar o `docs/DESIGN.md`. **Exemplo de instrução (bloco "Copiar", verbatim):**

```
Antes de criar ou alterar qualquer tela, leia e siga o arquivo `docs/DESIGN.md`.

A interface deve respeitar as cores, tipografia, espaçamentos, componentes, estados visuais e estilo geral descritos no design system.

Não invente um novo padrão visual sem autorização.
```

### 3.18 Quando criar um novo DESIGN.md? (regras de reutilização)

**Crie um novo arquivo quando:** o projeto tiver outra marca; o público for muito diferente; o tipo de interface mudar; o sistema exigir outro estilo visual; o cliente já tiver identidade visual própria; você quiser testar uma direção visual diferente.

**Reutilize o mesmo arquivo quando:** os sistemas seguem o mesmo padrão; os projetos são da mesma empresa; você quer acelerar a criação; a identidade visual já está aprovada; o foco é manter consistência.

**Estratégia recomendada para começar:** usar o **DESIGN.md pronto deste treinamento**; depois, quando estiver mais seguro, criar design systems próprios.

### 3.19 Fechamento do capítulo

O design system não existe para complicar; existe para **evitar improviso**. Quanto mais clara a orientação, melhor tende a ser o resultado da IA. O DESIGN.md é uma referência visual permanente: cria telas mais consistentes, reduz retrabalho e dá mais controle. **Você não precisa ser designer para usar um design system** — basta entender a função dele: transformar preferências visuais em regras claras para a IA seguir.

---

## 4. Itens acionáveis (resumo operacional)

1. **Criar o chat de dúvidas** (Passo 0) e iniciá-lo com o **"Prompt inicial"** verbatim (ajustando as tecnologias: PHP/MySQL/HTML/CSS/JavaScript/Bootstrap → stack real do projeto). Manter esse chat isolado das decisões; levar decisões ao chat principal correto.
2. **Salvar o DESIGN.md pronto para uso** em **`docs/DESIGN.md`** (conteúdo verbatim na seção 3.7; pasta `docs` é criada na codificação se não existir).
3. **Alternativa A — criar DESIGN.md a partir de imagem:** usar o **"Prompt para criar um DESIGN.md a partir de imagem"** em IA que aceite análise de imagem; revisar o resultado (contraste, fontes, componentes, genérico demais).
4. **Alternativa B — criar DESIGN.md a partir de HTML/CSS:** usar o **"Prompt para criar um DESIGN.md a partir de HTML e CSS"** enviando os arquivos; revisar o resultado.
5. **Alternativa C — criar DESIGN.md via Stitch:** acessar `https://stitch.withgoogle.com` → opção "Web" → novo projeto → descrever o sistema → pedir ajustes e variações → exportar como `.zip` (contém `code.html`, `screen.png`, `DESIGN.md`) → salvar tudo em **`docs/`**. Opcional: usar o **"Prompt para refinar o design antes de gerar o DESIGN.md"**.
6. **Revisar** qualquer DESIGN.md gerado por IA com o checklist da seção 3.16 (evitar orientações genéricas como "Use cores modernas, botões bonitos e layout limpo").
7. **Na criação do FSD:** garantir que a IA considere **PRD.md + DESIGN.md** juntos.
8. **Na fase de codificação:** incluir a instrução padrão de que **antes de criar ou alterar qualquer tela** a IA deve ler e seguir `docs/DESIGN.md`, sem inventar padrão visual sem autorização.

---

## 5. Avisos sobre conteúdo ausente / observações

- **Não há checklists formais numerados** nos capítulos (todos os "checklists" são listas em bullets descritas acima: boas perguntas do chat de dúvidas, perguntas-proibição, revisão do DESIGN.md de imagem, cuidados ao criar DESIGN.md com IA).
- **Não há comandos de terminal** em nenhum dos dois capítulos — a única URL citada é `https://stitch.withgoogle.com` (Stitch).
- As **tabelas Termo/Explicação** de ambos os capítulos estão transcritas integralmente (seções 2.5, 3.5, 3.13).
- O conteúdo do DESIGN.md pronto está **em inglês** no original (a metodologia o fornece assim); foi transcrito **verbatim**, sem tradução, pois é um entregável a ser usado literalmente. Todo o texto didático dos capítulos está em português.
- No Passo 0, os blocos "Copiar" com exemplos de perguntas (ex.: "O que é pagamento parcial?") não são prompts a serem executados, mas exemplos ilustrativos de diálogo — todos transcritos na seção 2.8.

