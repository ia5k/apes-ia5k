# Referência APES IA5K — Análise: explorar a ideia, PRD, decisões técnicas, FSD e validação

# Grupo 3 — Passo 2 (Explorar a ideia) e Passo 3 (PRD)


Fontes analisadas:
- `analise-5.txt` — **Passo 2: Explorar a ideia**
- `analise-6.txt` — **Passo 3: PRD**

---

## 1. Visão geral do grupo

Este grupo cobre a fase de **descoberta e consolidação do produto**, antes de qualquer decisão técnica ou codificação.

- O **Passo 2 — Explorar a ideia** transforma uma ideia inicial vaga em uma visão clara do sistema por meio de uma **entrevista incremental** conduzida pela IA. Nenhum documento final é obrigatório ao final deste passo: o entregável é a **conversa organizada** (resumo consolidado), que alimenta o passo seguinte.
- O **Passo 3 — PRD** transforma toda a conversa do Passo 2 em um documento chamado **PRD.md** (Documento de Requisitos do Produto / Product Requirements Document), puramente funcional, sem tecnologia, que serve de ponte entre a ideia organizada e a especificação funcional detalhada (FSD).

Posição no fluxo da metodologia:

```
Ideia explorada -> PRD -> Decisões Técnicas do Projeto -> FSD -> Codificação
```

O DESIGN.md (já criado ou escolhido no Passo 1) será usado "com mais força" na criação do FSD.

Regras de ouro do grupo (valem nos dois passos):
- **Nenhuma decisão técnica aqui**: nada de linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem, estrutura de pastas, arquitetura, tabelas ou detalhes de código. Essas decisões entram depois, nos passos de decisões técnicas e no FSD.
- **O PRD explica o produto; o FSD detalha o funcionamento; a codificação vem depois.**
- Usar **modelo com raciocínio** em ambos os passos (a IA precisa analisar, comparar, organizar e identificar lacunas — não apenas responder perguntas simples).
- Não inventar conteúdo: a IA só pode usar o que foi **discutido, aprovado ou claramente confirmado** na conversa.

---

## 2. Capítulo: Passo 2 — Explorar a ideia

### 2.1 Objetivo do capítulo

Transformar uma ideia inicial em uma visão mais clara do sistema. **Ainda não** se cria PRD, código, nem se escolhe tecnologia. O objetivo é entender: o que o sistema deve fazer, quem vai usar, qual problema resolve, quais funcionalidades fazem sentido para a primeira versão e quais dúvidas precisam ser respondidas antes de criar o PRD.

Metáfora do livro: antes de construir uma casa, ninguém começa colocando tijolos — primeiro se entende quem vai morar ali, quantos cômodos, quais necessidades são mais importantes e o que fica para uma reforma futura.

O resultado deste passo **não é um documento final**, e sim uma conversa bem conduzida com decisões mais claras sobre o sistema. Essa conversa será usada no próximo passo para criar o PRD.md.

### 2.2 Passos EXATOS na ordem

1. **Criar um chat novo** para explorar a ideia — separado do chat de dúvidas. Usar este chat apenas para explorar a ideia do sistema. Dúvidas conceituais continuam indo para o chat do Passo 0.
2. **Escolher a forma do prompt inicial** (duas opções):
   - **Forma 1 — descrição simplificada**: informa apenas a ideia principal, o público usuário e o problema a resolver. Não lista funcionalidades com precisão. A IA conduz mais a entrevista, faz perguntas, sugere funcionalidades comuns e separa essencial de adiável. Indicada quando você ainda está explorando a ideia.
   - **Forma 2 — descrição mais detalhada**: descreve com precisão público, objetivo, grupos de funcionalidades, recursos principais e perfis de usuário. A IA toma menos decisões e faz menos perguntas; atua como organizadora da ideia, identificando lacunas, inconsistências, itens fora de escopo e pontos a melhorar antes do PRD. Indicada quando você já pensou no sistema antes de iniciar a entrevista.
   - Regra prática: se não sabe bem o que o sistema terá → descreva simples e deixe a IA investigar; se já sabe o que quer → descreva com detalhes e use a IA para organizar, revisar e melhorar.
3. **Enviar o prompt inicial adaptado ao seu sistema** (o "Prompt modelo" abaixo, preenchido). As duas formas funcionam; a diferença é o papel da IA (descoberta vs. organização/refinamento).
4. **Responder às perguntas da IA** com calma e linguagem simples. Não precisa saber tudo no começo; a IA ajuda a descobrir o que falta.
5. **Lidar com as sugestões da IA**: separar essencial / útil depois / avançado demais; não incluir tudo automaticamente no escopo da primeira versão.
6. **Verificar que a conversa está clara** (ver checklist "O que deve ficar claro antes de avançar"). Não avançar se a ideia ainda estiver vaga demais.
7. **Enviar o prompt de fechamento da exploração** (segundo prompt principal do capítulo) — consolida as decisões e prepara a criação do PRD, sem criar o PRD ainda.
8. **Confirmar a conclusão do passo** (ver checklist "Como saber se este passo foi concluído?").

**Importante (bloco destacado na metodologia):** para concluir este passo, execute os **dois prompts principais do capítulo** — o primeiro inicia a exploração da ideia; o segundo consolida o que foi decidido e prepara a criação do PRD.

### 2.3 TODOS os prompts completos (transcrição verbatim)

#### Prompt 2.A — Exemplo de ideia vaga (ilustrativo)

Contexto: "Uma ideia inicial pode ser vaga". Bloco Copiar:

```
Quero criar um sistema para uma clínica.
```

#### Prompt 2.B — Exemplo de ideia mais clara (ilustrativo)

Contexto: "Exemplo de ideia mais clara". Bloco Copiar:

```
Quero criar a primeira versão de um sistema web para uma clínica de fisioterapia.

O sistema será usado por atendentes e administradores.

Na primeira versão, ele deve permitir cadastrar pacientes, cadastrar profissionais, registrar agendamentos e consultar a agenda por data e profissional.

O administrador poderá gerenciar usuários e serviços.

Os pacientes não terão acesso ao sistema nesta primeira versão.
```

#### Prompt 2.C — Prompt inicial, Forma 1 (descrição simplificada) — exemplo

Contexto: "Forma 1: descrição simplificada". Bloco Copiar:

```
Quero criar um sistema web para controle financeiro pessoal.

O sistema será usado por pessoas que querem organizar melhor suas receitas, despesas e contas do mês.

O objetivo principal é ajudar o usuário a entender para onde o dinheiro está indo e acompanhar se está gastando mais do que recebe.

Ainda não sei exatamente quais funcionalidades a primeira versão deve ter. Quero que você me ajude a descobrir isso por meio de perguntas.
```

#### Prompt 2.D — Prompt inicial, Forma 2 (descrição mais detalhada) — exemplo

Contexto: "Forma 2: descrição mais detalhada". Bloco Copiar:

```
Quero criar um sistema web de contas a pagar e a receber para pequenos negócios.

O sistema será usado por funcionários administrativos para cadastrar receitas, despesas, clientes, fornecedores e categorias financeiras.

Gerentes poderão acompanhar relatórios e indicadores.

Administradores poderão gerenciar usuários, permissões e configurações do sistema.

Na primeira versão, o sistema deve permitir:

- cadastrar clientes;
- cadastrar fornecedores;
- cadastrar contas a pagar;
- cadastrar contas a receber;
- marcar contas como pagas ou recebidas;
- consultar contas por período, status e categoria;
- visualizar um painel com resumo financeiro;
- exportar relatórios em CSV.

Quero que você analise essa ideia, identifique lacunas e me ajude a organizar o escopo da primeira versão.
```

#### Prompt 2.E — PROMPT MODELO (o prompt principal do Passo 2, o mais livre do fluxo)

Contexto: "Prompt modelo — Este é o prompt mais livre do fluxo. Use o modelo abaixo como ponto de partida, mas adapte o conteúdo para o sistema que deseja criar. Forneça todas as informações que já tiver no momento. Não precisa estar perfeito. A IA vai ajudar a organizar." Bloco Copiar:

```
Quero criar um sistema web.

O sistema será de **[DESCREVA AQUI O TIPO DO SISTEMA. Exemplos: gestão financeira pessoal; contas a pagar e a receber; agendamento de consultas; controle de estoque; controle de alunos; atendimento ao cliente]**.

## Público usuário do sistema

- [Quem vai usar o sistema no dia a dia? Exemplo: pessoas que desejam controlar suas finanças pessoais; funcionários do departamento administrativo farão os lançamentos.]

- [Quem vai acompanhar ou gerenciar? Exemplo: o próprio usuário acompanhará os resultados; gerentes e diretores utilizarão o sistema para acompanhamento.]

- [Em qual empresa, área ou contexto o sistema será usado? Exemplo: uso pessoal, familiar, pequeno negócio, escola, clínica, escritório ou departamento interno.]

- [Haverá um usuário administrador? O que ele poderá fazer? Exemplo: criar usuários, definir permissões, acessar configurações e gerenciar dados principais.]

## Objetivo principal

[Explique, com suas palavras, o que o sistema precisa resolver e como ele deve ajudar quem vai usá-lo.]

## Primeira versão

Na primeira versão, imagino que o sistema deve permitir:

### [Nome do grupo de funcionalidades 1. Exemplo: Cadastros básicos]

- [Funcionalidade. Exemplo: cadastrar clientes.]

- [Funcionalidade.]

- [Funcionalidade.]

### [Nome do grupo de funcionalidades 2. Exemplo: Operação principal]

- [Funcionalidade.]

- [Funcionalidade.]

- [Funcionalidade.]

### [Nome do grupo de funcionalidades 3. Exemplo: Relatórios, acompanhamento ou dashboard]

- [Funcionalidade.]

- [Funcionalidade.]

- [Funcionalidade.]

### Outros recursos

- [Liste aqui recursos de base que você já sabe que quer, se souber. Exemplos: controle de acesso por e-mail e senha; níveis de usuário; auditoria; log de erros; tela de configurações; exportação de dados.]

---

Atue como analista de sistemas experiente.

Antes de criar qualquer documento final, me ajude a organizar a ideia do sistema por meio de uma entrevista incremental.

Ao longo da entrevista, investigue e organize as informações necessárias para identificar:

1. qual problema o sistema resolve; 
2. quem usará o sistema; 
3. quais funcionalidades são essenciais para a primeira versão; 
4. quais funcionalidades podem ficar para uma versão futura; 
5. quais informações precisam ser armazenadas; 
6. quais regras de negócio já podem ser percebidas; 
7. quais dúvidas precisam ser respondidas antes da criação do PRD; 
8. quais recursos normalmente existem em sistemas desse tipo. 

Use linguagem simples e explique termos técnicos quando aparecerem.

Faça uma pesquisa sobre recursos normalmente adicionados a sistemas desse tipo.

Ao pesquisar recursos comuns, não inclua automaticamente todos eles no escopo.

Na primeira resposta, classifique as sugestões em três grupos:

1. essencial para a primeira versão; 
2. útil, mas pode ficar para depois; 
3. avançado demais para este primeiro projeto. 

Explique brevemente o motivo de cada classificação.

Depois dessa primeira classificação, não repita a lista completa nas próximas rodadas, a menos que eu peça ou que alguma resposta minha mude significativamente o escopo.

Nesta etapa, não defina linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem, estrutura de pastas, tabelas de banco de dados ou detalhes de código.

Essas decisões serão tomadas em uma etapa futura.

## Modo de condução da conversa

Conduza a conversa em modo de entrevista incremental.

Na primeira resposta, apresente apenas um resumo breve do que entendeu sobre o sistema e a classificação inicial dos recursos pesquisados.

Depois da primeira resposta, não repita resumos completos a cada nova rodada de perguntas.

A cada resposta minha, incorpore silenciosamente as informações ao contexto do sistema e avance apenas com o próximo bloco de perguntas necessário.

Em cada nova rodada, faça somente:

1. uma frase curta indicando os próximos temas da investigação; 
2. no máximo 3 perguntas objetivas. para cada pergunta:
 2.1. explique rapidamente por que essa informação é importante;
 2.2. dê exemplos de respostas possíveis;
 2.3. se for possível informe qual padrão será usado caso o usuário não saiba responder.

Não liste novamente tudo o que já foi decidido, exceto se houver contradição, lacuna crítica ou se eu pedir explicitamente.

Não produza o contexto consolidado completo durante a entrevista.

O contexto completo do sistema só deverá ser apresentado quando eu enviar um segundo prompt pedindo o resumo final antes da criação do PRD.

Faça perguntas sempre que precisar de mais informações.

Faça as perguntas em blocos pequenos, com no máximo 3 perguntas por vez, e aguarde minhas respostas antes de continuar.
```

#### Prompt 2.F — Exemplo 1: Sistema de gestão financeira — Descrição simplificada (prompt preenchido)

Contexto: sistema "Finanças Fácil", gestão financeira simples, descrição simplificada. Bloco Copiar:

```
Quero criar um sistema web.

O sistema será de **gestão financeira simples**.

## Público usuário do sistema

- Pessoas que desejam controlar melhor suas finanças, registrando receitas, despesas, pagamentos e recebimentos. Ideal para controle financeiro pessoal.

## Objetivo principal

- O objetivo do sistema é ajudar a organizar a vida financeira de forma simples, visual e prática.

- O sistema deve permitir que usuários autorizados registrem tudo o que entra e tudo o que sai, classifiquem os lançamentos por categoria, formas de pagamento, acompanhem o saldo do mês e identifiquem quais despesas consomem mais dinheiro no orçamento.

- A ideia é criar um sistema fácil de entender, sem termos contábeis complexos, para que pessoas consigam usar no dia a dia. Ele deve funcionar como um painel financeiro: o usuário entra, registra ou consulta movimentações financeiras e consegue responder rapidamente perguntas como:
 + Quanto recebemos este mês?
 + Quanto gastamos?
 + O saldo do mês está positivo ou negativo?
 + Quais despesas ou receitas ainda estão pendentes?
 + Em quais categorias estamos gastando mais?

---

Atue como analista de sistemas experiente.

Antes de criar qualquer documento final, me ajude a organizar a ideia do sistema por meio de uma entrevista incremental.

Ao longo da entrevista, investigue e organize as informações necessárias para identificar:

1. qual problema o sistema resolve;
2. quem usará o sistema;
3. quais funcionalidades são essenciais para a primeira versão;
4. quais funcionalidades podem ficar para uma versão futura;
5. quais informações precisam ser armazenadas;
6. quais regras de negócio já podem ser percebidas;
7. quais dúvidas precisam ser respondidas antes da criação do PRD;
8. quais recursos normalmente existem em sistemas desse tipo.

Use linguagem simples e explique termos técnicos quando aparecerem.

Faça uma pesquisa sobre recursos normalmente adicionados a sistemas desse tipo.

Ao pesquisar recursos comuns, não inclua automaticamente todos eles no escopo.

Na primeira resposta, classifique as sugestões em três grupos:

1. essencial para a primeira versão;
2. útil, mas pode ficar para depois;
3. avançado demais para este primeiro projeto.

Explique brevemente o motivo de cada classificação.

Depois dessa primeira classificação, não repita a lista completa nas próximas rodadas, a menos que eu peça ou que alguma resposta minha mude significativamente o escopo.

Nesta etapa, não defina linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem, estrutura de pastas, tabelas de banco de dados ou detalhes de código.

Essas decisões serão tomadas em uma etapa futura.

## Modo de condução da conversa

Conduza a conversa em modo de entrevista incremental.

Na primeira resposta, apresente apenas um resumo breve do que entendeu sobre o sistema e a classificação inicial dos recursos pesquisados.

Depois da primeira resposta, não repita resumos completos a cada nova rodada de perguntas.

A cada resposta minha, incorpore silenciosamente as informações ao contexto do sistema e avance apenas com o próximo bloco de perguntas necessário.

Em cada nova rodada, faça somente:

1. uma frase curta indicando os próximos temas da investigação; 
2. no máximo 3 perguntas objetivas. para cada pergunta:
 2.1. explique rapidamente por que essa informação é importante;
 2.2. dê exemplos de respostas possíveis;
 2.3. se for possível informe qual padrão será usado caso o usuário não saiba responder.

Não liste novamente tudo o que já foi decidido, exceto se houver contradição, lacuna crítica ou se eu pedir explicitamente.

Não produza o contexto consolidado completo durante a entrevista.

O contexto completo do sistema só deverá ser apresentado quando eu enviar um segundo prompt pedindo o resumo final antes da criação do PRD.

Faça perguntas sempre que precisar de mais informações.

Faça as perguntas em blocos pequenos, com no máximo 3 perguntas por vez, e aguarde minhas respostas antes de continuar.
```

#### Prompt 2.G — Exemplo 2: Sistema de gestão financeira — Descrição avançada (prompt preenchido)

Contexto: sistema "Finanças Fácil", descrição avançada (Forma 2). Bloco Copiar:

