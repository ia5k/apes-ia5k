# PRD — APES IA5K

## Objetivo
Transformar uma metodologia de desenvolvimento com IA (documentos antes de código, trabalho em etapas, testes de verdade, registro de tudo) em uma skill instalável que funcione no Claude Code, no Codex e no Antigravity, sem depender da memória do modelo.

## Problema
Agentes de IA esquecem regras, constroem tudo de uma vez, inventam funcionalidades, não testam e não registram o que fizeram. Prompts soltos exigem disciplina manual do usuário.

## Público
Pessoas que desenvolvem sistemas com agentes de IA, de iniciantes a desenvolvedores experientes, em qualquer stack.

## Funcionalidades
- Fluxo completo em duas fases: Análise (design system, explorar ideia, PRD, decisões técnicas, FSD, validação) e Codificação (insumos, estrutura, Git, etapas, testes, erros, segurança, documentação).
- Templates de todos os documentos (`templates/`).
- Prompts de cada fase (`references/`).
- Modo sessão no Claude Code com hooks que injetam o protocolo, bloqueiam código antes dos documentos e cobram o registro no fim.
- Suporte ao Codex e ao Antigravity via `AGENTS.md` (sem hooks: o protocolo vai escrito no arquivo de contexto).
- Instalador para os três agentes (`install.sh`).

## Fora do escopo
- Publicação do sistema em hospedagem (deploy). A metodologia termina na documentação.

## Critérios de aceite
- `install.sh --claude`, `--codex` e `--antigravity` copiam a skill para o lugar certo.
- No Claude Code, com o modo ativo, editar código sem os documentos é bloqueado.
- No Codex/Antigravity, `templates/AGENTS.md` contém o protocolo completo.
