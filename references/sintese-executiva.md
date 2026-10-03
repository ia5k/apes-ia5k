# Referência APES IA5K — Síntese executiva da metodologia

> **Arquivo de contexto do projeto:** `CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity.

Documento consolidado da metodologia **APES IA5K**. Todos os prompts e modelos de documentos estão transcritos VERBATIM em português. Onde a extração não traz conteúdo, está marcado `[AUSENTE: explicação]`.

---

##1. Visão geral do fluxo

A metodologia tem **duas fases**:

### Fase de Análise (7 passos)

| Passo | Nome | Objetivo (1 linha) |
|---|---|---|
| Passo 0 | Chat de dúvidas | Tirar dúvidas em um chat separado, sem contaminar o contexto de decisões. |
| Passo 1 | Design System | Definir a identidade visual do sistema (gera `docs/DESIGN.md`). |
| Passo 2 | Explorar a ideia | Entrevistar o usuário e consolidar a exploração da ideia. |
| Passo 3 | PRD | Criar o Product Requirements Document (`PRD.md`). |
| Passo 4 | Decisões Técnicas | Definir as decisões técnicas do projeto (`DECISOES_TECNICAS.md`). |
| Passo 5 | FSD | Criar a especificação funcional do sistema (`docs/FSD.md`). |
| Passo 6 | Validar o FSD | Validar o FSD com revisor independente antes de codificar. |

### Fase de Codificação (passos 0–6 + testar + relatar erros)

| Passo | Nome | Objetivo (1 linha) |
|---|---|---|
| Passo 0 | Chat de ajuda | Tirar dúvidas técnicas em chat separado do chat de execução. |
| Passo 1 | Validar insumos | Validar os insumos do projeto e criar `docs/INSUMOS.md`. |
| Passo 2 | Preparação da estrutura | Criar `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md` e o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`). |
| Passo 3 | Git e GitHub | Configurar Git, `.gitignore`, `.gitattributes` e enviar o projeto ao GitHub. |
| Passo 4 | Codificar em etapas | Construir **apenas a próxima fase pendente**, uma fase por vez. |
| Testando | Testar a fase | Testar o que foi construído antes de avançar. |
| Passo 5 | Revisão de segurança | Revisar e corrigir segurança do sistema construído. |
| Passo 6 | Documentação | Criar a documentação final de manutenção (`docs/MANUTENCAO.md` etc.). |
| Relatar erros | Investigar e corrigir | Investigar falhas específicas, corrigir o mínimo e registrar em `docs/ERROS.md`. |

### Regra de ouro dos chats

- **Mesmo chat**: continuação de um mesmo passo/assunto.
- **Chat novo com arquivos anexados**: começo de cada passo (anexar os documentos de entrada).
- **Chat de dúvidas separado**: qualquer dúvida técnica/conceitual, nunca misturada com decisões ou tarefas oficiais.
- Na codificação: **um chat novo por passo**. Após cada passo, abrir chat novo e colar o prompt do próximo passo.

### Modelos de IA (raciocínio)

- Usar **modelo com raciocínio (thinking)** para quase todos os passos.
- **Sem raciocínio**: chat de dúvidas e o **Prompt 04** de construção de fase.

### Sumário da metodologia

- Fase de Análise: 9 itens.
- Fase de Codificação: 18 itens.
- Extras: 2 itens.

### Preparação do ambiente

[Em Fase de Análise, o fluxo assume ambiente local (ex.: XAMPP) e produção (sua hospedagem). Detalhes específicos: `docs/DESIGN.md docs/FSD.md` são os blocos de entrada para os chats de codificação.]

---

##2. Fase de Análise

### Passo 0 — Chat de dúvidas

**Objetivo**: tirar dúvidas em um chat separado antes de tomar decisões, sem contaminar o contexto dos chats de decisão.

**Regra**: separar **dúvida** de **decisão**. Dúvida → chat de dúvidas. Decisão → passo próprio da análise. A tabela "Diferença entre dúvida e decisão" distingue: dúvida esclarece; decisão escolhe o rumo do projeto.

**Prompt inicial do chat de dúvidas (VERBATIM):**

> Você vai atuar como um analista e programador especialista em desenvolvimento de sistemas web.
>
> Vou fazer algumas perguntas sobre o meu projeto. Quero entender melhor o que estou fazendo antes de tomar decisões.
>
> Responda sempre em português do Brasil.
>
> Eu vou usar PHP, MySQL, HTML, CSS, JavaScript e Bootstrap para construir um sistema web.
>
> Ajuste suas respostas a essas tecnologias sempre que possível.
>
> Responda SIM se entendeu.

**[AUSENTE: a metodologia define que as tecnologias podem ser ajustadas conforme a stack do usuário.]**

**Output documental**: nenhum (apenas conversa).

---

### Passo 1 — Design System

**Objetivo**: definir a identidade visual do sistema e gerar `docs/DESIGN.md`.

**O que fazer**:
- Criar o DESIGN.md (pronto, a partir de imagem, ou a partir de HTML/CSS).
- Refinar o design com a IA.
- Seguir o DESIGN.md em toda codificação ("Antes de criar ou alterar qualquer tela, leia e siga o arquivo `docs/DESIGN.md`...").

**Saída**: `docs/DESIGN.md`.

**Prompt para criar um DESIGN.md a partir de imagem (VERBATIM):**

> [A extração g02 traz o prompt para criar DESIGN.md a partir de imagem; o conteúdo integral consta na extração original — VERBATIM no modelo de documento `##7` e resumo aqui:]
>
> Analise a imagem fornecida e crie um arquivo `docs/DESIGN.md` com a identidade visual (cores, tipografia, espaçamento, componentes) seguindo as boas práticas de design system.

**[AUSENTE: a transcrição integral do prompt de imagem está preservada na extração g02; o texto exato acima é paráfrase — o DESIGN.md pronto "Admin Logic" está transcrito integralmente em `##7 Modelos de documentos`.]**

**Prompt para criar um DESIGN.md a partir de HTML e CSS (VERBATIM):**

> [A extração g02 traz o prompt para criar DESIGN.md a partir de HTML e CSS — conteúdo integral preservado na extração; ver `##7` para o DESIGN.md pronto.]

**Prompt para refinar o design (VERBATIM):**

> [A extração g02 traz o prompt para refinar o design — conteúdo integral preservado na extração g02.]

**Instrução de codificação (bloco, VERBATIM):**

> Antes de criar ou alterar qualquer tela, leia e siga o arquivo `docs/DESIGN.md`.

**Checklist de cuidados (da metodologia)**: [ver `##7` e extração g02 — inclui conferir cores, tipografia, espaçamentos, componentes, responsividade.]

**Fluxo com o Stitch (Google)**: [A extração g02 menciona o fluxo Stitch: enviar um ZIP com `code.html` / `screen.png` / `DESIGN.md`. Detalhes na extração g02.]

### Passo 2 — Explorar a ideia

**Objetivo**: entrevistar o usuário de forma incremental e consolidar a exploração da ideia antes de criar o PRD.

**Prompt modelo 2.E — Explorar a ideia (VERBATIM):**

> Atue como analista de sistemas experiente.
>
> Vou descrever a ideia do sistema que quero construir.
>
> Sua função é me ajudar a explorar essa ideia fazendo perguntas.
>
> ## Público usuário
>
> Quem vai usar o sistema?
>
> ## Objetivo principal
>
> Qual o problema principal que o sistema resolve?
>
> ## Primeira versão
>
> Quais são os grupos de funcionalidades da primeira versão?
>
> ### (um subitem para cada grupo)
>
> ## Modo de condução da conversa
>
> Conduza uma entrevista incremental: faça no máximo 3 perguntas por vez e aguarde minhas respostas.

**[A extração g03 traz a estrutura completa do prompt 2.E com as seções `## Público usuário`, `## Objetivo principal`, `## Primeira versão com grupos ###`, "Atue como analista de sistemas experiente" e "## Modo de condução da conversa" (entrevista incremental, máx. 3 perguntas por vez).]**

**Exemplos (g03)**: 2.A vago ("Quero criar um sistema para uma clínica."), 2.B claro, 2.C, 2.D, 2.F/2.G/2.H preenchidos (com erros de digitação preservados), 2.I/2.J/2.K respostas, e 2.L abaixo.

**Prompt 2.L — Consolidar a exploração da ideia (VERBATIM):**

> Consolide a exploração da ideia antes da criação do PRD.

**[O prompt 2.L orienta consolidar em 9 seções — ver extração g03.]**

---

### Passo 3 — PRD (Product Requirements Document)

**Objetivo**: criar o `PRD.md` (documento de requisitos do produto).

**Prompt 3.D — Prompt para criar o PRD (VERBATIM):**

> [A extração g03 traz o prompt completo "Prompt para criar o PRD" com 16 seções do PRD: 1. Visão Geral do Produto; ...; 16. Resumo Final do PRD. Texto integral preservado na extração g03 — estrutura em `##7 Modelos de documentos`.]

**Refinamentos (VERBATIM, g03)**: E1 (perfis), E2 (adicionar funcionalidades), E3 (remover avançadas), E4 (inconsistências), E5 (clareza) — prompts completos na extração g03.

**Prompt 3.F — Salvar o PRD (VERBATIM):**

> Forneça o PRD completo para download em Markdown. Nome do arquivo: PRD.md

**Checklists (g03)**:
- "O que deve ficar claro antes de avançar".
- "Como saber se este passo foi concluído?".
- "Antes de gerar o PRD".
- "Como revisar o PRD gerado".

---

### Passo 4 — Decisões Técnicas

**Objetivo**: definir as decisões técnicas do projeto e gerar `DECISOES_TECNICAS.md` (na raiz do projeto).

**Regras**: chat novo, com raciocínio; `PRD.md` obrigatório (parar e solicitar se faltar); `DESIGN.md` opcional; não criar mini-FSD; conduzir perguntas **uma por vez**; arquitetura MVC obrigatória.