```
Quero criar um sistema web.

O sistema será de **gestão financeira simples**, com o nome **Finanças Fácil**.

## Público usuário do sistema

- Pessoas que desejam controlar melhor suas finanças, registrando receitas, despesas, pagamentos e recebimentos.
- Ideal para:
 + Controle financeiro pessoal
 + Controle financeiro familiar
 + Controle financeiro de pequenas empresas

## Objetivo principal

- O objetivo do sistema é ajudar a organizar a vida financeira de forma simples, visual e prática.

- O sistema deve permitir que usuários autorizados registrem tudo o que entra e tudo o que sai, classifiquem os lançamentos por categoria, formas de pagamento, acompanhem o saldo do mês e identifiquem quais despesas consomem mais dinheiro no orçamento.

- A ideia é criar um sistema fácil de entender, sem termos contábeis complexos, para que pessoas consigam usar no dia a dia. Ele deve funcionar como um painel financeiro: o usuário entra, registra ou consulta movimentações financeiras e consegue responder rapidamente perguntas como:
 + Quanto recebemos este mês?
 + Quanto gastamos?
 + O saldo do mês está positivo ou negativo?
 + Quais despesas ou receitas ainda estão pendentes?
 + Em quais categorias estamos gastando mais?

- Mesmo podendo ter vários usuários, o sistema financeiro será único e compartilhado. Ou seja, todos os usuários acessam a mesma base financeira, com os mesmos lançamentos, categorias, relatórios e dashboard, respeitando as permissões de cada perfil.

## Primeira versão

Na primeira versão, imagino que o sistema deve permitir:

### Cadastros básicos

- Cadastrar categorias financeiras, como aluguel, alimentação, financiamentos, transporte, saúde, educação, lazer, salário, receitas e outros.

- Permitir que apenas administradores criem, editem, inativem ou gerenciem categorias financeiras.

- Cadastrar formas de pagamento, como dinheiro, Pix, cartão de débito, cartão de crédito, boleto e transferência.

- Cadastrar contas, como carteira, conta corrente, poupança e cartão.

### Gestão de usuários e permissões

Haverá dois tipos de usuários: **administrador** e **operador**.

#### administrador
- O **administrador** será o gestor principal do sistema.
- Ele terá acesso total ao sistema e poderá criar, editar e inativar usuários.
- A exclusão definitiva de usuários não fará parte da primeira versão, para preservar histórico, relatórios e auditoria.
- O administrador também poderá acessar e alterar as configurações globais do sistema.

#### operador
- O **operador** poderá acessar o sistema e utilizar as funcionalidades financeiras principais, como cadastrar receitas, cadastrar despesas, editar lançamentos financeiros, visualizar relatórios e ajustar as configurações do próprio perfil.
- O operador não terá acesso aos recursos de:
 + gestão de usuários
 + criar categorias
 + criar meios de pagamento
 + cadastrar contas
 + configurações globais do sistema.

#### Usuários inativados
- Usuários inativados não poderão acessar o sistema, mas seus registros e ações anteriores serão mantidos para preservar o histórico, os relatórios e a auditoria do sistema.

#### Recursos de gestão de usuários
- Controle de acesso por e-mail e senha com tela de login.
- Tela de cadastro de usuário feita pelo administrador.
- Recuperação de senha por e-mail.
- Permitir que usuários alterem seus próprios dados básicos de perfil.
- Permitir que usuários alterem sua própria senha.
- Impedir que operadores alterem seu próprio perfil para administrador.

### Lançamentos financeiros

- Cadastro e edição de receitas.
- Cadastro e edição de despesas.
- Listar lançamentos com filtros por período, tipo, categoria, conta e status.
- Informar descrição, valor, data de lançamento, data de pagamento ou recebimento, categoria, forma de pagamento e conta.
- Situação do lançamento:
 + Esta informaçao é apenas visual, não precisa aramazenar em banco de dados.
 + Lançamentos **pendentes** são receitas ou despesas que ainda não possuem data de recebimento ou pagamento preenchida.
 + Lançamentos **realizados** são receitas ou despesas que já possuem data de recebimento ou pagamento preenchida.

### Soft delete

O sistema não terá exclusão física, apenas exclusão lógica.

- O sistema deve manter dois campos para exclusão lógica onde possa identificar quam excluiu o registro e quando ele foi excluído.
- Para categorias, formas de pagamento e contas quando excluídos, não devem aparecer como opção para novos lançamentos, mas devem continuar visíveis nos lançamentos antigos, relatórios e histórico.
- Para lançamentos quando excluídos, não devem aparecer para relatórios, listagens e saldos.
- Registros excluídos podem ser recuperados:
 + Administradores podem recuperar qualquer registro.
 + Operadores podem recuperar apenas seus próprios registros.

### Relatórios

- Movimentações de receitas e despesas
 + Filtros: Período, categoria (todas ou uma), conta (todas ou uma) e Situação (Todas, Pendentes ou Realizadas)
 + Apresentar saldo inicial, e saldo final.
- Despesas pendentes.
 + Filtros: Período.
 + Apresentar total no final.
- Receitas pendentes.
 + Filtros: Período.
 + Apresentar total no final. 
- Resumo por categoria.
 + Filtros: Período.
 + Apresentar total no final
- Exportar dados de relatórios em formato CSV.

### Dashboard

- Exibir o total de receitas do mês.
- Exibir o total de despesas do mês.
- Exibir o saldo do mês.
- Exibir gráfico básico de receitas x despesas.
- Permitir filtro adicional por período.

### Configurações gerais

- A tela de **configurações gerais** permitirá alterar informações globais do sistema, como nome, logo e cores da interface, além de parâmetros administrativos, como tempo máximo de sessão inativa e tempo de retenção dos logs.
- Somente administradores podem acessar este recurso.

### Outros recursos

- Log de erros para facilitar diagnóstico durante o desenvolvimento.
 + Somente em arquivos.
 + Proteger pastas de logs para acessar através de navegador.
 + Criar subpastas por mês e ano
 + Criar arquivo de log por dia.
 + Permitir rotina de limpeza de logs acessível apenas pelo administrador.
 + Permitir ativar e desativar log de erro através de arquivo de configuração.
- Auditoria simples para identificar quam criou ou registro, quando criou, quem alterou e quando alterou. os registros sobre exclusão já foram definidos no **soft delete**.
- Interface simples, responsiva e fácil de usar em computador e celular.
- Validações básicas para evitar lançamentos sem valor, sem data, sem tipo ou sem categoria.
- Mensagens claras de sucesso e erro.

---

Atue como analista de sistemas experiente.

Antes de criar qualquer documento final, me ajude a organizar a ideia do sistema por meio de uma entrevista incremental.

Ao longo da entrevista, investigue e organize as informações necessárias para identificar:

1. qual problema o sistema resolve;
2. quem usará o sistema;
3. quais funcionalidades são essenciais para a primeira versão;
4. quais funcionalidades podem ficar para uma versão futura;
5. quais informações precisam ser armazenadas;
6. quais regras de negócio já podem ser percebidas;
7. quais dúvidas precisam ser respondidas antes da criação do PRD;
8. quais recursos normalmente existem em sistemas desse tipo.

Use linguagem simples e explique termos técnicos quando aparecerem.

Faça uma pesquisa sobre recursos normalmente adicionados a sistemas desse tipo.

Ao pesquisar recursos comuns, não inclua automaticamente todos eles no escopo.

Na primeira resposta, classifique as sugestões em três grupos:

1. essencial para a primeira versão;
2. útil, mas pode ficar para depois;
3. avançado demais para este primeiro projeto.

Explique brevemente o motivo de cada classificação.

Depois dessa primeira classificação, não repita a lista completa nas próximas rodadas, a menos que eu peça ou que alguma resposta minha mude significativamente o escopo.

Nesta etapa, não defina linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem, estrutura de pastas, tabelas de banco de dados ou detalhes de código.

Essas decisões serão tomadas em uma etapa futura.

## Modo de condução da conversa

Conduza a conversa em modo de entrevista incremental.

Na primeira resposta, apresente apenas um resumo breve do que entendeu sobre o sistema e a classificação inicial dos recursos pesquisados.

Depois da primeira resposta, não repita resumos completos a cada nova rodada de perguntas.

A cada resposta minha, incorpore silenciosamente as informações ao contexto do sistema e avance apenas com o próximo bloco de perguntas necessário.

Em cada nova rodada, faça somente:

1. uma frase curta indicando os próximos temas da investigação; 
2. no máximo 3 perguntas objetivas. para cada pergunta:
 2.1. explique rapidamente por que essa informação é importante;
 2.2. dê exemplos de respostas possíveis;
 2.3. se for possível informe qual padrão será usado caso o usuário não saiba responder.

Não liste novamente tudo o que já foi decidido, exceto se houver contradição, lacuna crítica ou se eu pedir explicitamente.

Não produza o contexto consolidado completo durante a entrevista.

O contexto completo do sistema só deverá ser apresentado quando eu enviar um segundo prompt pedindo o resumo final antes da criação do PRD.

Faça perguntas sempre que precisar de mais informações.

Faça as perguntas em blocos pequenos, com no máximo 3 perguntas por vez, e aguarde minhas respostas antes de continuar.
```

> Nota do analista: o texto do prompt original contém os erros de digitação "Esta informaçao", "aramazenar", "quam excluiu", "quam criou ou registro" — transcritos literalmente acima conforme a fonte.

#### Prompt 2.H — Exemplo 3: Sistema contas a pagar e a receber (prompt preenchido)

Contexto: "Exemplo para sistema contas a pagar e a receber". Bloco Copiar:

```
Quero criar um sistema web.

O sistema será de **contas a pagar e contas a receber**.

## Público usuário do sistema

- Funcionários do departamento administrativo farão os lançamentos.
- Gerentes e diretores utilizarão o sistema para acompanhamento.
- O sistema será usado pelo departamento administrativo de uma empresa.
- O sistema terá um usuário administrador. Esse perfil terá acesso total ao sistema e será responsável por criar novos usuários, definir permissões de acesso e configurar informações básicas do sistema.

## Objetivo principal

O sistema deve permitir que o departamento administrativo controle contas a pagar e contas a receber de forma organizada, centralizada e fácil de consultar.

Hoje esse controle é feito em planilhas, o que dificulta o acompanhamento de vencimentos, pagamentos, recebimentos e relatórios.

## Primeira versão

Na primeira versão, imagino que o sistema deve permitir:

### Cadastros básicos

- cadastrar fornecedores;
- cadastrar clientes;
- cadastrar categorias financeiras;
- cadastrar formas de pagamento.

### Contas a pagar

- cadastrar contas a pagar;
- informar vencimento, valor, fornecedor e categoria;
- marcar uma conta como paga;
- filtrar contas por período, status e fornecedor.

### Contas a receber

- cadastrar contas a receber;
- informar vencimento, valor, cliente e categoria;
- marcar uma conta como recebida;
- filtrar contas por período, status e cliente.

### Relatórios

- visualizar total a pagar no mês;
- visualizar total a receber no mês;
- consultar contas vencidas;
- exportar dados em CSV.

### Outros recursos

- login com e-mail e senha;
- três perfis de usuário: administrador, gerente e operador;
- auditoria básica de criação e alteração dos registros;
- log de erros;
- tela de configurações globais do sistema. apenas administradores podem acessar esta tela.
- apenas administradores podem criar e gerenciar usuários.

---

Atue como analista de sistemas experiente.

Antes de criar qualquer documento final, me ajude a organizar a ideia do sistema por meio de uma entrevista incremental.

Ao longo da entrevista, investigue e organize as informações necessárias para identificar:

1. qual problema o sistema resolve; 
2. quem usará o sistema; 
3. quais funcionalidades são essenciais para a primeira versão; 
4. quais funcionalidades podem ficar para uma versão futura; 
5. quais informações precisam ser armazenadas; 
6. quais regras de negócio já podem ser percebidas; 
7. quais dúvidas precisam ser respondidas antes da criação do PRD; 
8. quais recursos normalmente existem em sistemas desse tipo. 

Use linguagem simples e explique termos técnicos quando aparecerem.

Faça uma pesquisa sobre recursos normalmente adicionados a sistemas desse tipo.

Ao pesquisar recursos comuns, não inclua automaticamente todos eles no escopo.

Na primeira resposta, classifique as sugestões em três grupos:

1. essencial para a primeira versão; 
2. útil, mas pode ficar para depois; 
3. avançado demais para este primeiro projeto. 

Explique brevemente o motivo de cada classificação.

Depois dessa primeira classificação, não repita a lista completa nas próximas rodadas, a menos que eu peça ou que alguma resposta minha mude significativamente o escopo.

Nesta etapa, não defina linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem, estrutura de pastas, tabelas de banco de dados ou detalhes de código.

Essas decisões serão tomadas em uma etapa futura.

## Modo de condução da conversa

Conduza a conversa em modo de entrevista incremental.

Na primeira resposta, apresente apenas um resumo breve do que entendeu sobre o sistema e a classificação inicial dos recursos pesquisados.

Depois da primeira resposta, não repita resumos completos a cada nova rodada de perguntas.

A cada resposta minha, incorpore silenciosamente as informações ao contexto do sistema e avance apenas com o próximo bloco de perguntas necessário.

1. uma frase curta indicando os próximos temas da investigação; 
2. no máximo 3 perguntas objetivas. para cada pergunta:
 2.1. explique rapidamente por que essa informação é importante;
 2.2. dê exemplos de respostas possíveis;
 2.3. se for possível informe qual padrão será usado caso o usuário não saiba responder.

Não liste novamente tudo o que já foi decidido, exceto se houver contradição, lacuna crítica ou se eu pedir explicitamente.

Não produza o contexto consolidado completo durante a entrevista.

O contexto completo do sistema só deverá ser apresentado quando eu enviar um segundo prompt pedindo o resumo final antes da criação do PRD.

Faça perguntas sempre que precisar de mais informações.

Faça as perguntas em blocos pequenos, com no máximo 3 perguntas por vez, e aguarde minhas respostas antes de continuar.
```

> Nota do analista: neste prompt (2.H), ao contrário dos anteriores, o bloco "Modo de condução da conversa" **não** contém a frase "Conduza a conversa em modo de entrevista incremental." nem "Na primeira resposta, apresente apenas um resumo breve..."; inicia direto no item "1. uma frase curta indicando os próximos temas...". Diferença real na fonte.

#### Prompt 2.I — Como responder às perguntas da IA (exemplo de resposta)

Contexto: "Depois do prompt inicial, a IA provavelmente fará perguntas. Responda de forma simples. Você não precisa escrever textos longos." Bloco Copiar:

```
1. Na primeira versão, os clientes não acessarão o sistema.
2. Sim, preciso registrar quem marcou uma conta como paga.
```

#### Prompt 2.J — Resposta quando não souber responder

Contexto: "Se não souber responder, diga isso claramente". Bloco Copiar:

```
Ainda não sei. Me ajude a entender as opções mais simples para a primeira versão.
```

#### Prompt 2.K — Frase para lidar com excesso de sugestões da IA

Contexto: "Uma boa frase para usar quando a IA sugerir muita coisa é". Bloco Copiar:

```
Separe essas sugestões entre essencial para a primeira versão, útil para depois e avançado demais para este primeiro projeto.
```

#### Prompt 2.L — PROMPT DE FECHAMENTO DA EXPLORAÇÃO (segundo prompt principal do Passo 2)

Contexto: "IMPORTANTE: Pedido de fechamento da exploração — Quando você sentir que a conversa já está clara, peça para a IA consolidar as decisões antes de criar o PRD." Bloco Copiar:

```
Consolide a exploração da ideia antes da criação do PRD.

Organize a resposta nas seções abaixo:

1. Resumo do sistema
2. Problema que o sistema resolve
3. Usuários e perfis envolvidos
4. Funcionalidades essenciais da primeira versão
5. Funcionalidades que ficam fora da primeira versão
6. Informações que o sistema precisa armazenar
7. Regras de negócio identificadas
8. Dúvidas ainda em aberto
9. Recomendações para a criação do PRD

Não crie o PRD ainda.

Apenas consolide a análise da ideia em linguagem clara e objetiva.
```

### 2.4 Modelos / estruturas citadas

- **Prompt modelo** (Prompt 2.E) — o prompt mais livre do fluxo; estrutura do modelo: "Quero criar um sistema web" + tipo do sistema + seções "## Público usuário do sistema", "## Objetivo principal", "## Primeira versão" (com grupos de funcionalidades "### [Nome do grupo]" e "### Outros recursos") + bloco "---" com a instrução "Atue como analista de sistemas experiente" + seção "## Modo de condução da conversa".
- **Estrutura do prompt de fechamento** (Prompt 2.L) — 9 seções numeradas.
- **Documentos citados**: PRD.md (a criar no passo seguinte), FSD (Documento de Especificação Funcional), chat do Passo 0 (dúvidas conceituais), DESIGN.md (do Passo 1, mencionado no capítulo do Passo 3).
- **Nenhum arquivo/pasta de saída obrigatório neste passo** — "Ao final deste passo, você ainda não terá um arquivo final obrigatório."

### 2.5 Regras, avisos, boas práticas e armadilhas

- **O que NÃO fazer neste passo**: não escolher tecnologias. Evitar definir linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem, estrutura de pastas, arquitetura técnica, tabelas do banco de dados, detalhes de código. Se tentar decidir tudo agora, a conversa pode ficar pesada e confusa.
- **Modelo recomendado**: modelo com raciocínio — a IA vai fazer perguntas, sugerir possibilidades, separar essencial de adiável e evitar que a primeira versão fique grande demais.
- **Chat separado**: usar um chat novo, separado do chat de dúvidas (Passo 0). Dúvidas conceituais continuam no chat do Passo 0.
- **Responda com calma e em linguagem simples**; você não precisa saber tudo no começo — a função da IA é ajudar a descobrir o que falta.
- **Cuidado com sugestões da IA**: nem tudo que a IA sugere precisa entrar na primeira versão. Exemplos citados para sistema financeiro: conciliação bancária, emissão de boletos, integração com bancos, importação de extrato, previsão de fluxo de caixa, relatórios avançados — alguns podem ser úteis, mas grandes demais para a V1. "Neste treinamento, a primeira versão deve resolver o problema principal sem tentar fazer tudo de uma vez."
- **Classificação obrigatória de sugestões**: essencial para a primeira versão / útil, mas pode ficar para depois / avançado demais para este primeiro projeto — explicando brevemente o motivo de cada classificação, apenas na primeira resposta (sem repetir lista nas rodadas seguintes).
- **Modo entrevista incremental**: 1 frase curta de tema + no máximo 3 perguntas objetivas por rodada; cada pergunta com porquê (importância), exemplos de resposta e padrão default caso o usuário não saiba responder. Aguardar respostas antes de continuar.
- **Não repetir o que já foi decidido**, exceto em contradição, lacuna crítica ou pedido explícito. **Não produzir o contexto consolidado completo durante a entrevista** — ele só aparece no fechamento (Prompt 2.L).
- **Não avançar se a ideia estiver vaga demais.**
- O fechamento ajuda a verificar se a conversa está madura o suficiente para virar um PRD.

### 2.6 Checklists mencionados

**"O que deve ficar claro antes de avançar"** (antes de seguir ao próximo passo):
- qual é o objetivo principal do sistema;
- quem são os usuários;
- quais funcionalidades entram na primeira versão;
- quais funcionalidades ficam fora da primeira versão;
- quais informações o sistema precisa controlar;
- quais regras de negócio importantes já foram identificadas;
- quais dúvidas ainda precisam ser resolvidas;
- se existem recursos de segurança, auditoria, permissões ou configurações que precisam ser considerados.

