# APES IA5K

**Uma metodologia para construir sistemas com agentes de IA sem perder o controle.** Documentos antes de código, uma etapa por vez, testes de verdade e registro de tudo. Instala como skill no **Claude Code**, no **Codex** e no **Antigravity**.

> Sem a metodologia, o agente constrói tudo de uma vez, inventa funcionalidades, esquece o que decidiu ontem e chama de "pronto" o que nunca rodou.
> Com ela, cada pedido passa pelos documentos do projeto, vira uma etapa planejada, é testado e fica registrado.

---

## Como funciona, em 30 segundos

```
ANÁLISE (sem código)                     CODIFICAÇÃO (em etapas)
Design System → Ideia → PRD              Insumos → Estrutura → Git
→ Decisões técnicas → FSD → Validação    → [ etapa: código → testes → registro → commit ] × N
                                         → Revisão de segurança → Documentação
```

- **PRD** diz *o que* o sistema faz. **FSD** diz *como* cada parte funciona. O agente segue o FSD e não inventa nada fora dele.
- **`docs/STATUS.md`** guarda o progresso e **`docs/ERROS.md`** guarda cada erro com causa e correção. Um chat novo, amanhã, sabe exatamente onde parou.
- Ao fim de cada etapa você recebe três checklists em linguagem simples: **o que foi feito**, **o que testar e como**, e **o que não pode ter quebrado**.

A explicação completa, passo a passo, está em **[METODOLOGIA.md](METODOLOGIA.md)**.

---

## Instalação

```bash
git clone https://github.com/kairoxaioficial/apes-ia5k.git
cd apes-ia5k
./install.sh claude        # Claude Code: copia a skill e registra os hooks
./install.sh codex         # Codex: ~/.codex/skills/apes-ia5k
./install.sh antigravity   # Antigravity: ~/.gemini/antigravity/skills/apes-ia5k
./install.sh all           # os três
```

Antigravity por projeto: `./install.sh antigravity --projeto /caminho/do/projeto` (instala em `.agent/skills/`).

Requisitos: `bash` e, para os hooks do Claude Code, `jq`. O instalador faz backup do `~/.claude/settings.json` antes de mexer e pode ser rodado de novo sem duplicar nada.

---

## Uso

### Claude Code
```
/apes-ia5k            ativa para a sessão e o projeto
/apes-ia5k off        desativa
/apes-ia5k global     ativa em todas as sessões e projetos
```
Com o modo ativo, os hooks:
- injetam o protocolo P1–P8 em **todo** pedido, com o estado real dos documentos;
- **bloqueiam edição de código** enquanto faltar `PRD.md`, `docs/FSD.md`, `docs/PLANO.md`, `docs/STATUS.md` ou `docs/ERROS.md`;
- **não deixam encerrar** se houve código alterado sem `docs/STATUS.md` atualizado.

Estado na linha de comando: `~/.claude/skills/apes-ia5k/scripts/ia5k-session.sh status`.

### Codex e Antigravity
Peça ao agente: **"use a skill apes-ia5k"**. Esses agentes não têm hooks, então o protocolo vai escrito no `AGENTS.md` do projeto (modelo em [`templates/AGENTS.md`](templates/AGENTS.md)) e o agente o cumpre por instrução.

### Primeiros pedidos
- Projeto novo: *"Quero criar um sistema de agendamento para clínicas."* O agente pergunta se você quer explorar a ideia e começa pela análise.
- Projeto que já tem código: *"Adicione exportação em PDF no relatório."* Se faltarem documentos, o agente faz o **cold start**: lê o projeto inteiro, escreve os documentos e só então atende o pedido.

---

## CLAUDE.md ou AGENTS.md?

| Agente | Arquivo de contexto |
|---|---|
| Claude Code | `CLAUDE.md` |
| Codex | `AGENTS.md` |
| Antigravity | `AGENTS.md` |

Usa mais de um agente no mesmo projeto? Deixe o conteúdo em `AGENTS.md` e coloque no `CLAUDE.md` só a linha:
```
@AGENTS.md
```
O Claude Code importa o arquivo, e todos os agentes leem as mesmas regras.

---

## O que vem no repositório

```
apes-ia5k/
├── SKILL.md              instruções que o agente segue
├── METODOLOGIA.md        a metodologia explicada para pessoas
├── references/           os prompts de cada fase, na íntegra
│   ├── analise-fundamentos.md    fluxo, vocabulário, chat de dúvidas, design system
│   ├── analise-docs.md           explorar ideia, PRD, decisões técnicas, FSD, validação
│   ├── codificacao-estrutura.md  chat de ajuda, insumos, estrutura, Git
│   ├── codificacao-etapas.md     codificar em etapas, testes, erros, segurança
│   ├── codificacao-final.md      documentação, pedidos de alteração, rollback
│   ├── avancado-extras.md        criar skills, outras stacks, erros comuns
│   ├── sintese-executiva.md      visão geral consolidada
│   └── ferramentas-token.md      ferramentas opcionais de economia de tokens
├── templates/            modelos de PRD, FSD, DESIGN, DECISOES_TECNICAS, INSUMOS,
│                         PLANO, STATUS, ERROS, CHECKLIST, CLAUDE.md e AGENTS.md
├── scripts/              hooks do modo sessão (Claude Code) e utilitários
├── hooks/                bloco de hooks para o settings.json do Claude Code
└── install.sh
```

---

## Perguntas frequentes

**Funciona em qualquer stack?** Sim. A tecnologia é escolhida no passo de Decisões técnicas e fixada no FSD. Os prompts são genéricos.

**E o deploy?** Fica fora da metodologia de propósito. Ela termina com o sistema testado, revisado e documentado; publicar na hospedagem que você escolher é um passo seu.

**Preciso seguir tudo para uma correção de uma linha?** Não. Edição simples vai direto: corrige, registra no `STATUS.md` e no `ERROS.md` e entrega os checklists. Só recurso novo ou mudança grande passa pelos documentos antes.

**As ferramentas de economia de tokens são obrigatórias?** Não. O Claude Code tenta instalá-las em segundo plano; sem elas a metodologia funciona igual, só gasta mais tokens.

**Como desinstalar?** Apague a pasta da skill (`~/.claude/skills/apes-ia5k`, `~/.codex/skills/apes-ia5k` ou `~/.gemini/antigravity/skills/apes-ia5k`) e, no Claude Code, restaure o backup do `settings.json` ou remova os hooks que apontam para `skills/apes-ia5k/`.

---

## Licença

MIT. Veja [LICENSE](LICENSE).