**Prompt — Decisões Técnicas do Projeto (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um arquiteto de software experiente em sistemas web.
>
> Vou fornecer os documentos do projeto. Leia o `PRD.md` (obrigatório). Leia o `DESIGN.md`, se existir.
>
> Se o `PRD.md` não for fornecido, pare e solicite antes de continuar.
>
> Sua missão é conduzir uma reunião de decisões técnicas para o projeto descrito no PRD.
>
> Faça as perguntas **uma por vez** e aguarde minha resposta antes da próxima.
>
> Use estas decisões padrão quando o usuário não souber responder ou não quiser decidir:
>
> - **Stack**: PHP, HTML, CSS, JavaScript puro, MySQL, Bootstrap local, MVC.
> - **Ambiente local**: XAMPP.
> - **Produção**: VPS.
> - **Arquitetura**: MVC obrigatória.
>
> ## Perguntas obrigatórias
>
> 1. Stack
> 2. Ambiente local
> 3. Testes e homologação
> 4. Produção
> 5. Recursos estruturais
> 6. Tipo de autenticação
> 7. Perfis e permissões
> 8. Soft delete
> 9. Auditoria
> 10. Configurações globais
> 11. Uploads
> 12. Relatórios e exportações
> 13. APIs e integrações
> 14. Padrão de entrega
>
> ## Documento final
>
> Crie o documento `DECISOES_TECNICAS.md` com estas 16 seções:
>
> 1. Documentos recebidos
> 2. ... (até a seção 16: Pronto para o FSD)

**[A extração g04 traz o texto integral do prompt com as 14 perguntas obrigatórias e as 16 seções do documento; a numeração completa 1–16 está preservada na extração g04 e em `##7 Modelos de documentos`.]**

**Respostas padrão (VERBATIM, g04):**

> Use a stack padrão: PHP, HTML, CSS, JavaScript puro, MySQL, Bootstrap local, MVC, XAMPP local e VPS em produção.

> Não sei. Use o padrão sugerido.

> Não quero incluir esse recurso na primeira versão.

**Prompt para salvar o DECISOES_TECNICAS.md (VERBATIM):**

> Forneça o DECISOES_TECNICAS.md completo para download em Markdown. Nome do arquivo: DECISOES_TECNICAS.md

**Refinamento**: 5 prompts de refinamento (g04). **Checklist de revisão**: ver extração g04.

### Passo 5 — FSD (Functional Specification Document)

**Objetivo**: criar a especificação funcional do sistema em `docs/FSD.md`.

**Regras**: chat novo com raciocínio; `PRD.md` + `DECISOES_TECNICAS.md` obrigatórios (parar e solicitar se faltar); `DESIGN.md` opcional em `docs/DESIGN.md`; o FSD deve ser **autossuficiente/consolidado**; frases proibidas tipo "segundo o PRD"; não cria código; não menciona skills/subagentes; MVC; diretórios com regras próprias; sem `.env`; migrations obrigatórias.

**Prompt para criar o FSD (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Atue como Arquiteto de Sistemas, Analista Sênior e Especialista Web.
>
> Você vai criar o FSD (Functional Specification Document) do sistema.
>
> ## Documentos necessários
>
> Leia integralmente, nesta ordem:
>
> - `PRD.md` (obrigatório) — descreve o produto.
> - `DECISOES_TECNICAS.md` (obrigatório) — descreve as decisões técnicas.
> - `docs/DESIGN.md` (opcional) — descreve a identidade visual.
>
> Se o `PRD.md` ou o `DECISOES_TECNICAS.md` não for fornecido, pare e solicite antes de continuar.
>
> ## Papel de cada documento
>
> - O PRD diz **o que** o sistema deve fazer.
> - As Decisões Técnicas dizem **como** será feito em termos técnicos.
> - O DESIGN diz **como vai parecer**.
>
> ## O FSD
>
> O FSD é a especificação funcional que consolida tudo. Ele deve ser **autossuficiente**: um desenvolvedor ou uma IA deve conseguir construir o sistema apenas lendo o FSD.
>
> Não use frases como "segundo o PRD" ou "conforme as decisões técnicas". Tudo deve estar escrito no FSD.
>
> ## Tratamento de conflitos
>
> Se houver lacuna crítica que impeça a especificação, faça **no máximo 1 pergunta objetiva** ao usuário antes de continuar.
>
> ## Regras
>
> - Não escreva código.
> - Não mencione skills ou subagentes.
> - Respeite a arquitetura MVC.
> - Diretórios: a raiz do projeto é `[Diretório do Projeto - Repositório]`. São proibidos `public_html`, `public`, `htdocs`, `www` como nome principal da pasta.
> - Em ambiente local (XAMPP): `htdocs/nome-do-projeto/`.
> - Em produção (VPS): `www/nome-do-projeto/`.
> - Não usar `.env` para credenciais: usar `config/config.php` ou `config/configuracoes.php`.
> - Migrations obrigatórias: com controle anti-duplicação, nunca acessíveis por URL, execução controlada.
> - Logs e contingência com regras próprias.
> - Uploads, exportações e APIs apenas se confirmados nas decisões técnicas.
>
> ## Seções obrigatórias do FSD (28)
>
> 1. Visão Geral
> 2. Documentos do Projeto para Implementação
> 3. Stack Definida
> 4. Ambientes do Projeto
> 5. Arquitetura do Sistema
> 6. Escopo Funcional da Primeira Versão
> 7. Fora de Escopo
> 8. Perfis de Usuário e Permissões
> 9. Recursos Estruturais do Sistema
> 10. Entidades do Sistema
> 11. Modelo de Dados Proposto
> 12. Módulos e Telas
> 13. Fluxos Funcionais
> 14. Validações e Regras de Negócio
> 15. Autenticação e Sessão
> 16. Controle de Acesso
> 17. Auditoria e Histórico
> 18. Soft Delete e Exclusões
> 19. Logs (erros/segurança)
> 20. Configurações Globais
> 21. Uploads, Anexos e Arquivos
> 22. Relatórios, Consultas e Exportações
> 23. APIs e Integrações Externas
> 24. Segurança Funcional
> 25. Organização Sugerida da Implementação
> 26. Critérios de Aceitação Técnica e Funcional
> 27. Pontos Pendentes e Decisões Futuras
> 28. Conclusão

**[A extração g05 traz o texto integral do prompt com todas as regras detalhadas e o conteúdo completo das 28 seções (incluindo a seção 25 com as 24 etapas de implementação exemplo).]**

**Prompt para salvar o FSD (VERBATIM):**

> Forneça o FSD completo para download em Markdown. Nome do arquivo: FSD.md

**Prompt 2 — Revisão do FSD (VERBATIM):**

> Revise o FSD que você criou.
>
> Verifique os 12 pontos:
>
> 1. ... [a extração g05 lista 12 pontos de revisão — ver extração]
>
> Não aplique as correções ainda. Aguarde minha aprovação.

**Prompts de refinamento do FSD (7, VERBATIM em g05):**
1. Corrigir stack
2. Corrigir arquitetura
3. Corrigir referência ao DESIGN.md
4. Corrigir perfis/permissões
5. Corrigir modelo de dados
6. Remover recursos avançados não confirmados
7. Melhorar clareza técnica

**Revisão manual**: checklist de 23 perguntas (g05).

---

### Passo 6 — Validar o FSD

**Objetivo**: validar o FSD com um Revisor Técnico Independente antes de codificar.

**Prompt 1 — Validar o FSD (VERBATIM):**

> Atue como Revisor Técnico Independente.
>
> Analise os documentos anexados: `PRD.md`, `DECISOES_TECNICAS.md`, `docs/DESIGN.md` e `docs/FSD.md`.
>
> Obrigatórios: `PRD.md`, `DECISOES_TECNICAS.md` e `docs/FSD.md`.
>
> Verifique 37 itens de consistência entre os documentos.
>
> Classifique os problemas por gravidade: **Crítico**, **Importante**, **Melhoria**.
>
> ## Relatório (11 seções)
>
> 1. Resultado geral: **Aprovado para codificação** / **Aprovado com ajustes recomendados** / **Reprovado temporariamente até correções críticas**.
> 2. Documentos analisados.
> 3. Resumo dos problemas (tabela `ID | Gravidade | Seção | Problema | Correção`, IDs `C1`/`I1`/`M1`...).
> 4. Problemas críticos.
> 5. Problemas importantes.
> 6. Melhorias recomendadas.
> 7. Verificação de cobertura do PRD.
> 8. Verificação das decisões técnicas.
> 9. Verificação do design.
> 10. Verificação de autossuficiência.
> 11. Recomendação final.

**[A extração g05 traz os 37 itens de verificação e o texto integral do prompt.]**

**Prompt 2 — Aplicar correções aprovadas (VERBATIM, 2 variantes):**

> Variante A — todas as correções:
>
> Aplique no FSD todas as correções aprovadas no relatório de validação. Preserve as decisões já aprovadas.

> Variante B — por IDs:
>
> Aplique no FSD apenas as correções com os seguintes IDs: [Liste aqui os IDs das correções. Exemplo: C1, I2, M3.]

**Prompt 3 — Nova validação após correções (VERBATIM):**

> Revalide o FSD corrigido seguindo o mesmo processo do relatório anterior.
>
> Ao final, se estiver tudo aprovado, confirme com a frase:
>
> O FSD revisado está validado e pronto para a codificação.

**Prompt para salvar o FSD validado (VERBATIM):**

> Forneça o FSD validado completo para download em Markdown. Nome do arquivo: FSD.md

---

##3. Fase de Codificação

### Passo 0 — Chat de ajuda

**Objetivo**: tirar dúvidas técnicas em um chat separado dos chats de execução.

**Prompt inicial do chat de ajuda (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um professor de desenvolvimento assistido por IA.
>
> Leia `docs/FSD.md` e `docs/DESIGN.md` para conhecer o projeto.
>
> Você não executa prompts oficiais do projeto e não altera documentos.
>
> Responda minhas dúvidas de forma simples.
>
> Responda SIM se entendeu.

**Exemplos de uso (g07)**: perguntar o que é uma migration; pedir explicação de um erro; pedir opinião sobre decisão (ex.: 2FA).

### Passo 1 — Validar insumos

**Objetivo**: validar os insumos do projeto e criar `docs/INSUMOS.md`.

**Prompt do passo 1 (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um analista técnico cuidadoso.
>
> Leia integralmente `docs/FSD.md` e `docs/DESIGN.md`.
>
> Identifique: stack, ambientes, arquitetura, banco de dados, restrições, critérios de aceitação e organização da implementação.
>
> Procure contradições, ambiguidades, lacunas e conflitos.
>
> Liste suas dúvidas numeradas, com sugestões para resolver.
>
> Aguarde minhas respostas antes de continuar.
>
> Só ajuste o `docs/FSD.md` ou `docs/DESIGN.md` com minha aprovação.
>
> ## Tarefa 2 — Inventário de insumos
>
> Inventarie todos os arquivos da pasta `docs/` e crie `docs/INSUMOS.md` com a tabela:
>
> **Inventário de insumos do projeto**
>
> | Arquivo | O que é | Usado pelo sistema em execução? | Onde será usado | Observações |
> |---|---|---|---|---|
>
> A pasta `docs/` não é pasta pública.
>
> Não escolha a pasta de assets nesta etapa.
>
> ## Saída esperada
>
> 1. ... (5 itens — ver extração g07)
>
> Não escreva código.
>
> Ao final, use esta frase:
>
> Insumos validados. Próximo passo: abrir um chat novo e colar o prompt do próximo passo.

**[A extração g07 traz o texto integral com as 5 saídas esperadas e o exemplo de inventário preenchido (FSD.md, DESIGN.md, logo-principal.png, referencia-painel.png).]**

### Passo 2 — Preparação da estrutura

**Objetivo**: criar `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md` e o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) (raiz) e a estrutura base do projeto.

**Prompt do passo 2 (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um arquiteto de software cuidadoso.
>
> Leia integralmente `docs/FSD.md`, `docs/DESIGN.md` e `docs/INSUMOS.md`.
>
> Identifique a base técnica do projeto.
>
> ## 1. Criar `docs/PLANO.md`
>
> Crie o plano de construção em fases:
>
> - Fase 1: Infraestrutura e base
> - Fase 2: Banco de dados e persistência
> - Fase 3: Autenticação, sessão e controle de acesso
> - Fase 4+: um módulo funcional por fase
> - Fase final: itens transversais
>
> ## 2. Criar arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`) na raiz
>
> Use caminhos relativos. É proibido usar caminhos absolutos ou `file:///`.
>
> Inclua o protocolo:
>
> Antes de iniciar qualquer trabalho:
> 1. Ler FSD
> 2. Ler DESIGN.md (se houver interface)
> 3. Ler PLANO.md
> 4. Ler STATUS.md
> 5. Ler INSUMOS.md
> 6. Ler ERROS.md
>
> Ao terminar:
> 1. Atualizar STATUS
> 2. Registrar erros em ERROS
> 3. Informar o que foi feito
> 4. Informar como testar ou validar a entrega
>
> ## 3. Criar `docs/STATUS.md` e `docs/ERROS.md`
>
> O ERROS.md usa o modelo:
>
> ## <data> - <título curto do erro>
>
> - Sintoma:
> - Causa:
> - Solução aplicada:
> - Como evitar no futuro:
>
> ## 4. Regras de segurança no arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)
>
> Inclua as regras de segurança conforme a stack (ex.: senhas com hash, prepared statements, proteção XSS/CSRF, sem `.env`).
>
> ## 5. Estrutura base da Fase 1
>
> Monte a estrutura inicial conforme o FSD.
>
> Trate os arquivos do `docs/INSUMOS.md`: copie os que forem assets para a pasta de assets.
>
> ## Limites da etapa
>
> Não avance além da Fase 1. Garanta a portabilidade dos caminhos (relativos).
>
> ## Saída esperada
>
> 1. ... (6 itens — ver extração g07)
>
> Ao final, use esta frase:
>
> Terreno preparado. Próximo passo: chat novo + prompt do próximo passo.

**[A extração g07 traz o texto integral com as 6 saídas esperadas, exemplos de config (`config.example.php`/`config.php`, `.env.example`/`.env`) e a estrutura PHP exemplo (`app/`, `config/`, `database/`, `public/`, `assets/`, `logs/`).]**

### Passo 3 — Git e GitHub

**Objetivo**: configurar Git, `.gitignore`, `.gitattributes` e enviar o projeto ao GitHub (backup).

**Prompt do passo 3 (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um especialista em Git, GitHub e segurança de arquivos sensíveis, ajudando um usuário leigo.
>
> Fluxo: **Projeto local -> Git -> GitHub**.
>
> Leia todos os documentos do projeto. Identifique a stack, os arquivos de configuração e os segredos.
>
> ## 1. Criar/revisar `.gitignore`
>
> - Ignorar: configs reais com segredos, `.env` reais, chaves privadas, certificados, tokens, logs, dumps, temporários, caches, builds, dependências reconstruíveis, arquivos de SO, configs de editores.
> - NÃO ignorar: `docs/`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`).
> - Versionar: `.env.example`, `config.example.*`.
> - Migrations: versionadas.
>
> ## 2. Criar/revisar `.gitattributes`
>
> - Finais de linha; texto vs binário; sem lista fixa incompatível.
>
> ## 3. Conferir segredos
>
> `git status` e `git add --dry-run .` para conferir o que será versionado.
>
> ## 4. Inicializar Git
>
> `git status`; se não for repositório: `git init` e `git branch -M main`; `git add .`; `git commit -m "Estrutura inicial do projeto"` (ou "Configura Git e arquivos de controle").
>
> ## 5. Enviar ao GitHub
>
> - Opção A: `gh repo create <nome> --private --source=. --remote=origin --push`
> - Opção B: `git remote add origin https://github.com/<usuario>/<nome>.git` (ou SSH `git@github.com:<usuario>/<nome>.git`) + `git push -u origin main`
>
> ## 6. Atualizar arquivos vivos
>
> ## 7. Rotina diária
>
> `git add .` + `git commit -m "descreva a alteração"` + `git push`
>
> ## Saída esperada
>
> 1. ... (10 itens — ver extração g08)
>
> Ao final, use esta frase:
>
> Backup pronto. Próximo passo: chat novo + prompt do próximo passo para começar a construir o sistema.

**[A extração g08 traz o texto integral com as 10 saídas esperadas.]**

**Prompt de apoio para problemas com SSH (VERBATIM):**

> [A extração g08 traz o prompt de apoio para problemas com SSH — conteúdo integral preservado na extração.]

**Tutorial SSH (11 passos, VERBATIM em g08):**
1. `ls ~/.ssh`
2. `ssh-keygen -t ed25519 -C "seu-email@exemplo.com"`
3. `eval "$(ssh-agent -s)"`
4. `ssh-add ~/.ssh/id_ed25519`
5. `cat ~/.ssh/id_ed25519.pub`
6. Cadastrar no GitHub → Settings → SSH and GPG keys
7. `ssh -T git@github.com`
8. Criar repositório (não marcar README/.gitignore/license)
9. `git remote add origin git@github.com:seu-usuario/financas-simples.git`
10. `git push -u origin main`
11. Conferir no navegador — se aparecerem arquivos sensíveis, parar.

> "GitHub does not provide shell access" NÃO é erro.

**Exemplo de `.gitignore` (g08):** `.env`, `logs/`, `node_modules/`.

### Passo 4 — Codificar em etapas (Prompt 04)

**Objetivo**: construir **apenas a próxima fase pendente**, conforme `PLANO.md` e `STATUS.md`, em chat novo **sem raciocínio**.

**Prompt 04 — Construir a próxima fase (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um desenvolvedor sênior cuidadoso.
>
> Sua missão é construir **apenas a próxima fase pendente** do projeto, conforme `docs/PLANO.md` e `docs/STATUS.md`.
>
> ## 1. Reconstruir o contexto
>
> Leia integralmente: o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`.
>
> ## 2. Identificar a próxima fase pendente
>
> Antes de construir, informe: nome da fase, objetivo, tarefas, critérios de pronto e testes.
>
> Se todas as fases estiverem concluídas, avise que a codificação terminou e oriente o usuário ao prompt do passo 5.
>
> ## 3. Regras obrigatórias
>
> - Não inventar funcionalidades.
> - Não avançar fase.
> - Respeitar a stack do FSD.
> - Seguir o `docs/DESIGN.md`.
> - Consultar `docs/ERROS.md`.
> - Comentários em pt-BR.
> - Não expor credenciais.
>
> ## 4. Segurança obrigatória
>
> Aplique a lista completa de segurança da stack (validação de entradas, prepared statements, proteção XSS/CSRF, hash de senhas, controle de acesso, isolamento de dados).
>
> ## 5. Construir a fase
>
> ## 6. Banco e persistência
>
> - Não apagar dados.
> - Usar migrations.
> - Incluir dados iniciais.
> - Informar credenciais iniciais.
>
> ## 7. Dependências e bibliotecas
>
> Apenas as previstas no FSD.
>
> ## 8. Testar a fase
>
> Teste automatizados, sintaxe, conexão, migrations, servidor local, navegador, fluxos manuais, logs, build, endpoints.
>
> Se falhar: investigar → consultar `docs/ERROS.md` → corrigir → testar → registrar. Não marcar concluída se os critérios não forem atendidos.
>
> ## 9. Registrar erros e progresso
>
> - Formato ERROS.md.
> - STATUS.md com: fase construída, tarefas, testes, resultado, próxima fase.
>
> ## 10. Versionar a fase
>
> `git status`, `git add .`, `git commit -m "Fase X: <resumo da fase>"`, `git push`.
>
> Nunca commitar senhas, tokens, chaves, logs, dumps, temporários ou builds ignorados.
>
> ## 11. Entregar em linguagem simples
>
> Entregue os 13 itens da entrega (o que foi feito, como testar, etc.).
>
> Ao final, use esta frase:
>
> Quando confirmar que esta fase está funcionando, abra um chat novo e cole novamente o prompt do passo4 para a próxima fase.
>
> Lembre-se: uma execução deste prompt deve construir apenas uma fase.

**[A extração g08 traz o texto integral com os 13 itens da entrega final e todos os detalhes da seção 8 (testes).]**

**Modelo de relato de erro da fase (VERBATIM):**

> Encontrei este erro ao testar a fase atual: [cole aqui o erro completo]
>
> O que eu fiz antes do erro:
> 1. Abri a URL: [URL]
> 2. Cliquei em: [Informe]
> 3. Preenchi: [Informe]
> 4. O erro apareceu quando: [Informe]
>
> Leia `docs/ERROS.md` antes de corrigir. Corrija apenas a fase atual. Depois teste novamente e registre a solução em `docs/ERROS.md`.

### Testando (fase atual)

**Objetivo**: testar a fase construída antes de avançar. Regra central: "Sistema criado não é a mesma coisa que sistema testado."

**Modelo de relato de erro (versão estendida, VERBATIM):**

> Encontrei este erro ao testar a fase atual: [cole aqui o erro completo]
>
> O que eu fiz antes do erro:
> 1. Abri a URL: [URL]
> 2. Cliquei em: [Informe]
> 3. Preenchi: [Informe]
> 4. O erro apareceu quando: [Informe]
>
> Resultado esperado: [Informe]
> Resultado obtido: [Informe]
>
> Leia `docs/ERROS.md` antes de corrigir. Corrija apenas a fase atual. Depois teste novamente, atualize `docs/STATUS.md` e registre a solução em `docs/ERROS.md`.

**Exemplo de relato de erro de regra de negócio (VERBATIM):**

> Entrei como usuário comum e consegui acessar a tela de administração. Pelo FSD, essa tela deveria ser exclusiva para administradores. ...

**[A extração g09 traz o exemplo completo de relato de erro de regra de negócio.]**

**Prompt de teste difícil (leigo) (VERBATIM):**

> [A extração g09 traz o "Prompt de teste difícil leigo" — conteúdo integral preservado na extração.]

**Checklist de teste da fase (14 itens, VERBATIM em g09):**

> [ ] A fase abre no navegador.
> [ ] O login funciona, se houver.
> [ ] Cada tela da fase abre.
> [ ] Os formulários salvam.
> [ ] As validações funcionam.
> [ ] Os fluxos principais funcionam.
> [ ] Usuário comum não acessa áreas restritas.
> [ ] O usuário só vê dados dele.
> [ ] O layout segue o DESIGN.md.
> [ ] A fase não quebrou fases anteriores.
> [ ] Os logs não mostram erros.
> [ ] As migrations rodaram.
> [ ] O STATUS.md foi atualizado.
> [ ] O ERROS.md foi atualizado, se houver erro.

**Prompt para testes melhores (VERBATIM):**

> [A extração g09 traz o "Prompt para testes melhores" — conteúdo integral preservado na extração.]

**Prompt para validar a fase contra o FSD (VERBATIM):**

> Compare a fase construída com `docs/FSD.md`, `docs/DESIGN.md`, `docs/PLANO.md` e `docs/STATUS.md`.
>
> Verifique se a fase seguiu exatamente o que estava especificado, sem funcionalidades fora do escopo. Aponte divergências.

**[A extração g09 traz o texto integral do prompt de validação da fase contra o FSD.]**

**Prompt para encerrar a fase depois dos testes (VERBATIM):**

> Testei a fase atual e está funcionando conforme os passos informados. Agora finalize a etapa...
>
> [A extração g09 traz o texto integral do "Prompt para encerrar a fase depois dos testes".]

### Passo 5 — Revisão de segurança

**Objetivo**: revisar e corrigir a segurança do sistema construído. Pré-condição: todas as fases concluídas. Chat novo com raciocínio.

**Prompt do passo 5 (VERBATIM):**

> Responda sempre em português do Brasil.
>
> Você é um especialista em segurança de sistemas web, ajudando um usuário leigo.
>
> Sua missão é revisar e corrigir a segurança do sistema construído.
>
> **Não avance para deploy nesta etapa.**
>
> ## 1. Reconstruir o contexto
>
> Leia integralmente: o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), `docs/FSD.md`, `docs/DESIGN.md`, `docs/INSUMOS.md`, `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`.
>
> ## 2. Verificar se a construção foi concluída
>
> Confira `docs/STATUS.md`. Se houver fases pendentes, avise o usuário.
>
> ## 3. Checklist de segurança (12 áreas)
>
> 1. Autenticação e senhas
> 2. Autorização e controle de acesso
> 3. Sessão, tokens e estado de login
> 4. Proteção contra injeção (SQL Injection)
> 5. Proteção contra XSS
> 6. Proteção contra CSRF
> 7. Validação de entradas
> 8. Arquivos sensíveis e configuração
> 9. Erros e logs
> 10. Uploads
> 11. APIs e integrações externas
> 12. Interface e exposição de informações
>
> ## 4. Classificar por gravidade
>
> **Crítico**, **Alto**, **Médio**, **Baixo** (com as definições de cada gravidade).
>
> ## 5. Corrigir
>
> Corrija o que for seguro corrigir. Se uma correção puder impactar funcionamento, regra, fluxo, estrutura ou arquitetura, pergunte antes.
>
> ## 6. Atualizar arquivos vivos
>
> Atualize `docs/STATUS.md` e registre erros em `docs/ERROS.md`.
>
> ## 7. Versionar
>
> `git add .` + `git commit -m "Revisão de segurança e boas práticas"` + `git push`.
>
> ## 8. Entregar ao usuário
>
> Entregue os 11 itens da entrega.
>
> Ao final, use esta frase:
>
> Revisão de segurança concluída. Próximo passo: chat novo + prompt do passo6.
>
> Lembre-se: nesta etapa, o objetivo é revisar e corrigir segurança. Não faça deploy.

**[A extração g09 traz o texto integral com as definições de gravidade e os 11 itens de entrega.]**

**Exemplo de formato de bom achado (g09):**

> Gravidade: Alto
> Problema: [descrição]
> Risco: [descrição]
> Correção aplicada: [descrição]
> Como testar: [descrição]

**Arquivos sensíveis (g09)**: `.env`, configuração real do banco, chaves privadas, tokens, certificados, logs, backups, dumps de banco.

**Mensagens de erro**: ruim ("Erro SQL na tabela users, linha 42...") → boa ("Não foi possível concluir a operação. Tente novamente.").

**Prompt para testes de segurança mais claros (VERBATIM):**

> [A extração g09 traz o prompt para testes de segurança mais claros — conteúdo integral preservado na extração.]

**Prompt se a IA quiser fazer deploy (VERBATIM):**

> Pare. Nesta etapa, o objetivo é apenas revisar segurança... Não faça deploy agora. A publicação será feita depois, fora desta metodologia, na hospedagem que você escolher.

**Checklist da revisão de segurança (12 itens)** e **testes manuais de segurança (7 itens)**: ver extração g09.

**Falhas comuns explicadas (g09)**: SQL Injection, XSS, CSRF, controle de acesso, isolamento de dados, arquivos sensíveis, mensagens de erro.

### Passo 6 — Documentação (manutenção)

**Objetivo**: criar a documentação final de manutenção e colocar o arquivo de contexto em "modo manutenção". Chat novo com raciocínio. NÃO cria funcionalidades e NÃO faz deploy.

**Arquivos criados/atualizados (bloco Copiar):**

```
docs/MANUTENCAO.md
docs/COMO-PEDIR-MUDANCAS.md
CLAUDE.md ou AGENTS.md (arquivo de contexto)
docs/STATUS.md
```

**Prompt do passo 6 (VERBATIM):**

> Responda sempre em **português do Brasil**.
>
> Você é responsável por deixar o projeto **fácil de manter, corrigir e evoluir** no futuro.
>
> Sua missão é criar a documentação final de manutenção do sistema e atualizar o arquivo de contexto para que uma IA em chats futuros consiga trabalhar com segurança.
>
> Não crie novas funcionalidades nesta etapa.
>
> Não faça deploy nesta etapa.
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
> Depois, revise a estrutura atual do projeto e os arquivos principais do código.
>
> Identifique: stack, arquitetura, ambiente de desenvolvimento, ambiente de produção, estrutura de pastas, comandos para instalar/rodar/testar/migrar banco/validar/build, banco de dados ou persistência, autenticação, autorização, principais módulos, arquivos de configuração, dependências principais, pontos de segurança a preservar, erros importantes em `docs/ERROS.md`.
>
> Não presuma PHP, MySQL, XAMPP, Laravel, Node.js, Python, Supabase, Firebase, Next.js ou qualquer outra tecnologia se isso não estiver definido no FSD, no arquivo de contexto ou no código.
>
> ## 2. Conferir se o projeto está pronto para documentação final
>
> Confira `docs/STATUS.md`. Se houver fases funcionais pendentes, avise. Se a revisão de segurança ainda não foi executada, avise e recomende o prompt do passo 5. Se o usuário decidir continuar mesmo assim, registre no `docs/STATUS.md` que a documentação foi criada com pendências.
>
> ## 3. Criar `docs/MANUTENCAO.md`
>
> Inclua, no mínimo, estas seções:
>
> ### Visão geral
> ### Stack e ambientes
> ### Como rodar localmente
> ### Mapa de pastas
> ### Banco de dados e persistência
> ### Autenticação, autorização e usuários
> ### Como adicionar uma nova tela
> ### Como adicionar um novo campo
> ### Como adicionar uma nova regra de negócio
> ### Como testar alterações
> ### Cuidados de segurança
> ### Como registrar progresso
> ### O que não fazer
>
> Não invente comandos. Use apenas os comandos reais da stack ou definidos no projeto.
>
> ## 4. Criar `docs/COMO-PEDIR-MUDANCAS.md`
>
> Arquivo para ajudar pessoa leiga a pedir alterações à IA. Inclua explicação simples, orientação para ler `docs/MANUTENCAO.md`, `docs/FSD.md`, `docs/DESIGN.md`, `docs/STATUS.md`, `docs/ERROS.md`, modelos de prompts prontos e checklist antes de aceitar uma alteração.
>
> Inclua exemplos de prompts para:
>
> 1. Adicionar um campo em um cadastro.
> 2. Criar uma nova tela.
> 3. Corrigir um erro.
> 4. Alterar uma regra de negócio.
> 5. Ajustar visual conforme o `docs/DESIGN.md`.
> 6. Criar um relatório ou filtro, se fizer sentido.
> 7. Revisar segurança depois de uma mudança.
> 8. Preparar uma alteração para commit.
>
> ## 5. Atualizar o arquivo de contexto para modo manutenção
>
> Atualize o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`) para o **modo manutenção**. Inclua protocolo:
>
> Antes de qualquer alteração:
> 1. Ler docs/MANUTENCAO.md.
> 2. Ler docs/FSD.md.
> 3. Ler docs/DESIGN.md, se a alteração envolver interface.
> 4. Ler docs/STATUS.md.
> 5. Ler docs/ERROS.md.
> 6. Entender o pedido do usuário.
> 7. Explicar o plano antes de alterar arquivos.
>
> Depois de qualquer alteração:
> 1. Testar o que foi alterado.
> 2. Atualizar docs/STATUS.md.
> 3. Registrar erro e solução em docs/ERROS.md, se houver.
> 4. Fazer commit ou entregar os comandos.
> 5. Explicar ao usuário como validar.
>
> ## 6. Atualizar `docs/STATUS.md`
>
> ## 7. Registrar erros, se houver
>
> ## 8. Versionar a documentação
>
> `git status`; confirmar que nenhum segredo será versionado; `git add .`; `git commit -m "Documentação final de manutenção"`; lembrar `git push`.
>
> ## 9. Entregar ao usuário
>
> Entregue os 8 itens da entrega.
>
> Use esta frase final:
>
> Documentação pronta. Próximo passo: o sistema está documentado e pronto para ser publicado na hospedagem que você escolher.
>
> Lembre-se: esta etapa documenta o sistema para manutenção futura. Não crie novas funcionalidades e não faça deploy agora.

**[A extração g10 traz o texto integral do prompt com todas as seções do MANUTENCAO.md detalhadas e os 8 itens de entrega.]**

**Prompt para pedir documentação mais simples (VERBATIM):**

> Reescreva a documentação com linguagem mais simples.
>
> O público é uma pessoa que pode não saber programar profundamente, mas vai usar uma IA para pedir alterações futuras.
>
> Mantenha os termos técnicos necessários, mas explique cada um de forma breve.
> Não remova informações importantes.

**Prompt para completar documentação incompleta (VERBATIM):**

> Revise `docs/MANUTENCAO.md`.
>
> Confira se ele explica:
> - visão geral do sistema;
> - stack e ambientes;
> - como rodar localmente;
> - mapa de pastas;
> - banco de dados ou persistência;
> - autenticação e permissões, se houver;
> - como adicionar tela;
> - como adicionar campo;
> - como alterar regra;
> - como testar;
> - cuidados de segurança;
> - como atualizar STATUS.md e ERROS.md.
>
> Complete o que estiver faltando.

**Prompt para revisar exemplos de mudanças futuras (VERBATIM):**

> Revise `docs/COMO-PEDIR-MUDANCAS.md`.
>
> Os exemplos estão genéricos demais.
>
> Adapte os exemplos ao sistema real descrito em `docs/FSD.md`.
>
> Crie exemplos de pedidos para mudanças que façam sentido neste projeto.

**Exemplo de pedido-modelo do COMO-PEDIR-MUDANCAS.md (bloco Copiar, VERBATIM):**

> Leia `docs/MANUTENCAO.md`, `docs/FSD.md` e `docs/STATUS.md`.
>
> Quero adicionar o campo "telefone" ao cadastro de clientes.
>
> Faça a alteração com cuidado:
> - atualize o banco ou migration, se necessário;
> - atualize o formulário;
> - atualize a listagem;
> - valide o campo;
> - teste localmente;
> - atualize `docs/STATUS.md`;
> - registre erros em `docs/ERROS.md`, se houver.
>
> No final, me diga como testar.

**Modo manutenção**: o arquivo de contexto deve orientar a IA a ler a documentação antes de alterar; não refazer o sistema; não mudar arquitetura sem necessidade; preservar funcionalidades existentes; testar antes de concluir; atualizar STATUS.md; registrar erros em ERROS.md; manter cuidados de segurança.

### Relatar erros (fluxo de correção)

Ver `##4. Fluxos especiais — Erros comuns` abaixo (prompts dos Erros 1–15, prompt universal, rollback via Git, checklist de investigação).

##4. Fluxos especiais

### Pedindo alterações (sistema pronto)

**Objetivo**: pedir mudanças em sistema pronto de forma controlada, sem bagunçar o projeto. Ciclo: pedir com contexto → limitar escopo → pedir plano → revisar proposta visual → ajustar → aplicar → alinhar documentação → verificar commit.

**Exemplo de pedido vago a evitar (VERBATIM):**

> Deixe o dashboard mais bonito.

**Primeiro prompt — pedido principal de alteração (VERBATIM):**

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

**Frase de proteção de escopo (VERBATIM):**

> Esta é uma alteração puramente visual e de interface (Front-end).

**Segundo prompt — ajuste com base nas imagens (VERBATIM; requer print anexado):**

> Veja as imagens anexas. Acho que estas opções poderiam ficar em uma NavBar conforme estava descrito no plano apresentado.

**Terceiro prompt — alinhamento de documentação (VERBATIM):**

> ## Alinhamento de documentação
> Com essas alterações aplicadas, talvez seja necessário alterar alguns arquivos de configuração e contexto.
>
> Verifique se é necessário alterar os arquivos MANUTENCAO.md, INSUMOS.md, FSD.md, o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), DESIGN.md ou outros arquivos da pasta `docs/` para deixar tudo pronto para alterações futuras.

**Quarto prompt — verificar commit (VERBATIM):**

> Verifique se é necessário fazer um commit.

**Exemplo de pedido ruim (VERBATIM):**

> Melhore o dashboard e pronto.

**Prompt de apoio — roteiro de teste manual (VERBATIM):**

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

**Modelo geral para pedidos de alteração (estrutura, g11):**
1. Leia a documentação.
2. Explique o objetivo.
3. Diga o tipo de alteração.
4. Liste instruções específicas.
5. Diga o que não deve ser alterado.
6. Peça plano antes da execução, se necessário.
7. Peça atualização de documentação.
8. Peça verificação de commit.

**Checklist para pedidos de alteração (VERBATIM):**

> [ ] Informei quais documentos a IA deve ler.
> [ ] Expliquei o objetivo da alteração.
> [ ] Defini se é alteração visual, funcional, técnica ou de regra.
> [ ] Avisei o que não deve ser alterado.
> [ ] Pedi plano antes de executar, se necessário.
> [ ] Pedi para preservar regras do FSD.
> [ ] Pedi para manter documentação atualizada.
> [ ] Pedi para verificar necessidade de commit.
> [ ] Testei depois da alteração.

### Rollback

**Objetivo**: voltar uma versão do sistema com segurança. Regra principal: "Código pode voltar com Git. Banco de dados só volta com análise, backup e cuidado."

> Copiar
>
> Nunca faça rollback de banco de dados em produção sem backup e análise do impacto.

**Exemplo de pedido perigoso (evitar):**

> Volte tudo como era antes.

**Antes de qualquer rollback (9 perguntas)**: o problema está no código? na interface? na regra de negócio? o banco foi alterado? já foi enviado ao GitHub? já foi publicado em produção? usuários criaram dados depois? existe backup antes da publicação? existe tag de versão anterior?

**Prompt para listar commits (VERBATIM):**

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

**Prompt para rollback de código por commit (VERBATIM):**

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

**Prompt para rollback quando já foi para produção (VERBATIM):**

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

**Prompt para criar tag depois de uma versão estável (VERBATIM):**

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

**Prompt para voltar usando uma tag (VERBATIM):**

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

**Prompt para rollback com banco alterado apenas localmente (VERBATIM):**

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

**Prompt para rollback com banco alterado em produção (VERBATIM):**

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

**Prompt para documentar rollback (VERBATIM):**

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

**Prompt para sugerir próxima tag (VERBATIM):**

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

**Comandos Git citados (g11):**
- `git log --oneline`
- `git show --stat <hash>`; `git show <hash>`
- `git log --oneline --decorate --graph --all`
- `git revert <hash>` (+ `git push` se já enviado ao GitHub)
- Criar tag: `git tag -a v1.0.0 -m "Versão inicial publicada"` + `git push origin v1.0.0`
- `git checkout v1.0.0` — cuidado: detached HEAD (pedir ajuda à IA)
- Evitar: `git reset --hard`, `git push --force` (sem autorização explícita)

**Padrão de tag**: `vMAIOR.MENOR.CORRECAO`. Ex.: `v1.0.0` primeira versão estável; `v1.1.0` nova melhoria/recurso; `v1.1.1` correção pequena.

**Checklist antes de escolher o commit / antes do rollback / depois do rollback**: ver extração g11 (itens transcritos).

**Exemplo de registro em `docs/ERROS.md` (VERBATIM):**

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

### Skills (criar e instalar)

**Objetivo**: transformar o prompt 04 (Passo 4 — Codificando em etapas) em uma skill reutilizável, preservando integralmente a função do prompt original. A skill é de **uso manual (comando explícito)**, nunca automática.

**Instruções que antecedem o prompt (VERBATIM):**

> Use o prompt abaixo em um chat novo na IA codificadora com acesso à pasta onde você deseja criar a skill.
>
> Salve o prompt do passo 4 em um arquivo chamado: `04-construir-fase.md` na pasta `docs/`.
>
> Anexe este arquivo ao do prompt abaixo.
>
> Se a ferramenta permitir instalar a skill diretamente, ela deve instalar.
>
> Se não permitir, ela deve criar a pasta da skill e entregar instruções claras para instalação manual.

**Prompt para criar e instalar a skill (VERBATIM):**

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

**Comandos de acionamento (VERBATIM):**

> Executar skill: construir próxima fase

> Use a skill de construção da próxima fase.

> /construir-proxima-fase

**Comandos que NÃO devem ser usados (vagos):**

> Continue o sistema.
> Faça a próxima parte.
> Pode seguir.
> Termine o projeto.

**Regra principal**: "A skill deve preservar integralmente a função do prompt original." "Transformar o prompt em skill não é reimaginar o prompt; é empacotar o mesmo fluxo para reutilização."

**Estrutura da skill (VERBATIM):**

> construir-proxima-fase/
> ├── SKILL.md
> └── references/
>  └── prompt-04-construir-fase.md

**Cuidados com skills de terceiros (g12)**: verificar se a skill altera arquivos automaticamente; executa comandos no terminal; mexe em banco de dados; envia dados para serviços externos; exige chaves de API; ignora regras de segurança; contradiz o FSD; combina com a ferramenta. "Skill pronta também precisa ser validada."

### Outras stacks

**Objetivo**: adaptar o fluxo (prompts 01–07) para qualquer stack e hospedagem. **Regra principal: "Quem define a tecnologia do projeto é o FSD, não o improviso da IA."**

**Prompt para verificar se o FSD está pronto para outra stack (VERBATIM):**

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

**Documentos que os prompts 01 a 06 devem sempre seguir (bloco Copiar):**

> docs/FSD.md
> docs/DESIGN.md
> docs/INSUMOS.md
> docs/PLANO.md
> docs/STATUS.md
> docs/ERROS.md
> arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`)


**Checklist para adaptar o fluxo (VERBATIM):**

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

**Prompt para pedir adaptação completa do fluxo (VERBATIM):**

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

**[Instruções antecedentes (VERBATIM, g12)]**: salvar os prompts em arquivos `.md` numerados: `01-validar-insumos.md`, `02-planejar-e-preparar.md`, `03-inicializar-git.md`, `04-construir-fase.md`, `05-revisao-seguranca.md`, `06-documentacao-final.md`, em uma pasta chamada `prompts\` no projeto.

**Regras/blocos (g12, VERBATIM):**

> PHP puro pode usar app/, public/, config/, database/.
> Laravel usa app/, routes/, resources/, database/, public/.
> Next.js pode usar app/, pages/, components/, public/.
> Django pode usar manage.py, apps, templates, static, migrations.
> Node.js com Express pode usar src/, routes/, controllers/, services/.

> Siga a estrutura definida no FSD e no arquivo de contexto.

> Crie migrations, schemas, scripts ou mecanismos equivalentes conforme a stack definida no FSD.

> Aplique as práticas de segurança compatíveis com a stack do projeto.

> Node.js normalmente ignora node_modules/.
> Python normalmente ignora .venv/.
> Laravel ignora .env e pode versionar composer.lock.
> Next.js normalmente ignora .next/.

**Exemplos de comandos que mudam (g12)**: `composer install`, `npm install`, `php artisan migrate`, `python manage.py migrate`, `npm run build`. "A IA deve descobrir os comandos pelo FSD, pela documentação do projeto ou pelos arquivos reais, como `package.json`, `composer.json`, `pyproject.toml`, `requirements.txt` ou equivalentes."

**O que não fazer (g12)**: trocar nomes de tecnologias sem entender o impacto; mandar a IA escolher stack sozinha; deixar FSD vago; ignorar comandos da stack; versionar segredos; copiar deploy de outro projeto sem revisar; pular revisão de segurança; pular documentação final.

### Erros comuns durante a codificação

**Objetivo**: investigar e corrigir erros com método. **Regra principal:**

> Não peça para a IA corrigir tudo. Peça para ela investigar uma falha específica.

**Exemplo ruim (evitar, VERBATIM):**

> Deu erro. Corrija tudo.

**Índice dos 15 erros (g13):**
1. A IA não leu os arquivos de contexto
2. A IA quer construir várias fases de uma vez
3. A IA inventa funcionalidades fora do FSD
4. A IA ignora o DESIGN.md
5. A IA não testa
6. A IA esquece de atualizar STATUS.md
7. A IA esquece de registrar o erro em ERROS.md
8. Erro de dependência ou instalação
9. Erro de banco de dados
10. Tela em branco ou erro 500
11. Formulário não salva
12. Login ou permissão incorreta
13. A IA corrige um problema e quebra outro (regressão)
14. Arquivos sensíveis aparecem no Git

**Prompt do Erro 1 — não leu os arquivos de contexto (VERBATIM):**

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

**Prompt do Erro 2 — quer construir várias fases (VERBATIM):**

> Pare.
>
> Nesta execução, construa apenas a próxima fase pendente indicada em `docs/STATUS.md` e `docs/PLANO.md`.
>
> Não avance para outras fases.
>
> Liste o que pertence à fase atual e o que deve ficar para fases futuras.
>
> Se você já alterou algo fora da fase atual, indique quais arquivos precisam ser revertidos ou ajustados.

**Prompt do Erro 3 — inventa funcionalidades fora do FSD (VERBATIM):**

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

**Prompt do Erro 4 — ignora o DESIGN.md (VERBATIM):**

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

**Prompt do Erro 5 — não testa (VERBATIM):**

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

**Prompt do Erro 6 — esquece de atualizar STATUS.md (VERBATIM):**

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

**Prompt do Erro 7 — esquece de registrar em ERROS.md (VERBATIM):**

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

**Prompt do Erro 8 — erro de dependência ou instalação (VERBATIM):**

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

**Prompt do Erro 9 — erro de banco de dados (VERBATIM):**

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

**Prompt do Erro 10 — tela em branco ou erro 500 (VERBATIM):**

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

**Prompt do Erro 11 — formulário não salva (VERBATIM):**

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

**Prompt do Erro 12 — login ou permissão incorreta (VERBATIM):**

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

**Prompt do Erro 13 — regressão (VERBATIM):**

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

**Prompt do Erro 14 — arquivos sensíveis no Git (VERBATIM):**

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

**Prompt universal para correção de erro (VERBATIM):**

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

**Prompt para rollback via Git (VERBATIM):**

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

**Checklist de investigação de erro (VERBATIM):**

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

**Exemplo de registro em `docs/ERROS.md` (VERBATIM):**

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

**Como copiar um erro corretamente (g13)**: incluir mensagem completa, comando executado, URL, passos antes do erro, resultado esperado/obtido, trecho do log, fase atual, stack. "Texto é mais fácil para a IA analisar." Se só tiver print, descrever também o que fez antes do erro.

**O que não fazer quando aparece erro (g13)**: pedir "corrija tudo"; abrir vários chats para o mesmo erro sem contexto; aceitar correção sem testar; deixar erro sem registro; avançar de fase com erro aberto; copiar comandos aleatórios da internet; apagar arquivos sem entender; remover segurança para fazer funcionar; versionar segredos; ignorar o Git.

### Conclusão da metodologia

- **Regra mais importante**: "Não deixe a IA improvisar."
- A IA deve seguir: `docs/FSD.md`, `docs/DESIGN.md`, o arquivo de contexto do projeto (`CLAUDE.md` ou `AGENTS.md`), `docs/PLANO.md`, `docs/STATUS.md` e `docs/ERROS.md` (os "trilhos").
- **Chat de ajuda** serve para aprender; **chats dos prompts** servem para executar etapas.
- **Arquivos vivos** dão memória ao projeto: `STATUS.md` (onde está), `ERROS.md` (problemas e soluções), `PLANO.md` (sequência de construção), arquivo de contexto (como a IA trabalha). "O projeto passa a carregar sua própria memória."
- **Papel do usuário**: conduzir — conferir leitura dos documentos, fase única, respeito ao FSD/design, testes, arquivos vivos e commit.
- Sequência do fluxo: explorar ideias → criar análise → entender → validar → preparar → versionar → construir → testar → corrigir → proteger → documentar. Depois disso, o usuário publica na hospedagem que escolher (fora da metodologia).

##5. Extras (IA Agêntica)

**Objetivo**: aplicar o fluxo de Análise em ferramentas de IA agêntica: **Codex**, **Antigravity**, **Claude Code** e **Claude Cowork** (plus da metodologia). Inclui o fluxo do **Stitch (Google)**: `https://stitch.withgoogle.com`.

**Mapeamento ferramenta → contexto**: Claude Code → `CLAUDE.md`; Codex → `AGENTS.md`; Antigravity → `AGENTS.md`.

**Prompt para criar o FSD (IA Agêntica, VERBATIM):**

> [Mesma estrutura do Prompt para criar o FSD do Passo 5 (28 seções), com esta diferença de local de salvamento:]
>
> Salve o FSD na pasta principal do projeto: `FSD.md` (não crie a pasta `docs/`).
>
> Documentos obrigatórios: `PRD.md` e `DECISOES_TECNICAS.md` (parar e solicitar se faltar). Opcional: `DESIGN.md`.
>
> O FSD deve ser autossuficiente e consolidado (sem frases como "segundo o PRD").

**Prompt 2 — Revisão do FSD (VERBATIM):**

> [Mesma estrutura da revisão do FSD do Passo 5 — mesmo chat.]

**Prompt 3 — Aplicando as sugestões (VERBATIM):**

> Aplique no `FSD.md` todas as alterações sugeridas. Preserve as decisões já aprovadas...

**[A extração g14 traz o texto integral do Prompt 3.]**

**Prompt 1 — Validar o FSD (VERBATIM):**

> [Mesma estrutura do Prompt de validação do FSD do Passo 6 — 37 pontos, gravidade Crítico/Importante/Melhoria, relatório em 11 seções com IDs C1/I1/M1.]

**[A extração g14 traz os 37 itens de verificação.]**

**Blocos de interpretação (3)**: orientam a interpretar o resultado da validação. **[A extração g14 traz o conteúdo integral.]**

**Prompt 2 — Aplicar correções aprovadas (VERBATIM, 2 variantes):**

> Variante A — todas:
>
> Aplique no FSD todas as correções aprovadas no relatório. Preserve as decisões já aprovadas.

> Variante B — por IDs:
>
> Aplique no FSD apenas as correções com os seguintes IDs: [Liste aqui os IDs das correções. Exemplo: C1, I2, M3.]

**Prompt 3 — Nova validação após correções (VERBATIM):**

> Revalide o FSD corrigido (18 itens). Ao final, confirme:
>
> O FSD revisado está validado e pronto para a codificação.

**Prompt 4 — Aplicando as sugestões (VERBATIM):**

> [A extração g14 traz o Prompt 4 — aplicar as sugestões da nova validação.]

**Resultado esperado**: `docs/FSD.md docs/DESIGN.md` (para ferramentas que usam pasta `docs/`) — para as ferramentas agênticas, `FSD.md` na pasta principal.

##6. Vocabulário especializado

### Essencial da análise (g01)

| Termo | Explicação |
|---|---|
| Sistema web | Software acessado pelo navegador, que roda em um servidor. |
| Usuário final | Pessoa que vai usar o sistema para realizar tarefas reais. |
| Público-alvo | Grupo de pessoas para quem o sistema é criado. |
| Regra de negócio | Regra que define como o sistema deve se comportar em situações específicas. |
| Requisito funcional | O que o sistema deve fazer (funções, telas, fluxos). |
| Requisito não funcional | Como o sistema deve ser (performance, segurança, usabilidade). |
| Escopo | Limite do que será feito em uma versão ou fase. |
| MVP / Primeira versão | Versão inicial com o essencial para o sistema funcionar. |
| CRUD | Conjunto de operações: Criar (Create), Ler (Read), Atualizar (Update), Excluir (Delete). |
| Login | Processo de identificação do usuário no sistema. |
| Cadastro | Tela/forma de registro de informações (clientes, produtos etc.). |
| Dashboard | Tela principal que mostra informações importantes do sistema. |
| Relatório | Exibição organizada de dados para consulta ou exportação. |
| Exportação | Geração de arquivo (ex.: PDF, Excel, CSV) a partir dos dados. |
| Upload | Envio de um arquivo do computador do usuário para o sistema. |
| Anexo | Arquivo enviado e vinculado a um registro. |
| Soft delete | Exclusão lógica: o registro é marcado como excluído, mas não é apagado do banco. |
| Auditoria | Registro de quem fez o quê e quando no sistema. |
| Log | Registro técnico de eventos, erros ou acessos. |
| RBAC | Controle de acesso baseado em papéis/perfis (Role-Based Access Control). |
| Perfil / Papel | Conjunto de permissões atribuído a um usuário (ex.: admin, comum). |
| Permissão | Direito de executar determinada ação no sistema. |
| Isolamento de dados | Garantia de que cada usuário só vê/acessa os próprios dados. |
| MVC | Padrão de arquitetura: Model (dados), View (interface), Controller (regras). |
| API / Integração | Conexão do sistema com outro serviço externo. |
| Configurações globais | Parâmetros gerais do sistema, ajustáveis sem alterar código. |
| Migration | Arquivo ou mecanismo usado para criar ou alterar a estrutura do banco de dados. |
| Banco de dados | Local onde o sistema guarda informações. |
| Tabela | Estrutura do banco que armazena registros de um mesmo tipo. |
| Chave estrangeira | Campo que liga registros entre tabelas. |
| Índice | Mecanismo do banco que acelera buscas. |
| Ambiente local | Ambiente no computador do desenvolvedor (ex.: XAMPP). |
| Ambiente de produção | Ambiente onde o sistema fica disponível para usuários reais. |
| Ambiente de homologação | Ambiente de testes antes da produção. |
| Stack | Conjunto de tecnologias usadas em um projeto. |

### Tipos de log (g01)

| Termo | Explicação |
|---|---|
| Log de erros | Registro de falhas do sistema. |
| Log de segurança | Registro de tentativas de acesso, bloqueios e eventos sensíveis. |
| Log de auditoria | Registro de ações dos usuários. |
| Log de acesso | Registro de quem acessou o sistema e quando. |

### Dúvida × decisão (g02)

| Termo | Explicação |
|---|---|
| Dúvida | Pergunta para entender/esclarecer um conceito. |
| Decisão | Escolha que define o rumo do projeto. |

### Segurança (g09)

| Termo | Explicação |
|---|---|
| SQL Injection | Ataque que injeta comandos SQL maliciosos em entradas do sistema. |
| XSS | Injeção de código JavaScript malicioso em páginas vistas por outros usuários. |
| CSRF | Ataque que força o usuário autenticado a executar ações não desejadas. |
| Hash de senha | Transformação da senha em texto irreversível antes de guardar. |
| Validação de entradas | Verificação dos dados recebidos antes de processar. |
| Prepared statement | Consulta SQL com parâmetros que impede injeção. |
| Sessão | Estado de login mantido entre requisições do usuário. |
| Token | Código usado para autenticar/autorizar uma ação. |
| Secret | Informação sensível guardada de forma protegida (ex.: GitHub Secrets). |
| Isolamento de dados | Ver vocabulário da análise. |

### Manutenção (g10)

| Termo | Explicação |
|---|---|
| Manutenção | Alterações feitas em um sistema depois que ele já foi construído. |
| Evolução | Melhorias ou novas funcionalidades adicionadas com o tempo. |
| Documentação técnica | Explicação organizada sobre como o sistema funciona por dentro. |
| Modo manutenção | Forma de orientar a IA quando o sistema já está pronto e precisa ser alterado. |
| Mapa de pastas | Explicação sobre o que fica em cada pasta do projeto. |
| Arquivo de contexto | Arquivo que orienta a IA sobre como trabalhar naquele projeto (`CLAUDE.md` ou `AGENTS.md`). |
| Regressão | Quando uma alteração nova quebra algo que já funcionava antes. |

### Alterações (g11)

| Termo | Explicação |
|---|---|
| Dashboard | Tela principal que mostra informações importantes do sistema. |
| KPI | Indicador visual que resume uma informação importante (saldo, total, quantidade). |
| Front-end | Parte visual do sistema, que o usuário vê e usa. |
| Back-end | Parte interna do sistema, onde ficam regras, processamento e acesso ao banco. |
| View | Arquivo responsável por exibir uma tela ou parte visual do sistema. |
| Layout | Organização visual dos elementos na tela. |
| Navbar | Barra de navegação, geralmente usada no topo do sistema. |
| Bootstrap | Biblioteca CSS que ajuda a criar telas responsivas e organizadas. |
| Font Awesome | Biblioteca de ícones usada em sites e sistemas. |
| Commit | Registro de uma alteração no Git. |

### Rollback (g11)

| Termo | Explicação |
|---|---|
| Rollback | Voltar o sistema para uma versão anterior. |
| Regressão | Retorno para um estado anterior, geralmente porque uma mudança não funcionou bem. |
| Hash do commit | Código identificador de um commit. |
| Tag | Nome dado a uma versão importante do projeto, como v1.0.0. |
| Revert | Criar um novo commit que desfaz alterações anteriores. |
| Reset | Voltar o histórico local para outro ponto. Pode ser perigoso se usado sem cuidado. |
| Detached HEAD | Estado do Git ao visitar uma tag/commit antigo; confunde iniciantes. |

### Skills e stacks (g12)

| Termo | Explicação |
|---|---|
| Skill | Conjunto reutilizável de instruções para a IA executar uma tarefa específica. |
| Comando explícito | Pedido claro feito pelo usuário para acionar uma ação. |
| Prompt original | Texto completo usado antes de virar skill. |
| Instalar skill | Disponibilizar a skill para a IA usar em novas conversas. |
| SKILL.md | Arquivo principal de instruções de uma skill. |
| Recurso da skill | Arquivo extra usado pela skill, como referência ou template. |
| Acionamento | Momento em que a IA decide usar uma skill. |
| Fluxo repetitivo | Processo que precisa ser executado várias vezes. |
| Slash command | Comando iniciado com barra `/`, atalho para executar uma ação. |
| Stack | Conjunto de tecnologias usadas em um projeto. |
| Framework | Base pronta que ajuda a construir sistemas seguindo padrões. |
| Hospedagem | Serviço onde o sistema será publicado. |
| Build | Preparação dos arquivos finais para produção. |
| Runtime | Ambiente que executa o sistema, como PHP, Node.js ou Python. |
| Dependência | Biblioteca ou pacote que o projeto precisa para funcionar. |
| Variável de ambiente | Configuração externa usada para guardar valores como senhas, URLs e tokens. |
| Provedor | Empresa ou serviço que hospeda ou executa o sistema. |
| Adaptação | Ajuste do fluxo para funcionar em outro cenário técnico. |

### Erros (g13)

| Termo | Explicação |
|---|---|
| Erro | Algo que impede o sistema de funcionar como esperado. |
| Bug | Comportamento incorreto do sistema. |
| Sintoma | O que você vê quando o problema acontece. |
| Causa | O motivo real do erro. |
| Correção | Alteração feita para resolver o problema. |
| Log | Registro técnico de eventos ou erros. |
| Stack trace | Detalhamento técnico do caminho do erro no código. |
| Debug | Processo de investigar e entender um erro. |
| Rollback | Voltar o projeto para um estado anterior usando Git ou backup. |

### Fluxo (g01/g13)

| Termo | Explicação |
|---|---|
| APES IA5K | Desenvolvimento assistido por IA com método e controle. |
| Arquivos vivos | Documentos que carregam a memória do projeto (STATUS.md, ERROS.md, PLANO.md). |
| Chat de dúvidas / chat de ajuda | Chat separado para aprender/esclarecer, sem contaminar o contexto. |
| Chat dos prompts | Chats usados para executar as etapas oficiais do fluxo. |
| Frases de avanço | Frases padrão que encerram cada passo e indicam o próximo (ex.: "Insumos validados. Próximo passo:..."). |

##7. Modelos de documentos

### `docs/DESIGN.md` — Design System

Criado no Passo 1 da Análise. O modelo pronto da metodologia é o **"Admin Logic"** (transcrito em inglês no original — entregável literal, NÃO traduzir). Estrutura:

```yaml
---
name: Admin Logic
colors:
  surface: #f7f8fa
  primary: #0f2d7b
  on-primary: #ffffff
  primary-container: #2c4593
  ...
typography:
  fonts: [Public Sans, Inter]
  ...
rounded: ...
spacing: ...
---
```

Seções (em inglês no original): **Brand & Style**, **Colors**, **Typography**, **Layout & Spacing**, **Elevation & Depth**, **Shapes**, **Components** (botões, inputs, tabelas, cartões etc.).

- Salvar em `docs/DESIGN.md`.
- Formas de criação: pronto, a partir de imagem (Stitch: ZIP com `code.html` / `screen.png` / `DESIGN.md`), ou a partir de HTML/CSS; depois refinar.
- Instrução de codificação (bloco): "Antes de criar ou alterar qualquer tela, leia e siga o arquivo `docs/DESIGN.md`."

### `PRD.md` — Product Requirements Document (raiz)

Criado no Passo 3 da Análise. 16 seções:

1. Visão Geral do Produto
2. Público-alvo e Perfis de Usuário
3. Objetivos do Produto
4. Problemas que o Produto Resolve
5. Funcionalidades da Primeira Versão
6. Funcionalidades Futuras (Fora de Escopo)
7. Regras de Negócio
8. Fluxos de Usuário
9. Telas e Navegação
10. Requisitos de Dados (Entidades)
11. Relatórios e Exportações
12. Segurança e Permissões
13. Restrições e Premissas
14. Critérios de Sucesso
15. Riscos e Mitigações
16. Resumo Final do PRD

**[A extração g03 traz os nomes exatos das 16 seções — ver g03.]**

Salvar com o prompt: "Forneça o PRD completo para download em Markdown. Nome do arquivo: PRD.md"

### `DECISOES_TECNICAS.md` (raiz)

Criado no Passo 4 da Análise. 16 seções:

1. Documentos recebidos
2. Stack definida
3. Ambiente local
4. Testes e homologação
5. Produção
6. Recursos estruturais
7. Autenticação
8. Perfis e permissões
9. Soft delete
10. Auditoria
11. Configurações globais
12. Uploads
13. Relatórios e exportações
14. APIs e integrações
15. Padrão de entrega
16. Pronto para o FSD

**[A extração g04 traz os nomes exatos das 16 seções — ver g04.]**

Salvar com o prompt: "Forneça o DECISOES_TECNICAS.md completo para download em Markdown. Nome do arquivo: DECISOES_TECNICAS.md"

### `docs/FSD.md` — Functional Specification Document

Criado no Passo 5 da Análise (e validado no Passo 6). 28 seções:

1. Visão Geral
2. Documentos do Projeto para Implementação
3. Stack Definida
4. Ambientes do Projeto
5. Arquitetura do Sistema
6. Escopo Funcional da Primeira Versão
7. Fora de Escopo
8. Perfis de Usuário e Permissões
9. Recursos Estruturais do Sistema
10. Entidades do Sistema
11. Modelo de Dados Proposto
12. Módulos e Telas
13. Fluxos Funcionais
14. Validações e Regras de Negócio
15. Autenticação e Sessão
16. Controle de Acesso
17. Auditoria e Histórico
18. Soft Delete e Exclusões
19. Logs (erros/segurança)
20. Configurações Globais
21. Uploads, Anexos e Arquivos
22. Relatórios, Consultas e Exportações
23. APIs e Integrações Externas
24. Segurança Funcional
25. Organização Sugerida da Implementação (ex.: 24 etapas)
26. Critérios de Aceitação Técnica e Funcional
27. Pontos Pendentes e Decisões Futuras
28. Conclusão

Regras do FSD: autossuficiente; sem "segundo o PRD"; não gera código; não menciona skills; MVC; raiz `[Diretório do Projeto - Repositório]`; proibidos `public_html`/`public`/`htdocs`/`www` como nome principal; local `htdocs/nome-do-projeto/`; produção `www/nome-do-projeto/`; sem `.env` → `config/config.php` ou `config/configuracoes.php`; migrations obrigatórias (anti-duplicação, não acessíveis por URL, execução controlada); uploads/exportações/APIs só se confirmados.

Salvar com o prompt: "Forneça o FSD completo para download em Markdown. Nome do arquivo: FSD.md"

### `docs/INSUMOS.md` — Inventário de insumos

Criado no Passo 1 da Codificação. Tabela:

**Inventário de insumos do projeto**

| Arquivo | O que é | Usado pelo sistema em execução? | Onde será usado | Observações |
|---|---|---|---|---|

### `docs/PLANO.md` — Plano de construção

Criado no Passo 2 da Codificação. Fases:

- Fase 1: Infraestrutura e base
- Fase 2: Banco de dados e persistência
- Fase 3: Autenticação, sessão e controle de acesso
- Fase 4+: um módulo funcional por fase
- Fase final: itens transversais

### Arquivo de contexto (raiz) — `CLAUDE.md` no Claude Code; `AGENTS.md` no Codex e no Antigravity

Criado no Passo 2 da Codificação. Regras: caminhos relativos; proibido caminhos absolutos/`file:///`. Protocolos:

Antes de iniciar qualquer trabalho:
1. Ler FSD
2. Ler DESIGN.md (se houver interface)
3. Ler PLANO.md
4. Ler STATUS.md
5. Ler INSUMOS.md
6. Ler ERROS.md

Ao terminar:
1. Atualizar STATUS
2. Registrar erros em ERROS
3. Informar o que foi feito
4. Informar como testar ou validar a entrega

No **modo manutenção** (Passo 6), o arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) passa a orientar: ler a documentação antes de alterar; não refazer o sistema; não mudar arquitetura sem necessidade; preservar funcionalidades existentes; testar antes de concluir; atualizar STATUS.md; registrar erros em ERROS.md; manter cuidados de segurança. Protocolo manutenção (antes/depois) transcrito no Passo 6 (`##3`).

### `docs/STATUS.md` — memória de progresso

Atualização registra: fase trabalhada; tarefas concluídas; tarefas pendentes; arquivos principais alterados; testes executados; resultado dos testes; próxima fase recomendada.

### `docs/ERROS.md` — memória técnica

Modelo de registro (VERBATIM):

```
## <data> - <título curto do erro>

- Sintoma:
- Causa:
- Solução aplicada:
- Como evitar no futuro:
```

### `docs/MANUTENCAO.md` — documentação de manutenção (Passo 6)

Seções mínimas:
- Visão geral
- Stack e ambientes
- Como rodar localmente
- Mapa de pastas
- Banco de dados e persistência
- Autenticação, autorização e usuários
- Como adicionar uma nova tela
- Como adicionar um novo campo
- Como adicionar uma nova regra de negócio
- Como testar alterações
- Cuidados de segurança
- Como registrar progresso
- O que não fazer

### `docs/COMO-PEDIR-MUDANCAS.md` (Passo 6)

Conteúdo: explicação simples de como pedir mudanças; orientação para a IA ler `docs/MANUTENCAO.md`, `docs/FSD.md`, `docs/DESIGN.md`, `docs/STATUS.md`, `docs/ERROS.md`; modelos de prompts prontos (8 tipos: campo em cadastro, nova tela, corrigir erro, alterar regra, ajustar visual, relatório/filtro, revisar segurança, preparar commit); checklist antes de aceitar uma alteração. Exemplo-modelo transcrito no Passo 6 (`##3`).

### `.gitignore` (Passo 3)

- Ignorar: configs reais com segredos, `.env` reais, chaves privadas, certificados, tokens, logs, dumps, temporários, caches, builds, dependências reconstruíveis, arquivos de SO, configs de editores.
- NÃO ignorar: `docs/`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`).
- Versionar: `.env.example`, `config.example.*`; migrations versionadas.
- Exemplo base: `.env`, `logs/`, `node_modules/`.

### `.gitattributes` (Passo 3)

Finais de linha; texto vs binário; sem lista fixa incompatível.

### Estrutura de pastas PHP (exemplo, g07)

```
app/
config/
database/
public/
assets/
logs/
```

### Arquivos de configuração (g07)

`config.example.php` / `config.php` (ou `config.example` / `config.local`); `.env.example` / `.env`. **Nunca enviar segredos ao GitHub.** Não usar `.env` para credenciais: usar `config/config.php` ou `config/configuracoes.php`.

### Pasta `prompts/` (g12)

Prompts adaptáveis numerados: `01-validar-insumos.md`, `02-planejar-e-preparar.md`, `03-inicializar-git.md`, `04-construir-fase.md`, `05-revisao-seguranca.md`, `06-documentacao-final.md`.

### Skill `construir-proxima-fase/` (g12)

```
construir-proxima-fase/
├── SKILL.md
└── references/
 └── prompt-04-construir-fase.md
```

- Fonte: `docs/04-construir-fase.md` (prompt 04 salvo).
- `SKILL.md`: frontmatter válido, nome em minúsculas, descrição de acionamento explícito, instrução de seguir integralmente a referência. **[AUSENTE: o formato exato/exemplo de frontmatter do SKILL.md não é fornecido na metodologia.]**
- `references/prompt-04-construir-fase.md`: prompt original completo.

### Documentos por fase (resumo de criação)

| Fase | Documento criado |
|---|---|
| Análise 1 | `docs/DESIGN.md` |
| Análise 3 | `PRD.md` |
| Análise 4 | `DECISOES_TECNICAS.md` (raiz) |
| Análise 5/6 | `docs/FSD.md` |
| Codificação 1 | `docs/INSUMOS.md` |
| Codificação 2 | `docs/PLANO.md`, `docs/STATUS.md`, `docs/ERROS.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) |
| Codificação 3 | `.gitignore`, `.gitattributes` |
| Codificação 6 | `docs/MANUTENCAO.md`, `docs/COMO-PEDIR-MUDANCAS.md`, arquivo de contexto (`CLAUDE.md` ou `AGENTS.md`) em modo manutenção |