**"Como saber se este passo foi concluído?"** (passo concluído quando tiver):
- criado um chat novo para explorar a ideia;
- enviado o prompt inicial adaptado ao seu sistema;
- respondido às perguntas da IA;
- separado o que é essencial do que pode ficar para depois;
- consolidado as decisões principais;
- confirmado que a ideia está clara o suficiente para criar o PRD.

### 2.7 Vocabulário especializado (tabela da metodologia: Termo / Explicação simples)

| Termo | Explicação simples |
| --- | --- |
| Sistema web | Sistema acessado pelo navegador, como Chrome, Edge ou Firefox. |
| Funcionalidade | Algo que o sistema permite fazer, como cadastrar uma conta, gerar um relatório ou marcar uma tarefa como concluída. |
| Versão 1 | Primeira versão funcional do sistema. Ela deve resolver o problema principal sem tentar fazer tudo de uma vez. |
| Escopo | Conjunto de funcionalidades que entram no projeto. O que está no escopo será feito. |
| Fora de escopo | O que não será feito nesta primeira versão, mas pode ficar para depois. |
| Regra de negócio | Regra que define como o sistema deve funcionar na prática. |
| Usuário | Pessoa que acessa ou utiliza o sistema. |
| Perfil de usuário | Tipo de usuário dentro do sistema, como administrador, gerente, operador ou cliente. |
| Requisito | Necessidade que o sistema precisa atender. |
| PRD | Documento de Requisitos do Produto. Ele explica o que o sistema deve fazer, sem entrar em detalhes técnicos de programação. |
| FSD | Documento de Especificação Funcional. Ele detalha o funcionamento do sistema para orientar a codificação. |

### 2.8 Erros comuns e como resolver (Passo 2)

- **Ideia vaga demais** → não avance; continue a entrevista até a ideia ficar clara.
- **IA sugere recursos demais** → usar o prompt 2.K ("Separe essas sugestões..."); não incluir tudo automaticamente no escopo.
- **Tentar decidir tecnologia cedo demais** → evitar; decisões técnicas ficam para etapas futuras (Decisões Técnicas do Projeto e FSD).
- **Não saber responder a uma pergunta da IA** → usar o prompt 2.J ("Ainda não sei. Me ajude a entender as opções mais simples para a primeira versão."); a IA deve ajudar a decidir com base no objetivo do sistema, sem impor escolhas desnecessárias.
- **Conversa repetitiva / resumos repetidos** → o prompt já instrui a IA a não repetir listas e a incorporar silenciosamente as respostas; se a IA repetir, reforçar o modo de condução.

---

## 3. Capítulo: Passo 3 — PRD

### 3.1 Objetivo do capítulo

Transformar tudo o que foi explorado e decidido no Passo 2 em um documento organizado chamado **PRD** (Product Requirements Document / Documento de Requisitos do Produto). O documento explica o que o sistema deve fazer, quem vai usar, quais funcionalidades entram na primeira versão, quais regras precisam ser respeitadas e quais pontos ainda precisam ser esclarecidos.

Ainda NÃO se define linguagem de programação, banco de dados, bibliotecas, frameworks, hospedagem ou detalhes técnicos de implementação. O PRD é uma descrição bem organizada da solução, clara para pessoas — ajuda você, a IA e qualquer pessoa envolvida a entenderem o que será construído antes de discutir como será feito.

O PRD é também o documento mais adequado para apresentar a proposta a um cliente, gestor ou responsável pela aprovação. Por isso, **antes de avançar para o FSD, o PRD deve estar claro, revisado e aprovado**.

### 3.2 Passos EXATOS na ordem

1. **Rodar o prompt no mesmo chat usado no Passo 2 – Explorar a ideia** (importante: o PRD precisa aproveitar tudo que já foi conversado, respondido, corrigido e decidido).
2. **Conferir se o Passo 2 foi concluído corretamente** (ver checklist "Antes de gerar o PRD"). Se ainda houver muitas dúvidas, volte ao Passo 2 antes de criar o PRD — não há problema em conversar mais um pouco com a IA. Um PRD criado cedo demais pode parecer organizado, mas carregar decisões frágeis.
3. **Enviar o "Prompt para criar o PRD"** (primeiro prompt principal do capítulo) no chat do Passo 2.
4. **Revisar o PRD gerado** — ler como alguém que conhece o problema e precisa conferir se o sistema descrito faz sentido (não como programador). Ver perguntas de revisão na seção 3.6.
5. **Refinar o PRD** se necessário, usando os "Exemplos de prompts de refinamento" no mesmo chat.
6. **Aprovar o PRD.**
7. **Enviar o "Prompt para salvar o PRD"** (segundo prompt principal do capítulo) para gerar o arquivo final **PRD.md** em Markdown. Se a IA não conseguir gerar download, pedir o conteúdo completo em Markdown e salvar manualmente em um arquivo chamado PRD.md.

**Importante (bloco destacado na metodologia):** para concluir este passo, execute os **dois prompts principais do capítulo** — o primeiro cria o PRD (usando como base tudo que foi explorado, organizado e decidido na etapa anterior); o segundo é usado depois que o PRD estiver **aprovado**, para gerar o arquivo final em Markdown com o nome **PRD.md**, usado nas próximas etapas do fluxo.

### 3.3 TODOS os prompts completos (transcrição verbatim)

#### Prompt 3.A — "O que o sistema precisa fazer?" (ilustrativo, respondido pelo PRD)

Contexto: "Por que o PRD vem antes do FSD? O PRD responde principalmente". Bloco Copiar:

```
O que o sistema precisa fazer?
```

#### Prompt 3.B — "Como o sistema deve funcionar..." (ilustrativo, respondido pelo FSD)

Contexto: "O FSD responde com mais detalhes". Bloco Copiar:

```
Como o sistema deve funcionar para que possa ser construído?
```

#### Prompt 3.C — Ordem do fluxo (ilustrativo)

Contexto: "A ordem desta parte do fluxo é". Bloco Copiar:

```
Ideia explorada -> PRD -> Decisões Técnicas do Projeto -> FSD -> Codificação
```

#### Prompt 3.D — PROMPT PARA CRIAR O PRD (primeiro prompt principal do Passo 3)

Contexto: "Use o prompt abaixo no mesmo chat em que você explorou a ideia do sistema." Bloco Copiar:

```
Atue como Gerente de Produto e Analista de Sistemas sênior.

Seu objetivo é consolidar tudo o que foi discutido, alinhado, refinado e aprovado ao longo desta conversa e transformar em um Documento de Requisitos do Produto, também chamado de PRD.

O PRD deve ser puramente funcional.

Isso significa que ele deve explicar:

- o que o sistema deve fazer;
- qual problema ele resolve;
- quem usará o sistema;
- quais funcionalidades fazem parte da primeira versão;
- quais regras precisam ser respeitadas;
- quais informações o sistema precisa controlar;
- quais fluxos principais precisam existir;
- quais pontos ainda precisam ser esclarecidos antes da próxima etapa.

Não defina tecnologias, linguagens de programação, banco de dados, bibliotecas, frameworks, hospedagem, arquitetura de código, estrutura de pastas ou detalhes técnicos de implementação.

Essas decisões serão tomadas depois, no FSD.

Use linguagem clara, didática e acessível para pessoas que não sabem programar.

Explique termos técnicos quando eles aparecerem.

Analise minuciosamente todo o histórico desta conversa. Use apenas informações que tenham sido discutidas, aprovadas ou claramente confirmadas pelo usuário.

Não adicione funcionalidades novas apenas porque elas são comuns em sistemas parecidos.

Se identificar uma ideia interessante, mas que não foi aprovada, coloque-a como sugestão ou ponto pendente. Não coloque como parte confirmada da primeira versão.

Se encontrar dúvidas, lacunas, ambiguidades ou contradições, registre isso na seção "Pontos Pendentes Antes do FSD".

Organize o PRD nas seções abaixo.

---

# DOCUMENTO DE REQUISITOS DO PRODUTO (PRD)

## 1. Visão Geral do Produto

Explique, de forma simples, qual sistema será criado.

Inclua:

- nome provisório do sistema, se tiver sido definido;
- descrição resumida do sistema;
- público principal que usará o sistema;
- principal benefício esperado;
- contexto geral de uso.

Se o nome do sistema ainda não tiver sido definido, use um nome provisório coerente com a conversa e informe que ele pode ser alterado depois.

## 2. Problema que o Sistema Resolve

Descreva o cenário atual sem o sistema.

Explique quais dores, dificuldades, riscos, retrabalhos, perdas de tempo ou falhas de controle este sistema pretende reduzir.

Considere, quando fizer sentido para o tipo de sistema discutido:

- atividades feitas manualmente;
- informações espalhadas em vários lugares;
- dificuldade para acompanhar prazos, status, etapas ou responsáveis;
- risco de erros, esquecimentos ou retrabalho;
- falta de visão clara para tomada de decisão;
- dificuldade para encontrar registros, documentos ou históricos;
- falta de controle sobre quem fez alterações importantes.

Adapte a explicação ao sistema discutido nesta conversa.

Não use exemplos de outro tipo de sistema.

## 3. Objetivos do Sistema

Liste os objetivos principais do sistema.

Os objetivos devem explicar o que o sistema precisa alcançar para ser considerado útil.

Separe em:

### Objetivo principal

Explique o objetivo central do sistema em uma frase clara.

### Objetivos específicos

Liste objetivos menores que ajudam a alcançar o objetivo principal.

Cada objetivo específico deve estar ligado a uma necessidade real discutida na conversa.

## 4. Personas e Perfis de Usuário

Identifique os perfis de usuário que utilizarão o sistema.

Persona é um perfil de usuário que representa um tipo de pessoa que vai usar o sistema.

Para cada perfil, explique:

- quem é esse usuário;
- o que ele espera fazer no sistema;
- quais permissões básicas ele deve ter;
- quais ações ele não deve poder realizar, se isso já tiver sido definido.

Use uma tabela com as colunas:

| Perfil | Descrição simples | Principais ações no sistema | Permissões básicas |
| ------ | ----------------- | --------------------------- | ------------------ |

Inclua apenas perfis discutidos ou aprovados na conversa.

Se algum perfil parecer necessário, mas não tiver sido confirmado, registre isso em "Pontos Pendentes Antes do FSD".

## 5. Escopo da Primeira Versão

Liste todas as funcionalidades confirmadas para a primeira versão do sistema.

Escopo é o conjunto de funcionalidades que fará parte desta versão do projeto.

Use apenas funcionalidades que tenham sido discutidas, aprovadas ou claramente confirmadas pelo usuário.

Não adicione funcionalidades novas apenas porque são comuns em sistemas parecidos.

Agrupe as funcionalidades por áreas funcionais.

Área funcional é um grupo de funcionalidades relacionadas ao mesmo assunto ou parte do sistema.

Exemplos genéricos de áreas funcionais:

- cadastros principais;
- operação principal do sistema;
- acompanhamento e consultas;
- relatórios;
- administração do sistema;
- configurações;
- permissões de acesso;
- comunicação;
- integrações;
- arquivos e documentos;
- histórico e auditoria.

Crie os nomes das áreas conforme o tipo de sistema discutido na conversa.

Para cada funcionalidade, descreva brevemente:

- o que ela permite fazer;
- quem normalmente usará essa funcionalidade;
- qual problema ela ajuda a resolver;
- se existe alguma regra de negócio já definida para ela.

Se houver dúvida sobre uma funcionalidade estar ou não confirmada para a primeira versão, coloque essa dúvida na seção "Pontos Pendentes Antes do FSD" em vez de assumir.

## 6. Funcionalidades Fora de Escopo

Liste as funcionalidades, ideias ou melhorias que não farão parte da primeira versão.

Fora de escopo significa que o item não será desenvolvido agora.

Inclua nesta seção:

- funcionalidades discutidas, mas adiadas;
- ideias sugeridas pela IA, mas não aprovadas pelo usuário;
- recursos considerados avançados demais para a primeira versão;
- integrações, automações ou melhorias que dependem de uma etapa futura.

Explique brevemente por que cada item ficou fora da primeira versão, quando essa razão estiver clara na conversa.

Se não houver itens fora de escopo definidos, declare isso explicitamente.

## 7. Regras de Negócio

Liste as regras que definem como o sistema deve funcionar.

Regra de negócio é uma regra prática do funcionamento do sistema.

Exemplos genéricos de regras de negócio:

- quem pode realizar determinada ação;
- quando uma informação pode ou não ser alterada;
- quais dados são obrigatórios;
- quais situações exigem confirmação;
- quais registros devem ficar visíveis ou bloqueados;
- quais ações precisam gerar histórico;
- quais limites ou condições precisam ser respeitados.

Organize as regras por assunto, quando fizer sentido.

Use apenas regras discutidas, aprovadas ou claramente derivadas das decisões tomadas na conversa.

Se uma regra parecer necessária, mas não tiver sido confirmada, registre como ponto pendente.

## 8. Informações que o Sistema Precisa Controlar

Liste as principais informações que o sistema precisa armazenar, consultar ou controlar.

Não transforme esta seção em modelagem de banco de dados.

Neste momento, não crie tabelas, campos técnicos, tipos de dados ou relacionamentos de banco.

Explique de forma funcional.

Use uma tabela com as colunas:

| Informação | Para que serve no sistema | Observações importantes |
| ---------- | ------------------------- | ----------------------- |

Exemplos genéricos de informações que podem existir em sistemas:

- usuários;
- perfis de acesso;
- registros principais do negócio;
- categorias ou classificações;
- arquivos ou anexos;
- status;
- histórico de alterações;
- configurações;
- comentários ou observações;
- notificações;
- relatórios ou indicadores.

Adapte a lista conforme o sistema discutido nesta conversa.

Inclua apenas informações necessárias para as funcionalidades confirmadas.

## 9. Fluxos Principais de Uso

Descreva os principais fluxos de uso do sistema em linguagem simples.

Fluxo de uso é a sequência de passos que mostra como o usuário realiza uma tarefa dentro do sistema.

Inclua os fluxos mais importantes para a primeira versão.

Para cada fluxo, use este formato:

### Nome do fluxo

1. O usuário acessa a área correspondente.
2. O usuário executa a ação principal.
3. O sistema solicita ou exibe as informações necessárias.
4. O usuário confirma a ação.
5. O sistema valida as informações.
6. O sistema registra ou atualiza a informação.
7. O sistema exibe o resultado esperado.

Adapte os passos ao tipo de funcionalidade descrita.

Não invente telas, campos ou detalhes técnicos que não tenham sido definidos.

Se algum fluxo depender de uma decisão ainda não confirmada, registre isso em "Pontos Pendentes Antes do FSD".

## 10. Histórias de Usuário

Crie histórias de usuário para as funcionalidades principais da primeira versão.

História de usuário é uma frase simples que explica o que um perfil de usuário quer fazer e qual benefício espera obter.

Use o formato:

"Como [perfil de usuário], eu quero [funcionalidade] para [benefício]."

Crie pelo menos uma história de usuário para cada funcionalidade importante confirmada para a primeira versão.

Use apenas perfis e funcionalidades compatíveis com o que foi discutido nesta conversa.

## 11. Critérios de Aceitação

Crie critérios de aceitação para as funcionalidades mais importantes.

Critérios de aceitação são condições que ajudam a verificar se uma funcionalidade foi feita corretamente.

Use formato de checklist.

Para cada funcionalidade importante, inclua critérios objetivos como:

- [ ] O usuário consegue realizar a ação principal da funcionalidade.
- [ ] O sistema impede o salvamento quando informações obrigatórias não são preenchidas.
- [ ] O sistema exibe mensagens claras quando algo precisa ser corrigido.
- [ ] O sistema mostra o registro criado ou atualizado nas consultas correspondentes.
- [ ] O sistema respeita as permissões definidas para cada perfil de usuário.
- [ ] O sistema registra histórico quando essa regra tiver sido definida.

Adapte os critérios ao funcionamento do sistema discutido.

Não inclua critérios técnicos de programação, banco de dados, performance ou segurança técnica nesta etapa.

## 12. Consultas, Relatórios e Indicadores

Descreva quais informações o usuário precisa consultar, filtrar, acompanhar ou visualizar.

Use esta seção apenas se consultas, relatórios, painéis, indicadores ou listagens tiverem sido discutidos ou forem necessários para as funcionalidades confirmadas.

Não defina layout visual detalhado.

Explique apenas:

- quais informações precisam ser exibidas;
- quais filtros ou buscas são importantes;
- quais perfis devem acessar essas informações;
- quais decisões essas informações ajudam a tomar.

Se o sistema não precisar de relatórios ou indicadores na primeira versão, declare isso explicitamente.

## 13. Permissões e Segurança Funcional

Descreva as permissões básicas por perfil de usuário.

Segurança funcional significa definir o que cada perfil pode ou não pode fazer dentro do sistema.

Não entre em segurança técnica, criptografia, código, banco de dados, infraestrutura ou implementação.

Use uma tabela com as colunas:

| Perfil | Pode fazer | Não pode fazer | Observações |
| ------ | ---------- | -------------- | ----------- |

Considere ações como:

- visualizar;
- cadastrar;
- editar;
- excluir;
- aprovar;
- cancelar;
- configurar;
- gerenciar usuários;
- acessar relatórios;
- visualizar histórico;
- importar ou exportar informações.

Adapte as permissões ao sistema discutido nesta conversa.

Se alguma permissão não estiver clara, registre como ponto pendente.

## 14. Limitações da Primeira Versão

Explique as limitações assumidas para manter a primeira versão simples, viável e coerente com o que foi aprovado.

Limitação é algo que o sistema não fará agora ou fará de forma simplificada.

Inclua apenas limitações compatíveis com a conversa.

Exemplos genéricos de limitações:

- não haverá integração com sistemas externos;
- não haverá aplicativo mobile;
- não haverá automações avançadas;
- não haverá múltiplas unidades, empresas ou ambientes, salvo se isso tiver sido aprovado;
- não haverá personalizações avançadas;
- não haverá importação ou exportação de dados, salvo se isso tiver sido aprovado;
- não haverá fluxos de aprovação complexos, salvo se isso tiver sido aprovado.

Adapte esta seção ao sistema discutido.

## 15. Pontos Pendentes Antes do FSD

Liste dúvidas, ambiguidades, decisões abertas ou contradições que ainda precisam ser resolvidas antes da criação do FSD.

O FSD será o documento usado para orientar a IA codificadora, por isso não deve nascer com dúvidas importantes em aberto.

Inclua pontos pendentes quando houver dúvida sobre:

- regra de negócio;
- permissão de usuário;
- fluxo principal;
- funcionalidade da primeira versão;
- item fora de escopo;
- informação que o sistema precisa controlar;
- comportamento esperado em situações especiais.

Se não houver dúvidas pendentes, declare explicitamente:

"Não foram identificadas dúvidas funcionais pendentes para a criação do FSD."

## 16. Resumo Final do PRD

Finalize com um resumo curto explicando:

- o que será construído;
- quem usará;
- quais são as principais funcionalidades;
- o que ficará fora da primeira versão;
- quais pontos ainda precisam ser confirmados, se houver;
- se o projeto está pronto ou não para avançar para o FSD.

---

Gere o documento final em Markdown, com títulos claros, listas, tabelas e exemplos apenas quando eles ajudarem a explicar o próprio sistema discutido nesta conversa.

Não crie o FSD neste momento.

Não defina tecnologia neste momento.

Não invente requisitos.

Quando algo não estiver claro, registre como ponto pendente em vez de assumir.
```

