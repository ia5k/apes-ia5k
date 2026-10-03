# FSD — APES IA5K

## Estrutura
| Caminho | Função |
|---|---|
| `SKILL.md` | Instruções da skill (lidas por Claude Code, Codex e Antigravity). |
| `METODOLOGIA.md` | Descrição completa da metodologia para humanos. |
| `references/` | Prompts e explicações de cada fase. |
| `templates/` | Modelos de PRD, FSD, DESIGN, DECISOES_TECNICAS, INSUMOS, PLANO, STATUS, ERROS, CHECKLIST, CLAUDE.md e AGENTS.md. |
| `scripts/ia5k-*.sh` | Hooks do modo sessão (somente Claude Code). |
| `scripts/inventario-projeto.sh` | Inventário de pastas para o cold start. |
| `scripts/instalar-ferramentas.sh`, `verificar-ferramentas.sh` | Ferramentas opcionais de economia de tokens. |
| `hooks/claude-settings.json` | Bloco de hooks para o `settings.json` do Claude Code. |
| `install.sh` | Instalador. |

## Arquivo de contexto
- Claude Code: `CLAUDE.md`.
- Codex e Antigravity: `AGENTS.md`.
- Projeto usado nos dois mundos: conteúdo em `AGENTS.md` e `CLAUDE.md` com a linha `@AGENTS.md`.

## Estado do modo sessão
Arquivos-marcador em `~/.ia5k/` (`sessions/`, `projects/`, `global-on`, `p1/`, `edits/`).