#### Prompt 3.E — EXEMPLOS DE PROMPTS DE REFINAMENTO (5 prompts)

Contexto: "Se encontrar algo errado, peça correção no mesmo chat. Exemplos de prompts de refinamento".

**E1 — Corrigir perfis de usuário.** Bloco Copiar:

```
Revise a seção de personas e permissões.

Ajustes necessários:

- o administrador terá acesso total ao sistema;
- apenas o administrador poderá criar novos usuários;
- apenas o administrador poderá alterar logo, cores e nome exibido na interface.

Atualize o PRD completo considerando essas regras.
```

**E2 — Adicionar funcionalidades esquecidas.** Bloco Copiar:

```
O PRD deixou de fora algumas funcionalidades importantes da primeira versão.

Inclua no escopo da V1:

- cadastro de clientes;
- cadastro de fornecedores;
- categorias financeiras por plano de contas;
- anexos de comprovantes;
- contas recorrentes.

Atualize também regras de negócio, histórias de usuário, critérios de aceitação e fluxos relacionados.
```

**E3 — Remover funcionalidades avançadas.** Bloco Copiar:

```
O PRD incluiu funcionalidades avançadas demais para a primeira versão.

Remova do escopo da V1:

- conciliação bancária;
- emissão de boletos;
- integração com PIX;
- importação de extrato bancário;
- aplicativo mobile.

Mantenha essas ideias apenas como possibilidades futuras.
```

**E4 — Identificar inconsistências.** Bloco Copiar:

```
Revise o PRD gerado e procure inconsistências, contradições, lacunas e decisões que ainda estejam vagas.

Não reescreva o documento inteiro ainda.

Primeiro, liste os problemas encontrados e sugira como corrigir cada um.
```

**E5 — Melhorar clareza para pessoas não técnicas.** Bloco Copiar:

```
Reescreva o PRD com linguagem mais simples e acessível para pessoas que não sabem programar.

Mantenha todas as decisões funcionais, mas explique melhor os termos técnicos e organize o texto para facilitar a leitura.
```

#### Prompt 3.F — PROMPT PARA SALVAR O PRD (segundo prompt principal do Passo 3)

Contexto: "Depois que o PRD estiver revisado e aprovado, peça para a IA fornecer o arquivo final em Markdown." Bloco Copiar:

```
Forneça o PRD completo para download em Markdown.

Nome do arquivo: PRD.md
```

Falha/caminho alternativo explicitado no texto (fora do bloco): "Caso a IA não consiga gerar um arquivo para download, peça o conteúdo completo em Markdown e salve manualmente em um arquivo chamado PRD.md."

### 3.4 Modelos / estruturas de documentos citados

- **PRD.md** — arquivo final de saída deste passo (Markdown). "O PRD não é o documento final para codificação. Ele é a ponte entre a ideia organizada e a especificação funcional detalhada."
- **Estrutura do PRD** (template dentro do Prompt 3.D): 16 seções — 1. Visão Geral do Produto; 2. Problema que o Sistema Resolve; 3. Objetivos do Sistema (Objetivo principal / Objetivos específicos); 4. Personas e Perfis de Usuário (tabela: Perfil | Descrição simples | Principais ações no sistema | Permissões básicas); 5. Escopo da Primeira Versão; 6. Funcionalidades Fora de Escopo; 7. Regras de Negócio; 8. Informações que o Sistema Precisa Controlar (tabela: Informação | Para que serve no sistema | Observações importantes); 9. Fluxos Principais de Uso; 10. Histórias de Usuário; 11. Critérios de Aceitação; 12. Consultas, Relatórios e Indicadores; 13. Permissões e Segurança Funcional (tabela: Perfil | Pode fazer | Não pode fazer | Observações); 14. Limitações da Primeira Versão; 15. Pontos Pendentes Antes do FSD; 16. Resumo Final do PRD.
- **Documentos do fluxo citados**: FSD (Documento de Especificação Funcional), "Decisões Técnicas do Projeto", DESIGN.md (criado ou escolhido no Passo 1).
- **Modelo de fluxo de uso** (passos 1–7 dentro da seção 9 do PRD).
- **Formato de história de usuário**: `"Como [perfil de usuário], eu quero [funcionalidade] para [benefício]."`

### 3.5 Regras, avisos, boas práticas e armadilhas

- **Modelo recomendado**: modelo com raciocínio — a IA precisa diferenciar o que foi **confirmado**, o que foi apenas **sugerido** e o que ainda está em **dúvida**.
- **Onde rodar**: mesmo chat do Passo 2. Isso é importante porque o PRD precisa aproveitar tudo já conversado, respondido, corrigido e decidido.
- **PRD puramente funcional**: explicar o que o sistema deve entregar, não como o código será feito.
- **Proibições do prompt**: não definir tecnologias/linguagens/banco/bibliotecas/frameworks/hospedagem/arquitetura/estrutura de pastas/detalhes técnicos; não criar FSD neste momento; não inventar requisitos; não adicionar funcionalidades novas só porque são comuns; não usar exemplos de outro tipo de sistema.
- **Princípio da fonte única de verdade**: usar apenas informações discutidas, aprovadas ou claramente confirmadas pelo usuário. Ideias interessantes não aprovadas vão como sugestão ou ponto pendente.
- **Registro de pendências**: dúvidas, lacunas, ambiguidades ou contradições → seção "Pontos Pendentes Antes do FSD" (não assumir).
- **O FSD não deve nascer com dúvidas importantes em aberto** — por isso a seção 15 existe e a seção 16 deve dizer se o projeto está pronto para avançar.
- **Por que PRD antes do FSD**: se o PRD estiver confuso, incompleto ou contraditório, o FSD também ficará; e se o FSD ficar confuso, a IA codificadora terá mais chance de criar código errado, incompleto ou desalinhado.
- **PRD criado cedo demais** pode parecer organizado, mas carregar decisões frágeis → se houver muitas dúvidas, voltar ao Passo 2; conversar mais um pouco com a IA é aceitável.
- **Seção 8**: não transformar em modelagem de banco de dados (sem tabelas, campos técnicos, tipos de dados ou relacionamentos).
- **Seção 12**: só usar se relatórios/consultas/painéis tiverem sido discutidos; se o sistema não precisar na V1, declarar explicitamente.
- **Seção 13**: segurança funcional, não técnica (sem criptografia, código, banco, infraestrutura ou implementação).
- **Seção 11**: critérios de aceitação em formato de checklist; sem critérios técnicos de programação/banco/performance/segurança técnica nesta etapa.

### 3.6 Checklists mencionados

**"Antes de gerar o PRD"** (confira se o Passo 2 foi concluído corretamente; você deve ter pelo menos):
- uma ideia clara do sistema;
- os perfis de usuários identificados;
- as principais funcionalidades da primeira versão;
- as funcionalidades deixadas para versões futuras;
- regras de negócio iniciais;
- dúvidas respondidas ou listadas;
- um resumo final da ideia validada.

**"Como revisar o PRD gerado"** (perguntas a si mesmo, lendo como alguém que conhece o problema):
- O sistema descrito resolve o problema principal?
- Os usuários estão corretos?
- As permissões fazem sentido?
- As funcionalidades da primeira versão estão claras?
- Alguma funcionalidade importante ficou de fora?
- Alguma funcionalidade avançada entrou sem necessidade?
- As regras de negócio estão corretas?
- Existem contradições?
- O documento deixou alguma dúvida importante antes do FSD?

**Modelo de checklist de critérios de aceitação (seção 11 do PRD)** — itens objetivos genéricos listados no prompt (ver Prompt 3.D).

**Resultado esperado do passo**: ao final, você terá um documento chamado PRD.md.

### 3.7 Vocabulário especializado (tabela da metodologia: Termo / Explicação simples)

| Termo | Explicação simples |
| --- | --- |
| PRD | Documento que explica o que o sistema deve fazer. |
| Produto | Neste contexto, é o sistema que será criado. |
| Requisito | Necessidade ou comportamento que o sistema precisa atender. |
| Funcionalidade | Ação que o sistema permite realizar, como cadastrar cliente ou gerar relatório. |
| Regra de negócio | Regra que define como o sistema deve funcionar na prática. |
| Persona | Perfil de usuário que vai usar o sistema, como funcionário, gerente ou administrador. |
| Permissão | Define o que cada tipo de usuário pode acessar ou fazer no sistema. |
| Escopo | Conjunto de funcionalidades que serão incluídas no projeto. |
| Fora de escopo | O que não será feito nesta versão do sistema. |
| Critério de aceitação | Condição usada para verificar se uma funcionalidade ficou correta. |
| História de usuário | Frase simples que explica o que um usuário quer fazer e por qual motivo. |
| Fluxo de uso | Sequência de passos que o usuário executa dentro do sistema. |
| FSD | Documento mais detalhado que será criado depois do PRD para orientar a construção do sistema. |
| Independência tecnológica | Decisão de explicar o funcionamento do sistema sem escolher tecnologia neste momento. |

Termos adicionais definidos dentro do corpo do prompt de PRD (seção 3.4/3.7): Persona (perfil de usuário que representa um tipo de pessoa que vai usar o sistema), Escopo (conjunto de funcionalidades que fará parte desta versão), Área funcional (grupo de funcionalidades relacionadas ao mesmo assunto ou parte do sistema), Regra de negócio (regra prática do funcionamento do sistema), Fora de escopo (item não será desenvolvido agora), Fluxo de uso (sequência de passos que mostra como o usuário realiza uma tarefa), História de usuário (frase simples que explica o que um perfil de usuário quer fazer e qual benefício espera obter), Critério de aceitação (condições que ajudam a verificar se uma funcionalidade foi feita corretamente), Segurança funcional (definir o que cada perfil pode ou não pode fazer dentro do sistema), Limitação (algo que o sistema não fará agora ou fará de forma simplificada).

### 3.8 Erros comuns e como resolver (Passo 3)

- **PRD com decisões frágeis por ter sido criado cedo demais** → voltar ao Passo 2 e conversar mais com a IA antes de criar o PRD.
- **IA adiciona funcionalidades comuns não aprovadas** → o prompt instrui a não fazer isso; ideias não aprovadas devem ir como sugestão/ponto pendente. Se acontecer, corrigir com o prompt de refinamento E3 (remover avançadas) ou E2 (adicionar as esquecidas).
- **Perfis/permissões errados** → prompt E1 (revisar seção de personas e permissões).
- **Funcionalidades importantes esquecidas no escopo da V1** → prompt E2 (incluir no escopo da V1 + atualizar regras, histórias, critérios e fluxos relacionados).
- **Funcionalidades avançadas demais no escopo** → prompt E3 (remover do escopo da V1 e manter apenas como possibilidades futuras).
- **Inconsistências, contradições, lacunas ou decisões vagas no documento** → prompt E4 (listar problemas primeiro, sugerir correção, sem reescrever tudo ainda).
- **Linguagem técnica demais** → prompt E5 (reescrever com linguagem mais simples e acessível).
- **IA não consegue gerar arquivo para download** → pedir o conteúdo completo em Markdown e salvar manualmente em arquivo chamado PRD.md.
- **Dúvidas em aberto não registradas** → devem ir para a seção 15 "Pontos Pendentes Antes do FSD"; se não houver, declarar explicitamente a frase "Não foram identificadas dúvidas funcionais pendentes para a criação do FSD."

---

## 4. Itens acionáveis (para o desenvolvedor)

### Passo 2 — Explorar a ideia

1. **Criar um chat novo** para explorar a ideia (separado do chat de dúvidas do Passo 0).
2. **Escolher a forma do prompt**: simplificada (não sabe bem o que quer) ou detalhada (já sabe boa parte).
3. **Enviar o Prompt modelo (2.E)** preenchido com o sistema desejado (tipo, público, objetivo, primeira versão, recursos). Preencher apenas o que já souber; a IA organiza o resto.
4. **Responder às perguntas da IA** em blocos de até 3 perguntas, em linguagem simples; usar o prompt 2.J se não souber responder.
5. **Usar o prompt 2.K** se a IA sugerir recursos demais (separar essencial / útil depois / avançado demais).
6. **Conferir o checklist** "O que deve ficar claro antes de avançar" (seção 2.6).
7. **Enviar o Prompt de fechamento (2.L)** para consolidar em 9 seções (sem criar o PRD ainda).
8. **Conferir o checklist** "Como saber se este passo foi concluído?" (seção 2.6).
9. **Saída deste passo**: nenhum arquivo obrigatório — apenas a conversa organizada (usada no Passo 3).

### Passo 3 — PRD

1. **Permaneça no mesmo chat do Passo 2.**
2. **Conferir o checklist** "Antes de gerar o PRD" (seção 3.6). Se houver muitas dúvidas, voltar ao Passo 2.
3. **Enviar o Prompt para criar o PRD (3.D)** — gera o PRD puramente funcional com 16 seções.
4. **Revisar o PRD** com as 9 perguntas de revisão (seção 3.6).
5. **Refinar** com os prompts de refinamento (3.E) se necessário, no mesmo chat:
   - E1 corrigir perfis/permissões; E2 adicionar funcionalidades esquecidas; E3 remover funcionalidades avançadas; E4 identificar inconsistências; E5 melhorar clareza para não técnicos.
6. **Aprovar o PRD.**
7. **Enviar o Prompt para salvar o PRD (3.F)**: "Forneça o PRD completo para download em Markdown. Nome do arquivo: PRD.md". Se a IA não gerar download, salvar manualmente o conteúdo em **PRD.md**.
8. **Arquivo de saída obrigatório do passo**: `PRD.md` (Markdown), que alimentará as próximas etapas do fluxo (Decisões Técnicas do Projeto → FSD → Codificação).

### Fluxo geral da metodologia (contexto)

```
Ideia explorada -> PRD -> Decisões Técnicas do Projeto -> FSD -> Codificação
```

---

## Anexo — Índice de prompts conforme impresso no início de cada capítulo

- **Passo 2 (analise-5.txt)**: Prompt modelo | Exemplo 1: Sistema de gestão financeira – Descrição simplificada | Exemplo 2: Sistema de gestão financeira – Descrição avançada | Exemplo 3: Sistema contas a pagar e a receber | Prompt de fechamento da exploração.
- **Passo 3 (analise-6.txt)**: Prompt para criar o PRD | Exemplos de prompts de refinamento | Prompt para salvar o PRD.

Conteúdo ausente/notas: não há neste grupo referência a comandos de terminal, pastas de projeto, nem templates de arquivo além de PRD.md e da estrutura de seções do PRD (16 seções) e do prompt de fechamento (9 seções). Não há checklists formais além dos três listados (Passo 2: "o que deve ficar claro" e "como saber se concluiu"; Passo 3: "antes de gerar o PRD", "como revisar o PRD gerado" e o modelo de critérios de aceitação da seção 11).

# Grupo 04 — Passo 4: Decisões Técnicas do Projeto (DECISOES_TECNICAS.md)


---

## 1. Visão geral do grupo

Este passo (Passo 4) cria o documento **`DECISOES_TECNICAS.md`**, que registra as principais decisões técnicas e estruturais do projeto **antes** da criação do FSD.

**Posição no fluxo:** No capítulo anterior criou-se o `PRD.md` (nível de produto/cliente/usuário). Este passo complementa com as decisões técnicas. O `DECISOES_TECNICAS.md` gerado aqui será usado no próximo passo, junto com o `PRD.md` e (quando existir) o `DESIGN.md`, para criar o **`FSD.md`**.

**Responsabilidades de cada documento (lógica central do fluxo):**
- `PRD.md` — Explica **o que** o sistema deve fazer.
- `DESIGN.md` — Explica **como** a interface deve parecer.
- `DECISOES_TECNICAS.md` — Explica **quais decisões técnicas** foram definidas.
- `FSD.md` — Junta essas informações em uma especificação completa para orientar a codificação.

Essa separação evita misturar tudo em um único prompt: o PRD não discute detalhes técnicos, o FSD não começa fazendo muitas perguntas, e a IA codificadora recebe um documento final mais claro e completo.

**O que o documento responde** (perguntas do tipo):
- quais tecnologias serão usadas;
- onde o sistema será desenvolvido;
- onde será publicado;
- como o projeto será organizado;
- se haverá login;
- se haverá perfis de usuário;
- se haverá auditoria;
- se haverá soft delete;
- se haverá logs;
- se haverá uploads;
- se haverá exportações;
- se haverá APIs ou integrações externas.

**O que este passo NÃO faz:** não cria o FSD, não escreve código. Não é o momento de criar modelo de dados completo, tabelas finais, campos técnicos completos, estrutura de pastas detalhada, fluxos passo a passo, telas completas, SQL, código PHP/JavaScript ou regras detalhadas de implementação. Esses detalhes pertencem ao FSD.

**Definição-chave:**
- `DECISOES_TECNICAS.md` = decisões técnicas confirmadas.
- `FSD.md` = especificação completa para construir o sistema.

**Fórmula de execução:** executar **os dois prompts principais** do capítulo (1º cria o documento usando PRD.md e DESIGN.md; 2º salva o documento em Markdown).

---

## 2. Capítulo: analise-7.txt — Passo 4: Decisões Técnicas do Projeto

### 2.1 Objetivo do capítulo

Criar um documento chamado `DECISOES_TECNICAS.md` que registre as principais decisões técnicas e estruturais do projeto antes da criação do FSD, resolvendo a lacuna de decisões que não pertencem ao PRD (que deve ser compreensível para clientes, gestores e usuários) mas que precisam estar claras antes do FSD. Se essas decisões não forem tomadas, a IA pode **inventar respostas** na hora de gerar o FSD, deixando o projeto inconsistente.

### 2.2 Passos EXATOS na ordem

1. **Abrir um chat novo** com modelo de raciocínio (evitar que rascunhos, dúvidas antigas ou ideias descartadas interfiram nas decisões técnicas).
2. **Anexar ao chat:** `PRD.md` (obrigatório) e `DESIGN.md` (quando existir).
3. **Executar o Prompt para criar o DECISOES_TECNICAS.md** (primeiro prompt principal — transcripto integral na seção 2.5).
4. **Responder às perguntas da IA uma por vez** (a IA faz perguntas uma por vez, com explicação, motivo, exemplos e padrão sugerido). Padrões de resposta na seção 2.6.
5. **Revisar o documento gerado** (checklist da seção 2.8), pedindo correções no mesmo chat se houver erro.
6. **Executar o Prompt para salvar o DECISOES_TECNICAS.md** (segundo prompt principal — seção 2.7) para obter o arquivo em Markdown; se a IA não conseguir gerar download, pedir o conteúdo completo em Markdown e salvar manualmente no arquivo `DECISOES_TECNICAS.md`.
7. **Validar a conclusão:** o passo está concluído quando existe um `DECISOES_TECNICAS.md` completo e validado pelo usuário.

### 2.3 Modelos/estruturas de documentos citados

**Arquivos de entrada:**
- `PRD.md` — obrigatório; fonte funcional.
- `DESIGN.md` — usado quando existir (orienta interface, telas, componentes, navegação, layout, padrões visuais, UX).

**Arquivo de saída deste passo:**
- `DECISOES_TECNICAS.md`

**Arquivo do próximo passo (referência):**
- `docs/FSD.md` (gerado no capítulo seguinte)
- Referência no prompt: no projeto final, o FSD será salvo como `docs/FSD.md` e o documento de design estará em `docs/DESIGN.md`.

### 2.4 Regras, avisos, boas práticas e armadilhas

- **Onde rodar:** chat novo, com modelo de raciocínio. Um modelo simples pode responder, mas tem mais chance de deixar lacunas importantes.
- **PRD.md é obrigatório:** se não estiver anexado, a IA deve parar imediatamente e solicitar o anexo, sem avançar para perguntas, decisões ou geração de documento.
- **DESIGN.md opcional:** se não estiver disponível, a IA continua mesmo assim, mas registra essa ausência no `DECISOES_TECNICAS.md`.
- **Não alterar escopo funcional do PRD:** não adicionar funcionalidades novas só porque são comuns; recurso técnico útil mas não confirmado deve ser tratado como sugestão ou ponto pendente, não como decisão aprovada.
- **O DECISOES_TECNICAS.md não é um mini-FSD:** não detalha telas, fluxos, modelo de dados, SQL, código, estrutura final do FSD ou critérios de implementação.
- **Perguntas uma por vez**, cada uma com: explicação simples, motivo, exemplos de respostas, padrão sugerido para quando o usuário não souber responder.
- **Não perguntar de novo** o que já está claramente definido no PRD/DESIGN/etapa — apenas registrar a decisão.
- **Não incluir** recomendações de skills, subagentes ou agentes especializados no prompt de resultado.
- **Não inventar funcionalidades** que não estejam no PRD ou confirmadas pelo usuário.
- **Não alterar decisões do PRD sem avisar.**
- **Pendência que impede** banco de dados, permissões, fluxos principais, telas essenciais ou regras de negócio centrais → perguntar antes de encerrar a etapa, nunca registrar como pendência futura.
- **Logs:** o log em arquivo deve ficar fora da pasta pública sempre que possível, com proteção contra acesso direto pela web.
- **Banco/desempenho:** não definir SQL final nem índices automaticamente nesta etapa; registrar apenas alertas de desempenho que façam sentido para o sistema descrito no PRD.
- **Regra de escopo técnico:** se o PRD não mencionar arquivos/upload, não incluir uploads; se não mencionar APIs/integrações, não incluir; se não mencionar relatórios, exportações ficam de fora.
- **Revisão:** ler o documento com atenção; não é preciso entender todos os detalhes técnicos, mas verificar se as decisões fazem sentido; corrigir no mesmo chat antes de salvar o arquivo final.
- **Armadilha central:** quando a IA inventa decisões técnicas, o projeto pode ficar inconsistente.
- **Responder com clareza sobre recursos não desejados na 1ª versão:** registrar como "fora de escopo técnico" evita que a IA inclua recursos avançados sem necessidade.

### 2.5 Prompt para criar o DECISOES_TECNICAS.md (PRINCIPAL — transcrição VERBATIM)

> **Uso:** em um chat novo, com o `PRD.md` e o `DESIGN.md` anexados.

```
# Prompt - Decisões Técnicas do Projeto

Atue como Arquiteto de Sistemas, Analista de Sistemas sênior e Especialista em Desenvolvimento Web.

Este prompt corresponde à etapa de decisões técnicas do projeto.

Seu objetivo não é criar o FSD.

Seu objetivo é:

- verificar se o `PRD.md` foi anexado;
- analisar o `PRD.md`;
- analisar o `DESIGN.md`, se tiver sido fornecido;
- identificar decisões técnicas já claras;
- identificar lacunas, dúvidas, ambiguidades e inconsistências;
- fazer perguntas técnicas essenciais antes da criação do FSD;
- consolidar as respostas do usuário;
- gerar, ao final, um documento chamado `DECISOES_TECNICAS.md`.

O `DECISOES_TECNICAS.md` será usado depois, junto com o `PRD.md` e o `DESIGN.md`, para criar: `FSD.md`

## Documentos esperados

Antes de começar, verifique se o arquivo `PRD.md` foi anexado.

O `PRD.md` é obrigatório nesta etapa.

Se o `PRD.md` não estiver disponível, pare imediatamente e solicite o anexo do arquivo.

Não avance para perguntas, decisões técnicas ou geração de qualquer documento sem o `PRD.md`.

Se o arquivo `DESIGN.md` estiver disponível, use-o como referência para decisões relacionadas a:

- interface;
- telas;
- componentes;
- navegação;
- layout;
- padrões visuais;
- experiência do usuário.

Considere que, no projeto final:

- o FSD será salvo como `docs/FSD.md`;
- o documento de design estará em `docs/DESIGN.md`.

Se o `DESIGN.md` não estiver disponível, continue mesmo assim, mas registre essa ausência no `DECISOES_TECNICAS.md`.

## Papel do PRD nesta etapa

O `PRD.md` deve ser usado como fonte funcional.

Ele explica o que o sistema deve fazer.

Nesta etapa, use o PRD para identificar quais decisões técnicas são necessárias.

Não altere o escopo funcional do PRD.

Não adicione funcionalidades novas apenas porque são comuns em sistemas parecidos.

Se uma funcionalidade técnica parecer útil, mas não estiver confirmada no PRD, trate como sugestão ou ponto pendente, não como decisão aprovada.

## Papel do DECISOES_TECNICAS.md

O `DECISOES_TECNICAS.md` deve registrar as decisões técnicas e estruturais do projeto.

Ele não deve ser um mini-FSD.

Não detalhe telas completas.

Não escreva fluxos passo a passo completos.

Não proponha modelo de dados completo.

Não crie SQL.

Não escreva código.

Não antecipe a estrutura final do FSD.

Não escreva critérios de implementação detalhados.

A função deste documento é registrar:

- decisões técnicas confirmadas;
- padrões adotados;
- lacunas técnicas resolvidas;
- pendências técnicas não bloqueantes;
- alertas importantes para o FSD;
- itens que não devem ser inventados;
- pontos que o FSD deverá detalhar.

## Restrições importantes

Não crie o FSD final nesta etapa.

Não gere o arquivo `docs/FSD.md`.

Não crie código.

Não execute implementação.

Não invente funcionalidades que não estejam no PRD ou que não tenham sido confirmadas pelo usuário.

Não altere decisões do PRD sem avisar.

Não inclua recomendações de skills, subagentes ou agentes especializados.

O resultado desta etapa deve ser apenas:

1. conduzir perguntas técnicas essenciais;
2. consolidar respostas;
3. gerar o `DECISOES_TECNICAS.md`.

## Decisões padrão

Quando o usuário não souber responder ou disser que não tem preferência, use os padrões abaixo.

### Stack padrão

- PHP;
- HTML;
- CSS;
- JavaScript puro;
- MySQL;
- Bootstrap local;
- organização em MVC.

### Ambiente local padrão

- XAMPP com PHP e MySQL locais.

### Ambiente de testes ou homologação padrão

- Não haverá ambiente obrigatório de testes ou homologação nesta primeira versão.
- O sistema deverá ser testado localmente antes da publicação.

### Ambiente de produção padrão

- Hospedagem com PHP e MySQL.

### Arquitetura obrigatória

O sistema deverá seguir organização baseada em MVC.

MVC significa Model-View-Controller.

Esse padrão separa o sistema em três partes principais:

- Model: parte responsável pelos dados, regras ligadas aos dados e comunicação com o banco de dados;
- View: parte responsável pela interface que o usuário vê e utiliza;
- Controller: parte responsável por receber as ações do usuário, acionar as regras necessárias e escolher qual resposta ou tela será exibida.

Mesmo que a stack escolhida não use um framework MVC pronto, o projeto deverá manter uma organização inspirada em MVC.

A separação entre banco de dados, regra de negócio e HTML deverá ser preservada no FSD final.

## Forma de condução das perguntas

Antes de fazer perguntas, leia o PRD inteiro e o DESIGN.md, se existir.

Depois da leitura, identifique:

- informações técnicas já decididas;
- informações técnicas ausentes;
- ambiguidades;
- conflitos;
- decisões que afetam banco de dados;
- decisões que afetam permissões;
- decisões que afetam telas;
- decisões que afetam segurança;
- decisões que afetam relatórios, uploads, anexos, exportações, APIs ou integrações.

Faça perguntas uma por vez.

Não faça uma lista grande de perguntas de uma só vez.

Para cada pergunta:

1. explique rapidamente por que essa informação é importante;
2. dê exemplos de respostas possíveis;
3. informe qual padrão será usado caso o usuário não tenha preferência;
4. aguarde a resposta antes de fazer a próxima pergunta.

Se alguma informação já estiver claramente definida no PRD ou já tiver sido confirmada durante esta etapa, não pergunte novamente. Apenas registre a decisão.

Se o usuário responder que não sabe, que não tem preferência ou que você pode decidir, use o padrão indicado neste prompt.

## Perguntas obrigatórias

Faça as perguntas abaixo uma por vez, somente quando a informação ainda não estiver claramente definida no PRD, no DESIGN ou em resposta anterior do usuário.

### 1. Stack do projeto

Pergunte qual stack será usada.

Se o usuário não souber ou não responder, use a stack padrão:

- PHP;
- HTML;
- CSS;
- JavaScript puro;
- MySQL;
- Bootstrap local;
- organização em MVC.

### 2. Ambiente de desenvolvimento local

Pergunte qual ambiente será usado para desenvolver o sistema no computador local.

Se o usuário não souber ou não responder, use:

- XAMPP com PHP e MySQL locais.

### 3. Ambiente de testes ou homologação

Pergunte se existirá ambiente de testes ou homologação.

Se o usuário não souber ou não responder, considere que não haverá ambiente obrigatório de testes nesta primeira versão.

Mesmo assim, registre que o sistema deverá ser testado localmente antes da publicação.

### 4. Ambiente de produção

Pergunte qual será o ambiente de produção.

Se o usuário não souber ou não responder, use:

- hospedagem com PHP e MySQL.

Registre que a publicação (deploy) fica fora da metodologia e será feita pelo usuário na hospedagem que ele escolher.

### 5. Recursos estruturais do sistema

Pergunte quais recursos estruturais devem fazer parte do sistema, se isso ainda não estiver claro.

Recursos estruturais são funcionalidades de base que ajudam o sistema a ser mais seguro, organizado, auditável e fácil de manter.

Explique os termos quando necessário.

Recursos possíveis:

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

Se o PRD já indicar claramente algum desses recursos, considere como confirmado e não pergunte novamente, a menos que exista conflito, ambiguidade, impacto técnico relevante ou necessidade de ajuste.

Se o usuário não souber ou não responder, use como padrão os recursos mínimos abaixo:

- autenticação por e-mail e senha;
- RBAC;
- auditoria básica de criação e alteração em registros principais;
- log de erros;
- configurações globais apenas quando houver necessidade funcional definida no PRD.

Não inclua APIs, integrações externas, exportações, uploads ou anexos se eles não estiverem no PRD ou não forem confirmados.

### 6. Tipo de autenticação

Se autenticação for necessária e o tipo ainda não estiver definido, pergunte qual tipo será usado.

Exemplos:

- e-mail e senha;
- OAuth;
- magic link;
- API token;
- combinação de mais de um método.

Se o usuário não souber ou não responder, use:

- autenticação por e-mail e senha.

### 7. Perfis de usuário e permissões

Verifique os perfis de usuário descritos no PRD.

Pergunte se as permissões estão corretas ou se precisam de ajuste apenas quando houver dúvida, lacuna ou conflito.

Se houver dúvida, peça confirmação antes de encerrar esta etapa.

### 8. Soft delete

Se o sistema permitir exclusão de registros e essa regra ainda não estiver definida, pergunte se deve usar soft delete.

Soft delete é exclusão lógica: o registro deixa de aparecer como ativo, mas continua guardado no banco para segurança, auditoria ou restauração.

Se o usuário não souber ou não responder, use:

- soft delete em cadastros e registros principais, quando houver exclusão;
- exclusão definitiva apenas quando confirmada explicitamente.

### 9. Auditoria

Se a auditoria ainda não estiver definida, pergunte se o sistema deve registrar auditoria.

Auditoria registra informações como:

- quem criou um registro;
- quando criou;
- quem alterou;
- quando alterou.

Se o usuário não souber ou não responder, use:

- auditoria básica com `created_at`, `created_by`, `updated_at` e `updated_by` nos registros principais.

### 10. Configurações globais

Se ainda não estiver claro, pergunte se o sistema terá configurações globais.

Configurações globais são opções administrativas que alteram o funcionamento geral do sistema.

Exemplos:

- nome do sistema;
- logo;
- tempo de sessão;
- ativar ou desativar log de erros;
- e-mail de contato;
- limite de tentativas inválidas de login;
- quantidade de itens por página;
- limite de upload, somente se o sistema usar upload, anexos ou arquivos.

Se o usuário não souber ou não responder, inclua apenas configurações globais que estejam claramente ligadas ao PRD.

### 11. Uploads, anexos e arquivos

Se o PRD mencionar arquivos, anexos, imagens, documentos ou comprovantes, pergunte quais regras devem ser aplicadas, caso ainda não estejam definidas.

Exemplos de regras:

- tipos de arquivo permitidos;
- tamanho máximo;
- quem pode enviar;
- quem pode visualizar;
- quem pode excluir;
- vínculo do arquivo com registros do sistema;
- proteção contra acesso indevido.

Se o PRD não mencionar arquivos, não inclua uploads no documento.

### 12. Relatórios e exportações

Se o PRD mencionar relatórios, listagens, consultas ou exportações, pergunte quais formatos serão necessários, caso ainda não estejam definidos.

Exemplos:

- apenas visualização em tela;
- exportação CSV;
- exportação PDF;
- exportação Excel.

Se o usuário não souber ou não responder, use:

- relatórios apenas em tela;
- exportações somente se estiverem confirmadas no PRD.

### 13. APIs e integrações externas

Se o PRD mencionar API, webhook, integração, automação ou comunicação com sistemas externos, pergunte quais integrações existirão, caso ainda não estejam definidas.

Exemplos:

- não haverá integrações externas;
- integração com sistema de pagamento;
- integração com WhatsApp;
- integração com Google Calendar;
- API interna para uso futuro;
- recebimento de dados por webhook.

Se o PRD não mencionar APIs ou integrações externas, não inclua APIs ou integrações no documento.

### 14. Padrão de entrega para IA codificadora

Pergunte se o FSD deverá incluir uma orientação de como a IA codificadora deve dividir a implementação.

Exemplos:

- dividir por módulos;
- dividir por entidades;
- dividir em etapas pequenas e testáveis;
- começar pela estrutura, depois banco, depois autenticação e depois funcionalidades.

Se o usuário não souber ou não responder, registre que o FSD deverá incluir uma seção de implementação sugerida em etapas pequenas, progressivas e testáveis.

## Verificação de pendências do PRD

Depois das perguntas obrigatórias, verifique se o PRD possui pontos pendentes, lacunas, ambiguidades ou decisões abertas.

Se existirem pendências que possam afetar o FSD, faça perguntas adicionais uma por vez, seguindo o mesmo padrão:

1. explique por que a decisão é importante;
2. dê exemplos de respostas possíveis;
3. informe o padrão sugerido caso o usuário não tenha preferência;
4. aguarde a resposta antes de avançar.

Se uma pendência impedir a criação do banco de dados, das permissões, dos fluxos principais, das telas essenciais ou das regras de negócio centrais, não registre como pendência futura. Faça uma pergunta antes de encerrar esta etapa.

## Regras para logs e contingência

Se o sistema tiver log de erros, registre no `DECISOES_TECNICAS.md` que o FSD deverá especificar:

- quais erros serão registrados;
- quais informações devem ser gravadas;
- como o usuário verá mensagens seguras;
- quem poderá consultar os logs;
- se o log será gravado em banco de dados;
- estratégia de contingência para registrar erro em arquivo quando o banco estiver indisponível, a conexão falhar ou o próprio erro impedir o registro normal.

O log em arquivo deve ser armazenado fora da pasta pública sempre que possível, com proteção contra acesso direto pela web.

Se o sistema tiver log de segurança, registre eventos como:

- login inválido;
- acesso negado;
- bloqueio por tentativas;
- ação suspeita;
- alteração de permissões;
- exclusão ou restauração de registros importantes.

## Regras para banco de dados e desempenho

Durante a análise, identifique consultas, relatórios, dashboards e listagens que podem exigir atenção de desempenho no FSD.

Registre no `DECISOES_TECNICAS.md` que o FSD deverá avaliar a necessidade de índices para evitar lentidão em consultas críticas, especialmente quando houver listagens, relatórios, dashboards ou buscas com filtros frequentes.

Considere, conforme o tipo de sistema analisado, filtros por:

- datas de criação, atualização, agendamento, ocorrência ou conclusão;
- status ou situação do registro;
- usuário responsável;
- perfil de acesso;
- categoria, tipo ou classificação;
- entidade principal do negócio;
- entidade relacionada;
- período;
- prioridade;
- código, identificador ou número de referência;
- campos usados em busca textual;
- campos usados em ordenação;
- campos usados em relacionamentos entre registros.

Não defina SQL final nesta etapa.

Não defina índices automaticamente para todos esses casos.

Registre apenas alertas de desempenho que façam sentido para as consultas, listagens, relatórios e fluxos realmente previstos no sistema descrito no PRD.

## Geração do documento

Depois que todas as perguntas essenciais forem respondidas, gere um documento em Markdown chamado:

`DECISOES_TECNICAS.md`

O documento deve ser claro, objetivo e preparatório.

Ele deve conter a seguinte estrutura:

# DECISÕES TÉCNICAS DO PROJETO

## 1. Documentos recebidos

Informe:

- se o `PRD.md` foi recebido;
- se o `DESIGN.md` foi recebido;
- se o `DESIGN.md` não foi fornecido;
- observações relevantes sobre os documentos.

## 2. Identificação do sistema

Consolide, em nível alto:

- nome do sistema;
- objetivo principal;
- público usuário;
- contexto de uso;
- resumo funcional.

## 3. Decisões técnicas confirmadas

Liste as decisões técnicas já claras, sem citar o PRD ou a conversa como fonte.

Agrupe por assunto, quando fizer sentido:

- stack;
- ambientes;
- arquitetura;
- autenticação;
- usuários e permissões;
- auditoria;
- soft delete;
- logs;
- configurações;
- uploads;
- exportações;
- APIs;
- integrações;
- segurança;
- desempenho;
- fora de escopo técnico.

Não detalhe fluxos completos, telas completas ou modelo de dados.

## 4. Decisões adotadas por padrão

Liste apenas as decisões assumidas por padrão porque o usuário não soube responder, não tinha preferência ou autorizou o uso do padrão.

Inclua, quando aplicável:

- stack;
- ambiente local;
- ambiente de testes ou homologação;
- ambiente de produção;
- arquitetura MVC;
- autenticação;
- auditoria;
- soft delete;
- logs;
- configurações globais.

## 5. Stack e ambientes

Registre:

- linguagem;
- banco de dados;
- tecnologias de interface;
- bibliotecas ou frameworks;
- ambiente local;
- ambiente de testes ou homologação;
- ambiente de produção;
- observações sobre deploy.

## 6. Arquitetura obrigatória

Registre que o sistema deverá seguir MVC.

Inclua observações em nível alto sobre a aplicação do MVC conforme a stack escolhida.

Não detalhe estrutura de pastas neste documento. Isso será feito no FSD.

## 7. Recursos estruturais definidos

Registre apenas recursos confirmados ou necessários:

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

Para cada recurso, informe a decisão final de forma curta.

Não detalhe implementação neste documento.

## 8. Perfis e permissões em nível alto

Liste os perfis definidos e suas permissões principais.

Não crie matriz completa de permissões neste documento.

A matriz detalhada será criada no FSD.

## 9. Entidades prováveis em nível alto

Liste as entidades que o FSD deverá considerar, com base no PRD e nas decisões consolidadas.

Não crie modelo de dados.

Não crie tabelas, campos técnicos, chaves, índices ou relacionamentos completos.

Apenas indique as entidades principais e relações evidentes quando forem importantes.

## 10. Módulos, telas e fluxos esperados em nível alto

Liste os módulos, telas e fluxos que o FSD deverá detalhar.

Não escreva fluxos passo a passo.

Não descreva telas em profundidade.

Apenas indique o que o FSD deverá detalhar.

## 11. Alertas para relatórios, consultas, exportações e desempenho

Registre, em nível alto:

- relatórios definidos;
- consultas ou listagens importantes;
- exportações confirmadas;
- filtros importantes;
- alertas de desempenho;
- necessidade de avaliar índices no FSD.

Não defina SQL.

Não defina índices detalhados.

## 12. Alertas para uploads, anexos e arquivos

Se houver upload, registre em nível alto:

- onde será usado;
- tipos ou regras já confirmados;
- cuidados de segurança que o FSD deverá detalhar.

Se não houver upload, registre que o recurso não faz parte da primeira versão.

## 13. Alertas para logs, auditoria e segurança

Registre em nível alto:

- regras de auditoria;
- regras de log de erro;
- necessidade de contingência em arquivo, quando aplicável;
- regras de log de segurança;
- eventos sensíveis;
- cuidados de segurança que o FSD deverá detalhar.

## 14. Itens que não devem ser inventados

Liste recursos que não devem ser incluídos no FSD porque não foram confirmados.

Inclua, quando fizer sentido:

- APIs;
- integrações externas;
- exportações;
- uploads;
- automações;
- dashboards;
- relatórios avançados;
- aplicativo mobile;
- acesso externo de clientes;
- qualquer outro item sugerido, mas não aprovado.

## 15. Pendências não bloqueantes

Liste apenas pendências que não impedem a criação do FSD.

Se não houver pendências, escreva:

"Não foram identificadas pendências não bloqueantes para a criação do FSD."

Não use esta seção para jogar decisões essenciais para depois.

## 16. Pronto para o FSD

Finalize informando se as decisões técnicas estão prontas para a criação do FSD.

Declare que o próximo passo será gerar:

`docs/FSD.md`

Informe que o FSD deverá ser criado com base em:

- `PRD.md`;
- `DECISOES_TECNICAS.md`;
- `DESIGN.md`, quando disponível.

## Regras finais desta etapa

Gere apenas perguntas enquanto houver lacunas essenciais.

Quando todas as lacunas essenciais forem resolvidas, gere apenas o documento `DECISOES_TECNICAS.md`.

Não gere o FSD final.

Não invente requisitos.

Não mencione skills ou subagentes.

Consolide todas as decisões de forma direta.

O documento `DECISOES_TECNICAS.md` deverá ser preparatório e focado em decisões técnicas, pendências e alertas.

Ele não deve ser um mini-FSD.
```

> Fim do prompt principal. O bloco "Copiar" da metodologia termina nesse ponto.

### 2.6 Como responder às perguntas da IA (blocos de resposta prontos — transcrição VERBATIM)

A IA pode fazer perguntas sobre stack, ambiente, autenticação, auditoria, soft delete, logs, uploads, exportações, APIs e integrações. Responder de forma simples.

**Bloco "Copiar" — resposta padrão recomendada:**

```
Use a stack padrão:

- PHP;
- HTML;
- CSS;
- JavaScript puro;
- MySQL;
- Bootstrap local;
- organização em MVC.

Ambiente local: XAMPP com PHP e MySQL.

Produção: hospedagem com PHP e MySQL.
```

**Bloco "Copiar" — quando não souber responder:**

```
Não sei. Use o padrão sugerido.
```

**Bloco "Copiar" — para recurso não desejado na 1ª versão:**

```
Não quero incluir esse recurso na primeira versão.
```

> Regra associada: registrar como **fora de escopo técnico**. Isso evita que a IA inclua recursos avançados sem necessidade.

### 2.7 Prompt para salvar o DECISOES_TECNICAS.md (segundo prompt principal — transcrição VERBATIM)

Depois que o documento estiver pronto, pedir para a IA fornecer o arquivo em Markdown:

```
Forneça o DECISOES_TECNICAS.md completo para download em Markdown.

Nome do arquivo: DECISOES_TECNICAS.md
```

> Fallback: caso a IA não consiga gerar arquivo para download, peça o conteúdo completo em Markdown e salve manualmente em um arquivo chamado `DECISOES_TECNICAS.md`.

### 2.8 Como revisar o documento gerado (checklist)

Depois que a IA gerar o `DECISOES_TECNICAS.md`, leia o documento com atenção. Não é preciso entender todos os detalhes técnicos, mas verificar se as decisões fazem sentido. Confira:
- a stack está correta;
- o ambiente local está correto;
- o ambiente de produção está correto;
- o uso de MVC foi registrado;
- a autenticação está clara;
- os perfis e permissões estão coerentes com o PRD;
- auditoria foi definida quando necessário;
- soft delete foi definido quando necessário;
- logs foram definidos;
- uploads aparecem apenas se forem necessários;
- exportações aparecem apenas se forem necessárias;
- APIs e integrações aparecem apenas se foram confirmadas;
- configurações globais não foram inventadas;
- itens fora de escopo técnico foram registrados;
- não há decisões técnicas importantes em aberto.

Se encontrar algo errado, peça para a IA corrigir **no mesmo chat** antes de salvar o arquivo final.

### 2.9 Exemplos de prompts de refinamento (transcrição VERBATIM)

Usar apenas se o documento precisar de ajustes.

**Corrigir stack do projeto:**

```
Revise a seção de stack definida.

A stack correta do projeto será:

- PHP;
- HTML;
- CSS;
- JavaScript puro;
- MySQL;
- Bootstrap local;
- organização em MVC.

Atualize o DECISOES_TECNICAS.md considerando essa stack.

Não altere o escopo funcional definido no PRD.
```

**Corrigir ambiente de produção:**

```
Revise a seção de ambientes.

O ambiente de produção será hospedagem com PHP e MySQL.

A publicação (deploy) fica fora da metodologia: o usuário publica na hospedagem que escolher.

Atualize o DECISOES_TECNICAS.md considerando essa decisão.
```

**Corrigir autenticação e permissões:**

```
Revise as decisões sobre autenticação e permissões.

A autenticação será por e-mail e senha.

O sistema usará RBAC.

O administrador terá acesso total.

Usuários operacionais terão acesso apenas às áreas necessárias para suas tarefas.

As permissões devem ser validadas também no backend, não apenas na interface.

Atualize o DECISOES_TECNICAS.md considerando essas decisões.
```

**Remover recursos técnicos não confirmados:**

```
O documento incluiu recursos que não foram confirmados para a primeira versão.

Remova das decisões técnicas:

- APIs;
- integrações externas;
- exportações;
- automações avançadas;
- aplicativo mobile.

Mantenha esses itens apenas como fora de escopo técnico, se fizer sentido.
```

**Corrigir logs:**

```
Revise as decisões sobre logs.

O sistema deve ter log de erros.

Quando o log de erros for gravado em banco de dados, também deve existir uma estratégia de contingência para registrar erro em arquivo quando o banco estiver indisponível, a conexão falhar ou o próprio erro impedir o registro normal.

Atualize o DECISOES_TECNICAS.md considerando essa regra.
```

### 2.10 Stack padrão do treinamento (bloco "Copiar")

Stack é o conjunto de tecnologias usadas para criar o sistema. Quando o usuário não tiver preferência:

```
PHP
HTML
CSS
JavaScript puro
MySQL
Bootstrap local
Organização em MVC
```

- **Bootstrap local** = os arquivos do Bootstrap serão adicionados ao projeto, em vez de depender de links externos de CDN.
- **MVC** = Model-View-Controller; organiza o sistema separando dados e regras ligadas aos dados, interface visual e controle das ações do usuário. Mesmo sem framework MVC completo, o projeto deve manter essa separação para evitar bagunça no código.

### 2.11 Ambientes padrão (tabela da metodologia)

| Ambiente | Padrão |
|---|---|
| Desenvolvimento local | XAMPP com PHP e MySQL locais |
| Testes ou homologação | Não haverá ambiente obrigatório de testes nesta primeira versão |
| Produção | Hospedagem com PHP e MySQL |

- A publicação (deploy) fica fora da metodologia: depois da documentação, o usuário publica na hospedagem que escolher.
- **Deploy** = processo de publicar o sistema no ambiente onde ele será usado de verdade.

### 2.12 Vocabulário técnico (tabela da metodologia — Termo/Explicação)

| Termo | Explicação simples |
|---|---|
| Decisão técnica | Escolha relacionada à forma como o sistema será construído ou organizado. |
| Stack | Conjunto de tecnologias usadas no projeto. |
| Ambiente local | Computador onde o sistema será desenvolvido e testado antes da publicação. |
| Produção | Ambiente real, onde o sistema será usado pelos usuários finais. |
| Homologação | Ambiente separado para testar o sistema antes de publicar oficialmente. |
| MVC | Padrão que separa dados, interface e controle do sistema. |
| Autenticação | Processo para identificar quem está entrando no sistema. |
| RBAC | Controle de acesso baseado em papéis de usuário. Define o que cada perfil pode fazer. |
| Auditoria | Registro de quem criou ou alterou informações importantes. |
| Soft delete | Exclusão lógica. O registro deixa de aparecer como ativo, mas continua guardado. |
| Log de erro | Registro de falhas técnicas do sistema. |
| Log de segurança | Registro de eventos sensíveis, como login inválido ou acesso negado. |
| Configurações globais | Opções administrativas que alteram o comportamento geral do sistema. |
| Upload | Envio de arquivo para o sistema. |
| Exportação | Geração de arquivo com dados do sistema, como CSV, PDF ou Excel. |
| API | Forma padronizada para sistemas conversarem entre si. |
| Integração externa | Comunicação do sistema com uma ferramenta ou serviço de terceiros. |

### 2.13 Como saber se este passo foi concluído

O passo estará concluído quando você tiver um arquivo **`DECISOES_TECNICAS.md` completo e validado por você**.

### 2.14 Resultado esperado deste passo

Ao final do capítulo você terá o documento `DECISOES_TECNICAS.md`, que será usado no próximo passo junto com `PRD.md` e `DESIGN.md`. No próximo capítulo, a IA usará esses três documentos para criar `FSD.md` — a especificação completa usada para orientar a IA codificadora na fase de desenvolvimento.

### 2.15 Exemplo simples (decisão funcional → decisões técnicas)

O PRD diz (exemplo da metodologia):
> O sistema deve permitir que administradores e operadores acessem áreas diferentes.

Isso é uma decisão funcional. Para preparar a construção, detalham-se decisões técnicas relacionadas:
> - O sistema terá autenticação por e-mail e senha.
> - O controle de acesso será baseado em papéis de usuário, usando RBAC.
> - O administrador terá acesso total.
> - O operador acessará apenas as áreas necessárias para executar suas tarefas.
> - As permissões devem ser validadas também no backend, não apenas na interface.

Essas informações entram no `DECISOES_TECNICAS.md`. No próximo passo, o FSD usará essas decisões para detalhar telas, fluxos, entidades, permissões e critérios de implementação.

---

## 3. Itens acionáveis (checklist executável)

**Documentos de entrada a anexar no chat novo:**
- `PRD.md` (obrigatório)
- `DESIGN.md` (quando existir)

**Comandos/ações a executar:**
1. Abrir chat novo com modelo de raciocínio.
2. Anexar `PRD.md` e `DESIGN.md`.
3. Rodar o **Prompt para criar o DECISOES_TECNICAS.md** (seção 2.5).
4. Responder às perguntas da IA uma por vez (padrões de resposta na seção 2.6; regra: responder "Não sei. Use o padrão sugerido." ou "Não quero incluir esse recurso na primeira versão.").
5. Revisar o documento gerado com o checklist da seção 2.8; se errado, usar os prompts de refinamento da seção 2.9 no mesmo chat.
6. Rodar o **Prompt para salvar o DECISOES_TECNICAS.md** (seção 2.7) e salvar o arquivo `DECISOES_TECNICAS.md` (fallback: copiar conteúdo em Markdown e salvar manualmente).

**Arquivo de saída:**
- `DECISOES_TECNICAS.md` (estrutura obrigatória de 16 seções — ver seção 2.5, "Geração do documento")

**Destino futuro:**
- `docs/FSD.md` (próximo passo, criado com base em `PRD.md` + `DECISOES_TECNICAS.md` + `DESIGN.md` quando disponível)

**Decisões padrão a aplicar quando o usuário não souber responder:**
- Stack: PHP + HTML + CSS + JavaScript puro + MySQL + Bootstrap local + organização em MVC.
- Ambiente local: XAMPP com PHP e MySQL.
- Testes/homologação: nenhum obrigatório na 1ª versão; testar localmente antes de publicar.
- Produção: hospedagem com PHP e MySQL.
- Arquitetura: MVC (Model/View/Controller), mesmo sem framework.
- Autenticação: e-mail e senha.
- Recursos estruturais mínimos: autenticação e-mail/senha, RBAC, auditoria básica (created_at/created_by/updated_at/updated_by), log de erros, configurações globais só se houver necessidade no PRD.
- Soft delete: em cadastros e registros principais quando houver exclusão; exclusão definitiva só se confirmada.
- Relatórios: apenas em tela; exportações só se confirmadas no PRD.
- Entrega à IA codificadora: FSD com seção de implementação sugerida em etapas pequenas, progressivas e testáveis.

---

## 4. Avisos sobre conteúdo ausente

- **Checklists estruturados no formato "checkbox":** o capítulo traz a lista de verificação para revisar o documento gerado (seção 2.8) e a lista de conclusão, mas não como checkboxes formais — são listas de itens a conferir. Nenhum checklist em formato de tabela/caixa de seleção está presente.
- **Não há prompts de modelo/estrutura de documento separados** além dos transcritos acima; o prompt principal já embute a estrutura completa do `DECISOES_TECNICAS.md` (16 seções).
- **Não há tabelas de "Erros comuns e como resolver"** explícitas no capítulo; os pontos de armadilha estão distribuídos no corpo do texto e foram consolidados na seção 2.4.
- **Conteúdo da metodologia limitado a este arquivo:** este documento cobre apenas o capítulo `analise-7.txt` (Passo 4). Os capítulos que criam `PRD.md` e `DESIGN.md` não estão neste arquivo e não foram analisados aqui.

# Grupo 5 — Passo 5 (FSD) e Passo 6 (Validação do FSD)

---

## 1. Visão geral do grupo

Este grupo cobre os dois passos que produzem e certificam o **documento mais importante antes da codificação**: o **FSD.md** (Functional Specification Document / Documento de Especificação Funcional).

- **Passo 5 (analise-8.txt)** — Cria o FSD.md a partir de três documentos já prontos (PRD.md, DECISOES_TECNICAS.md, DESIGN.md), transformando as decisões funcionais, técnicas e visuais em uma especificação completa, consolidada e **autossuficiente** que orientará a IA codificadora. Inclui também a revisão e o salvamento do arquivo.
- **Passo 6 (analise-9.txt)** — Valida o FSD.md em um **chat novo, com contexto limpo**, comparando-o contra todos os documentos da análise (PRD, decisões técnicas, design), classificando problemas por gravidade e gerando a versão final validada.

**Posição no fluxo:** Vem depois do PRD, das decisões técnicas e do design (Passos anteriores). O FSD ainda não encerra a análise — somente depois da validação do Passo 6 o projeto avança para a etapa de codificação. A IA codificadora usará principalmente `docs/FSD.md` + `docs/DESIGN.md`. O PRD e o DECISOES_TECNICAS.md continuam importantes **apenas como histórico da análise**, não como documentos necessários para implementação.

**Fluxo resumido:** PRD.md + DECISOES_TECNICAS.md (+ DESIGN.md) → [Passo 5] FSD.md (criar → revisar → corrigir → salvar) → [Passo 6] Relatório de Validação → correções aprovadas → nova validação → FSD.md validado → fase de codificação.

---

# CAPÍTULO: analise-8.txt — Passo 5: FSD

## Objetivo do capítulo

Criar o documento **FSD.md** — o documento mais importante antes da codificação. O FSD explica como o sistema deve funcionar em detalhes suficientes para orientar uma IA codificadora (Codex, Claude Code, Antigravity ou outra ferramenta de desenvolvimento assistido por IA). O capítulo apresenta o **prompt de criação**, o **prompt de revisão**, **exemplos de prompts de refinamento** e o **prompt para salvar** o arquivo final em `docs/FSD.md`.

## Passos EXATOS na ordem

1. Executar o **primeiro prompt principal** — "Prompt para criar o FSD" — em um **chat novo, com modelo de raciocínio**, anexando `PRD.md`, `DECISOES_TECNICAS.md` e `DESIGN.md` (quando existir).
2. Ler o FSD gerado com atenção e verificar se respeita o que foi decidido (perguntas de revisão manual).
3. Executar o **segundo prompt principal** — "Prompt 2 – Revisão do FSD" — **no mesmo chat** em que o FSD foi criado, para a IA revisar como revisor técnico independente.
4. Se houver ajustes, usar os **exemplos de prompts de refinamento** (correções específicas) no mesmo chat.
5. Executar o **terceiro prompt principal** — "Prompt para salvar o FSD" — depois que o FSD estiver **revisado e aprovado**, para obter o arquivo em Markdown.
6. Salvar o arquivo como **FSD.md** e colocar na **pasta docs** do projeto.

**Aviso para sistemas maiores (aplicável ao grupo):** Em sistemas grandes o FSD pode ficar extenso demais para chatbots (ChatGPT, Gemini, Claude) gerarem, revisarem, validarem ou disponibilizarem para download em uma única conversa. Nesse caso, usar uma **IA Agêntica** (Codex, Antigravity, Claude Code ou Claude Cowork), que trabalha diretamente com os arquivos da pasta do projeto, cria/atualiza o FSD.md no próprio diretório e lida melhor com documentos longos. Há dois capítulos extras: "Criar o FSD com uma IA Agêntica" e "Validar o FSD com uma IA Agêntica". Usar os capítulos extras **apenas** quando tamanho/complexidade dificultarem o fluxo com chatbots — mas sempre ler o capítulo normal para entender o FSD.

## PROMPTS COMPLETOS (transcrição VERBATIM)

### Prompt para criar o FSD (Prompt 1 – principal)

Uso: em um **novo chat** (contexto limpo), com modelo de raciocínio, anexando os arquivos:

```
PRD.md
DECISOES_TECNICAS.md
DESIGN.md
```

Texto integral do prompt:

```
# Prompt - Criar o FSD

Atue como Arquiteto de Sistemas, Analista de Sistemas sênior e Especialista em Desenvolvimento Web.

Seu objetivo é criar o Documento de Especificação Funcional do sistema, também chamado de FSD.

FSD significa Functional Specification Document.

O FSD final deverá ser gerado em Markdown e salvo posteriormente no projeto como:

`docs/FSD.md`

## Documentos esperados

Antes de começar, verifique se os seguintes documentos foram fornecidos:

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
```

### Prompt 2 – Revisão do FSD

Uso: **no mesmo chat** em que o FSD foi criado, depois que a IA gerar o FSD.

```
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
```

### Exemplos de prompts de refinamento (7 prompts; usar APENAS se o FSD precisar de ajustes)

#### Corrigir stack do projeto

```
Revise a seção de stack definida.

A stack correta do projeto será:

- PHP;
- HTML;
- CSS;
- JavaScript puro;
- MySQL;
- Bootstrap local;
- organização em MVC.

Atualize o FSD completo considerando essa stack.

Não altere o escopo funcional definido no PRD.
```

#### Corrigir arquitetura do sistema

```
Revise a seção de arquitetura do sistema.

O projeto deve seguir uma organização baseada em Model-View-Controller.

Ajustes necessários:

- Models devem concentrar acesso aos dados e regras ligadas às entidades.
- Controllers devem receber as requisições, acionar Models e escolher as respostas adequadas.
- Views devem concentrar a interface exibida ao usuário.
- Arquivos de configuração, helpers e assets devem ficar separados.
- Evite misturar HTML, consultas ao banco de dados e regras de negócio no mesmo arquivo.

Atualize o FSD completo considerando essa organização.
```

#### Corrigir referência ao DESIGN.md

```
Revise todas as referências ao documento de design.

O arquivo de design da interface deve ser considerado no caminho:

docs/DESIGN.md

O FSD deve deixar claro que a IA codificadora deve consultar esse arquivo antes de criar ou alterar telas, componentes, formulários, tabelas, botões, menus, mensagens e padrões visuais.

Atualize o FSD completo considerando essa orientação.
```

#### Corrigir perfis de usuário e permissões

```
Revise a seção de perfis de usuário, permissões e controle de acesso.

Ajustes necessários:

- o administrador terá acesso total ao sistema;
- apenas o administrador poderá criar novos usuários;
- apenas o administrador poderá alterar configurações globais do sistema;
- usuários operacionais poderão acessar apenas as áreas necessárias para executar suas tarefas;
- perfis sem permissão não devem visualizar menus, telas ou ações bloqueadas;
- as permissões devem ser validadas também no backend, não apenas na interface.

Atualize o FSD completo considerando essas regras.
```

#### Corrigir modelo de dados

```
Revise a seção de modelo de dados proposto.

Verifique se:

- todas as entidades importantes do escopo consolidado foram contempladas;
- não existem tabelas desnecessárias;
- os relacionamentos fazem sentido;
- as chaves estrangeiras estão coerentes;
- os campos de auditoria foram incluídos quando necessário;
- os campos de soft delete foram incluídos quando necessário;
- os tipos de campos são adequados;
- existem índices para buscas, filtros e relacionamentos importantes.

Não crie código SQL ainda.

Primeiro, liste os problemas encontrados e sugira correções.
```

#### Remover recursos avançados não confirmados

```
O FSD incluiu recursos que não foram confirmados no PRD nem no DECISOES_TECNICAS.md.

Remova da primeira versão os seguintes recursos:

- APIs;
- integrações externas;
- exportações;
- automações avançadas;
- aplicativo mobile.

Mantenha esses itens apenas como possibilidades futuras, se fizer sentido.

Atualize também:

- escopo funcional;
- fora de escopo;
- modelo de dados;
- módulos e telas;
- critérios de aceitação.
```

#### Melhorar clareza técnica para IA codificadora

```
Reescreva o FSD para ficar mais claro e útil para uma IA codificadora.

Mantenha todas as decisões já aprovadas.

Melhore principalmente:

- organização das seções;
- detalhamento das entidades;
- modelo de dados proposto;
- fluxos funcionais;
- validações;
- permissões;
- critérios de aceitação técnica;
- pontos pendentes.

Não adicione novas funcionalidades.

Não inclua referências a skills ou subagentes.
```

### Prompt para salvar o FSD

Uso: **depois que o FSD estiver revisado e aprovado**.

```
Forneça o FSD completo para download em Markdown.

Nome do arquivo: FSD.md

Caso a IA não consiga gerar arquivo para download, peça o conteúdo completo em Markdown e salve manualmente em um arquivo chamado FSD.md.

Depois, coloque esse arquivo na pasta docs do projeto.
```

### Revisão manual do FSD (checklist de leitura do usuário)

Após a geração, o usuário deve ler o documento com atenção (sem precisar entender todos os detalhes técnicos) e verificar se ele respeita o que foi decidido. Perguntas da revisão manual:

- O FSD respeita o PRD?
- O FSD respeita o DECISOES_TECNICAS.md?
- O FSD considera o DESIGN.md?
- O FSD não inventou funcionalidades?
- A stack está correta?
- A arquitetura está correta?
- Os ambientes estão corretos?
- Os perfis de usuário estão corretos?
- As permissões fazem sentido?
- As entidades fazem sentido?
- O modelo de dados parece coerente com o sistema?
- As telas e módulos batem com o escopo e com o design?
- As regras de negócio foram detalhadas?
- A autenticação está clara?
- O controle de acesso está claro?
- Os logs necessários foram definidos?
- A auditoria foi tratada corretamente?
- O soft delete foi incluído quando necessário?
- Uploads e anexos aparecem apenas se forem necessários?
- Exportações aparecem apenas se forem necessárias?
- APIs e integrações aparecem apenas se foram confirmadas?
- Existem pendências antes da codificação?
- O documento não depende da conversa anterior?

Se houver erro, pedir à IA para corrigir antes de salvar o FSD final.

## Modelos / estruturas de documentos citados

- **`docs/FSD.md`** — arquivo final do FSD (salvo na pasta docs do projeto).
- **`docs/DESIGN.md`** — arquivo de design (obrigatório estar em docs no repositório final; anexado quando existir).
- **`PRD.md`** — fonte funcional (obrigatório para criar o FSD; NÃO entregue à IA codificadora).
- **`DECISOES_TECNICAS.md`** — fonte técnica (obrigatório para criar o FSD; NÃO entregue à IA codificadora).
- **Estrutura obrigatória do FSD** — 28 seções numeradas: 1. Visão Geral; 2. Documentos do Projeto para Implementação; 3. Stack Definida; 4. Ambientes do Projeto; 5. Arquitetura do Sistema; 6. Escopo Funcional da Primeira Versão; 7. Fora de Escopo; 8. Perfis de Usuário e Permissões; 9. Recursos Estruturais do Sistema; 10. Entidades do Sistema; 11. Modelo de Dados Proposto; 12. Módulos e Telas; 13. Fluxos Funcionais; 14. Validações e Regras de Negócio; 15. Autenticação e Sessão; 16. Controle de Acesso; 17. Auditoria e Histórico; 18. Soft Delete e Exclusões; 19. Logs (Log de erros / Log de segurança); 20. Configurações Globais; 21. Uploads, Anexos e Arquivos; 22. Relatórios, Consultas e Exportações; 23. APIs e Integrações Externas; 24. Segurança Funcional; 25. Organização Sugerida da Implementação; 26. Critérios de Aceitação Técnica e Funcional; 27. Pontos Pendentes e Decisões Futuras; 28. Conclusão.
- **Pastas/mecanismos internos citados:** `config/config.php`, `config/configuracoes.php`, `database/migrations/`, `app/database/migrations/`, `config/`, `app/`, `models/`, `controllers/`, `views/`, `assets/`, `database/`, `migrations/`, `logs/`, arquivo de entrada `index.php` (projetos PHP), `.htaccess` (proteção adicional, não exclusiva).
- **Referência de raiz do projeto:** `[Diretório do Projeto - Repositório]` — expressões proibidas como nome principal: `[Diretório Público - public_html / public]`, `[Diretório Raiz Privado - Fora do acesso web]`, `public_html`, `public`, `htdocs`, `www`.

## Regras, avisos, boas práticas e armadilhas

- **Fases e bloqueios:** O FSD é um documento de especificação; **não cria código, não cria arquivos do sistema, não executa comandos, não instala dependências, não cria banco de dados real, não altera arquivos do projeto, não inventa funcionalidades, não ignora PRD/DECISOES_TECNICAS/DESIGN**.
- **O FSD deve ser autossuficiente:** compreendido sem depender da conversa anterior; a IA codificadora deve entender o sistema lendo principalmente `docs/FSD.md` + `docs/DESIGN.md`; PRD e decisões técnicas não devem ser consultados pela IA codificadora.
- **Lacuna crítica:** informação sem a qual o FSD não pode ser gerado com segurança (ex.: falta PRD.md; falta DECISOES_TECNICAS.md; PRD diz que haverá login mas decisões dizem que não haverá autenticação; PRD cita perfis mas nenhum perfil definido; sistema exige uploads sem regras mínimas; funcionalidades centrais sem definição suficiente). Se houver lacuna crítica, a IA para e faz **uma única pergunta objetiva**.
- **Conflitos entre documentos:** se impedirem criação segura → parar e perguntar; se pequenos → registrar decisão adotada direto no FSD; se houver conflito PRD vs decisão técnica que afete escopo/banco/permissões/fluxos principais/segurança → pedir confirmação, nunca inventar solução.
- **Não reabrir decisões confirmadas** a menos que haja conflito claro, impossibilidade técnica ou risco importante.
- **Não mencionar skills, subagentes nem recomendar agentes especializados** no FSD.
- **Sem `.env`:** usar arquivo de configuração em código (`config/config.php` / `config/configuracoes.php` em PHP; extensão conforme a linguagem). Motivo: erro de configuração do servidor pode expor o `.env` como texto no navegador. Carregar apenas internamente (`require`, `include`, importação, autoload...).
- **Migrations obrigatórias** para criar/atualizar estrutura do banco (evitar phpMyAdmin manual); com controle de execução duplicada (tabela de controle, scripts versionados, comando interno seguro, rotina administrativa protegida...); dentro de pasta interna; **nunca** acessíveis por URL aberta; execução por meio controlado (CLI, rotina protegida, painel restrito a administradores, comando da stack).
- **`.htaccess` não é proteção única:** a aplicação também deve evitar expor arquivos internos por links diretos, rotas públicas ou referências indevidas.
- **Logs:** log de erros em banco exige contingência para gravar em arquivo (banco indisponível, conexão falha, erro impede registro normal, falha antes da inicialização completa); log em arquivo fora da pasta pública.
- **Uploads/exportações/APIs:** incluir no FSD apenas se confirmados no escopo; se não existirem, declarar que não fazem parte da primeira versão.
- **Exportação CSV:** dados exportados devem respeitar os mesmos filtros e permissões da tela.
- **Não criar SQL final completo** a menos que solicitado.
- **Ambiente:** projeto criado inicialmente no XAMPP (dentro de `htdocs/nome-do-projeto/`), depois pode ir para hospedagem PHP+MySQL, como uma VPS (`www/nome-do-projeto/`); usuário pode usar subpastas para vários sistemas.
- **Índices:** incluir índices para evitar lentidão em consultas, relatórios, dashboards, listagens e buscas frequentes.

## Checklists mencionados

1. **Checklist de revisão manual (23 perguntas)** — listado acima na seção "Revisão manual do FSD".
2. **Prompt de revisão do FSD (12 pontos)** — checklist embutido no prompt (autossuficiência; referências proibidas; entidades nas telas/fluxos/regras vs modelo de dados; permissões vs matriz; funcionalidade citada fora do escopo; escopo sem tela/fluxo/regra; campos de auditoria/soft delete; índices vs filtros de relatórios/dashboards/buscas/listagens; contradições; decisão essencial faltando; itens que não devem ser inventados; respeito ao DESIGN.md).
3. **Organização sugerida da implementação (24 etapas)** — dentro da estrutura do FSD (seção 25), para dividir a implementação da IA codificadora.
4. **Critérios de aceitação técnica e funcional (lista do FSD, seção 26)** — funcionalidades implementadas, arquitetura respeitada, responsabilidades separadas, permissões, validações, banco coerente, índices, logs, contingência, auditoria, soft delete, telas aderentes ao design, erros seguros, sem funcionalidades inventadas, revisões de segurança/qualidade concluídas, estrutura a partir do `[Diretório do Projeto - Repositório]`, sem nomes fixos de pasta pública, config em código sem `.env`, credenciais não expostas, pastas internas protegidas, migrations (criadas; contemplando tabelas/campos/índices/constraints; com controle anti-duplicação; não acessíveis pelo navegador; execução controlada).

## Vocabulário técnico (tabela da metodologia)

| Termo | Explicação simples |
| --- | --- |
| FSD | Documento que detalha como o sistema deve funcionar para ser desenvolvido. |
| PRD | Documento que explica o que o sistema deve fazer. |
| DECISOES_TECNICAS.md | Documento que registra as escolhas técnicas do projeto. |
| DESIGN.md | Documento que orienta o padrão visual da interface. |
| Stack | Conjunto de tecnologias usadas no projeto. |
| MVC | Padrão que separa dados, interface e controle do sistema. |
| Entidade | Informação importante que o sistema precisa armazenar ou controlar. |
| Modelo de dados | Organização das tabelas, campos e relações do banco de dados. |
| Fluxo funcional | Sequência de passos que o usuário executa para realizar uma ação no sistema. |
| Validação | Regra usada para conferir se uma informação foi preenchida corretamente. |
| Regra de negócio | Regra própria do funcionamento do sistema. |
| Critério de aceitação | Condição usada para verificar se algo foi implementado corretamente. |
| Autossuficiente | Documento que pode ser entendido sem depender da conversa anterior. |

Definições adicionais no capítulo (dentro do prompt): **MVC** = Model (dados/regras ligadas aos dados/comunicação com banco), View (interface), Controller (recebe ações, aciona regras, escolhe resposta/tela). **Migration** = arquivo ou script versionado que cria/altera tabelas, campos, índices e constraints de forma controlada. **Lacuna crítica** = ausência de decisão que impeça a criação segura do FSD.

## Erros comuns e como resolver

- **Funcionalidades inventadas** (APIs, integrações, uploads, exportações, dashboards não confirmados) → remover via prompt "Remover recursos avançados não confirmados".
- **Stack errada no FSD** → prompt "Corrigir stack do projeto" (ex.: PHP; HTML; CSS; JavaScript puro; MySQL; Bootstrap local; organização em MVC), sem alterar o escopo funcional do PRD.
- **Arquitetura sem separação MVC** → prompt "Corrigir arquitetura do sistema" (Models concentram dados/regras; Controllers recebem requisições, acionam Models, escolhem respostas; Views concentram interface; config/helpers/assets separados; evitar misturar HTML, consultas e regras de negócio no mesmo arquivo).
- **Referências incorretas ao DESIGN.md** → prompt "Corrigir referência ao DESIGN.md" (caminho `docs/DESIGN.md`; IA codificadora deve consultá-lo antes de criar/alterar telas, componentes, formulários, tabelas, botões, menus, mensagens e padrões visuais).
- **Perfis/permissões incorretos** → prompt "Corrigir perfis de usuário e permissões" (admin com acesso total; só admin cria usuários e altera configs globais; operacionais acessam só o necessário; perfis sem permissão não veem menus/telas/ações bloqueadas; permissões validadas também no backend).
- **Modelo de dados com falhas** → prompt "Corrigir modelo de dados" (entidades contempladas, sem tabelas desnecessárias, relacionamentos coerentes, FKs coerentes, auditoria/soft delete quando necessário, tipos adequados, índices para buscas/filtros/relacionamentos); não criar SQL ainda.
- **FSD confuso para a IA codificadora** → prompt "Melhorar clareza técnica para IA codificadora" (seções, entidades, modelo de dados, fluxos, validações, permissões, critérios de aceitação, pontos pendentes) sem adicionar funcionalidades nem citar skills/subagentes.
- **Problemas encontrados na revisão** → a IA lista problema/seção/correção proposta e **aguarda aprovação** antes de aplicar; após aprovação, aplica as correções e gera a versão final.

## Resultado esperado do passo

Arquivo **FSD.md** completo e revisado pelo usuário, colocado em **docs/**. Este passo ainda não encerra a análise — é recomendável fazer a etapa de validação (Passo 6) antes de avançar para a codificação.

---

# CAPÍTULO: analise-9.txt — Passo 6: Validação do FSD

## Objetivo do capítulo

Validar o documento **FSD.md** — verificar se ele está correto, completo e coerente **antes** da codificação, como se fosse uma revisora técnica independente. O objetivo é conferir se o FSD cobre o que foi definido no PRD, respeita as decisões técnicas, segue o padrão visual, não inventa funcionalidades e contém informações suficientes para orientar a codificação. A validação é feita em **um chat novo, com contexto limpo**, comparando o FSD com todos os documentos da análise.

## Passos EXATOS na ordem

1. Abrir um **chat novo, com modelo de raciocínio**.
2. Anexar os quatro documentos: `PRD.md`, `DECISOES_TECNICAS.md`, `DESIGN.md` (quando existir) e `FSD.md`.
3. Executar o **primeiro prompt principal** — "Prompt 1 – Validar o FSD". A IA gera **apenas um relatório de validação** (não reescreve o FSD ainda), classificando os problemas por gravidade.
4. Ler o relatório e interpretar o "Resultado geral" (ver bloco "Como interpretar o relatório").
5. Escolher quais correções serão aplicadas (todas ou apenas algumas).
6. Executar o **segundo prompt principal** — "Prompt 2 – Aplicar correções aprovadas" (variante "todas" ou variante "selecionadas"). A IA gera uma nova versão completa do FSD em Markdown.
7. Executar o **Prompt 3 – Nova validação após correções** (no mesmo chat) para uma última verificação.
8. Executar o **"Prompt para salvar o FSD validado"** para obter a versão final validada.
9. Salvar como **FSD.md** na pasta docs do projeto, **substituindo** o FSD gerado no passo anterior.

**Aviso para sistemas maiores:** idêntico ao do Passo 5 — para sistemas grandes, usar IA Agêntica (Codex, Antigravity, Claude Code ou Claude Cowork) e os capítulos extras "Criar o FSD com uma IA Agêntica" / "Validar o FSD com uma IA Agêntica".

## PROMPTS COMPLETOS (transcrição VERBATIM)

### Prompt 1 – Validar o FSD

Uso: em um **novo chat** (contexto limpo), modelo de raciocínio, anexando:

```
PRD.md
DECISOES_TECNICAS.md
DESIGN.md
FSD.md
```

Texto integral do prompt:

```
# Prompt - Validar o FSD

Atue como Revisor Técnico Independente, Arquiteto de Sistemas e Analista de Qualidade de Especificação.

Seu objetivo é validar o Documento de Especificação Funcional, também chamado de FSD.

FSD significa Functional Specification Document.

Você deve analisar os documentos fornecidos e verificar se o FSD está correto, completo, coerente e pronto para orientar uma IA codificadora.

## Documentos esperados

Antes de começar, verifique se os seguintes documentos foram fornecidos:

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

### Como interpretar o relatório (blocos "Copiar" de leitura)

- `Aprovado para codificação` → o FSD está pronto para seguir.
- `Aprovado com ajustes recomendados` → você pode corrigir os pontos indicados antes de avançar; normalmente vale a pena corrigir.
- `Reprovado temporariamente até correções críticas` → **não avance para a codificação**; corrija o FSD primeiro.

### Prompt 2 – Aplicar correções aprovadas

Depois de ler o relatório, escolher quais correções serão aplicadas (todas ou apenas algumas).

**Variante "todas as correções":**

```
Aplique todas as correções sugeridas no relatório de validação.

Gere uma nova versão completa do FSD em Markdown.

Mantenha o FSD autossuficiente.

Não adicione funcionalidades novas.

Não altere decisões aprovadas.

Não inclua referências à conversa anterior.

O arquivo final deverá ser salvo posteriormente como: FSD.md
```

**Variante "apenas algumas correções":**

```
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

### Prompt 3 – Nova validação após correções

Uso: **no mesmo chat**, depois que a IA gerar a nova versão do FSD (verificação final).

```
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

### Prompt para salvar o FSD validado

Uso: quando o FSD estiver validado.

```
Forneça o FSD validado completo para download em Markdown.

Nome do arquivo: FSD.md

Caso a IA não consiga gerar arquivo para download, peça o conteúdo completo em Markdown e salve manualmente em um arquivo chamado FSD.md.

Depois, coloque esse arquivo na pasta docs do projeto.
```

## Modelos / estruturas de documentos citados

- **`docs/FSD.md`** — documento validado; deve substituir o FSD do passo anterior.
- **`docs/DESIGN.md`** — padrão visual (fornecido quando existir).
- **`PRD.md`**, **`DECISOES_TECNICAS.md`** — fontes de comparação (obrigatórias na validação).
- **Relatório de Validação do FSD** — estrutura de 11 seções: 1. Resultado geral; 2. Documentos analisados; 3. Resumo dos problemas encontrados (tabela ID/Gravidade/Seção/Problema/Correção); 4. Problemas críticos; 5. Problemas importantes; 6. Melhorias recomendadas; 7. Verificação de cobertura do PRD; 8. Verificação das decisões técnicas; 9. Verificação do design; 10. Verificação de autossuficiência; 11. Recomendação final.
- **IDs de problemas:** C1, C2, C3 (críticos); I1, I2, I3 (importantes); M1, M2, M3 (melhorias).

## Regras, avisos, boas práticas e armadilhas

- **Diferença entre revisar e validar:** Revisão acontece no mesmo chat de criação, para encontrar problemas iniciais logo após a geração. Validação acontece em **novo chat com contexto limpo**, comparando o FSD com todos os documentos da análise. A validação em chat novo é melhor para encontrar inconsistências — a IA não estará influenciada pela conversa usada para criar o FSD.
- **Por que validar:** o FSD orienta a IA codificadora; falhas no FSD levam a codificação a um caminho errado. Problemas (funcionalidade do PRD fora do FSD, regra de negócio incompleta, permissão numa tela mas não na matriz, entidade num fluxo mas não no modelo de dados, API inventada, exportação adicionada sem confirmação, regra de upload vaga, decisão técnica ignorada, tela fora do DESIGN.md) são mais fáceis de corrigir **antes** da codificação — depois que a IA codificadora criar arquivos, banco e telas, corrigir fica mais trabalhoso.
- **A IA não deve reescrever o FSD imediatamente:** primeiro gera o relatório de validação (problemas encontrados, onde aparece, por que importa, sugestão de correção, gravidade, se bloqueia a codificação). Só depois da aprovação do usuário a IA gera a versão revisada. Isso evita alteração sem autorização.
- **Documentos obrigatórios na validação:** PRD.md, DECISOES_TECNICAS.md e FSD.md (três obrigatórios; se faltar algum, a IA para e solicita o arquivo ausente). DESIGN.md é usado quando fornecido; se não for fornecido, a IA continua e registra no relatório a ausência.
- **Classificação de problemas:** **Crítico** = impede iniciar a codificação com segurança (funcionalidade central ausente; conflito PRD vs FSD; ausência de permissões em sistema com perfis; modelo de dados sem entidade essencial; decisão técnica obrigatória ignorada; item fora de escopo incluído como funcionalidade da primeira versão). **Importante** = não impede totalmente, mas gera retrabalho/erro/confusão (fluxo pouco detalhado; regra de negócio incompleta; tela sem estados importantes; relatório sem filtros; log vago; exportação sem regras de permissão). **Melhoria** = clareza/organização/detalhamento (texto confuso; seção repetitiva; critérios de aceitação poderiam ser mais objetivos; nomenclatura poderia ser padronizada).
- **Modelo recomendado:** com raciocínio (exige comparação entre documentos; modelo simples pode deixar passar erros).
- **Resultado geral:** "Aprovado para codificação" → seguir; "Aprovado com ajustes recomendados" → corrigir antes de avançar (normalmente vale a pena); "Reprovado temporariamente até correções críticas" → não avançar, corrigir o FSD primeiro.
- **Correções:** o usuário pode aprovar todas ou apenas algumas (usar IDs no Prompt 2). A nova versão deve manter o FSD autossuficiente, sem funcionalidades novas, sem alterar decisões aprovadas, sem referências à conversa anterior; salvar como FSD.md.
- **Nova validação:** verificar se as correções foram aplicadas corretamente e se não criaram novas inconsistências; declarar "O FSD revisado está validado e pronto para a codificação." ou listar problemas restantes com gravidade e correção sugerida.
- **Frase de autossuficiência verificada:** o FSD deve evitar referências como "segundo o PRD", "conforme o documento de decisões técnicas", "como dito anteriormente", "ver conversa", "consultar mensagens anteriores".

## Checklists mencionados

1. **Checklist de validação (37 pontos)** — embutido no Prompt 1 (ver transcrição acima): cobertura do PRD, fora de escopo, decisões técnicas, DESIGN.md, sem funcionalidades inventadas, sem APIs/integrações/uploads/exportações/dashboards sem confirmação, sem contradições, stack, ambientes, arquitetura, perfis, permissões/restrições, matriz de permissões, entidades, modelo de dados, auditoria, soft delete, telas/módulos, fluxos, validações/regras, autenticação, controle de acesso, logs, contingência de log em arquivo, configurações globais, uploads, relatórios/exportações, APIs/integrações, segurança funcional, critérios de aceitação, pendências não bloqueantes, decisões essenciais, autossuficiência, não exigir consulta ao PRD/decisões, consolidação.
2. **Estrutura do relatório de validação (11 seções)** — listada acima.
3. **Análise final pós-correções** — itens a verificar no Prompt 3 (cobertura PRD; respeito ao DECISOES_TECNICAS.md e DESIGN.md; entidades; modelo de dados; telas; fluxos; permissões; auditoria; soft delete; logs; uploads; exportações; APIs; segurança funcional; critérios de aceitação; ausência de funcionalidades inventadas; ausência de referências à conversa anterior; ausência de skills e subagentes).

## Vocabulário especializado / termos definidos

- **Validar** = verificar se o documento está correto, completo e coerente antes de avançar para a codificação.
- **Revisão do FSD** = etapa que acontece no mesmo chat da criação; objetivo: encontrar problemas iniciais logo após a geração.
- **Validação do FSD** = etapa em novo chat com contexto limpo; objetivo: comparar o FSD com todos os documentos da análise.
- **Crítico / Importante / Melhoria** = níveis de gravidade dos problemas (ver classificação acima).
- (Tabela Termo/Explicação da metodologia não é repetida neste capítulo — termos FSD, PRD, DECISOES_TECNICAS.md, DESIGN.md mantêm os mesmos significados do capítulo anterior; não há nova tabela de vocabulário neste capítulo.)

## Erros comuns e como resolver

Problemas típicos que a validação deve pegar (e que são mais fáceis de corrigir antes da codificação):

- funcionalidade do PRD ficou fora do FSD → cobertura do PRD (seção 7 do relatório);
- regra de negócio incompleta → problema Importante;
- permissão aparece numa tela, mas não na matriz de acesso → problema Importante/Crítico conforme impacto;
- entidade aparece num fluxo, mas não no modelo de dados → problema Crítico;
- API inventada sem estar no escopo → problema Crítico (item fora de escopo incluído);
- exportação adicionada sem confirmação → problema Crítico/Importante;
- regra de upload vaga → problema Importante;
- decisão técnica ignorada → problema Crítico;
- tela que não respeita o DESIGN.md → problema conforme gravidade (verificação do design, seção 9).

**Resolução:** a IA gera o relatório com ID/gravidade/seção/problema/correção → usuário aprova (todas ou algumas, por ID) → Prompt 2 gera nova versão → Prompt 3 revalida → salva o FSD validado. **Não avançar para a codificação** enquanto houver problemas críticos.

## Resultado esperado do passo

Arquivo **FSD.md** revisado, corrigido e validado, colocado em docs/ do projeto. Esse é o documento principal para iniciar a fase de codificação com IA. A IA codificadora deverá usar principalmente:

```
docs/FSD.md
docs/DESIGN.md
```

O PRD e o documento de decisões técnicas continuam importantes **como histórico da análise**, mas o FSD validado consolida as informações necessárias para orientar a implementação.

---

## 3. Itens acionáveis (resumo executável)

**Documentos de saída a produzir:**
1. `docs/FSD.md` (criado no Passo 5, substituído pela versão validada no Passo 6).
2. `docs/DESIGN.md` (já existente; usado como fonte visual e entregue à IA codificadora junto com o FSD).
3. Relatório de Validação do FSD (saída intermediária do Prompt 1 do Passo 6).

**Documentos de entrada necessários:**
- Passo 5: `PRD.md`, `DECISOES_TECNICAS.md` (obrigatórios), `DESIGN.md` (se existir).
- Passo 6: `PRD.md`, `DECISOES_TECNICAS.md`, `FSD.md` (obrigatórios), `DESIGN.md` (se existir).

**Comandos/fluxo de execução (chat por chat):**
1. Chat novo com modelo de raciocínio → anexar PRD + DECISOES_TECNICAS + DESIGN → rodar **Prompt para criar o FSD**.
2. Mesmo chat → revisão manual (23 perguntas) → rodar **Prompt 2 – Revisão do FSD**.
3. Mesmo chat → aplicar prompts de refinamento se necessário (7 modelos disponíveis).
4. Mesmo chat → **Prompt para salvar o FSD** → salvar `FSD.md` na pasta docs.
5. Chat NOVO com modelo de raciocínio → anexar PRD + DECISOES_TECNICAS + DESIGN + FSD → rodar **Prompt 1 – Validar o FSD**.
6. Interpretar resultado geral do relatório.
7. Mesmo chat → **Prompt 2 – Aplicar correções aprovadas** (todas ou por IDs).
8. Mesmo chat → **Prompt 3 – Nova validação após correções**.
9. Mesmo chat → **Prompt para salvar o FSD validado** → substituir `FSD.md` na pasta docs.

**Prompts a executar (todos transcritos verbatim neste documento):**
- Passo 5: "Prompt para criar o FSD"; "Prompt 2 – Revisão do FSD"; 7 "Exemplos de prompts de refinamento" (Corrigir stack do projeto; Corrigir arquitetura do sistema; Corrigir referência ao DESIGN.md; Corrigir perfis de usuário e permissões; Corrigir modelo de dados; Remover recursos avançados não confirmados; Melhorar clareza técnica para IA codificadora); "Prompt para salvar o FSD".
- Passo 6: "Prompt 1 – Validar o FSD"; "Prompt 2 – Aplicar correções aprovadas" (2 variantes); "Prompt 3 – Nova validação após correções"; "Prompt para salvar o FSD validado".

**Notas de ambiente:** sistema criado inicialmente no XAMPP (`htdocs/nome-do-projeto/`), depois publicação em hospedagem PHP+MySQL (ex.: `www/nome-do-projeto/`); usar subpastas para múltiplos sistemas; raiz de referência sempre `[Diretório do Projeto - Repositório]`; nunca usar `.env` para credenciais (usar `config/config.php` ou `config/configuracoes.php`); migrations obrigatórias e não expostas publicamente; `.htaccess` como proteção adicional, nunca única. Para sistemas grandes que excedam chatbots, usar IA Agêntica (Codex, Antigravity, Claude Code, Claude Cowork) e os capítulos extras da metodologia.

