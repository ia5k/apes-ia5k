# INSUMOS — Validação de Materiais de Entrada

> **Projeto:** <nome>
> **Última atualização:** <data>
> **Passo:** 1 da Codificação (Prompt: "Validar insumos" em `references/codificacao-estrutura.md`)

---

## Documentos Obrigatórios (Devem Existir e Estar Aprovados)

| Documento | Caminho | Existe? | Lido Completo? | Coerente? | Aprovado? |
|---|---|---|---|---|---|
| Design System | `docs/DESIGN.md` | ☐ | ☐ | ☐ | ☐ |
| Especificação Funcional | `docs/FSD.md` | ☐ | ☐ | ☐ | ☐ |
| Product Requirements | `PRD.md` | ☐ | ☐ | ☐ | ☐ |
| Decisões Técnicas | `DECISOES_TECNICAS.md` | ☐ | ☐ | ☐ | ☐ |
| Plano de Desenvolvimento | `docs/PLANO.md` | ☐ | ☐ | ☐ | ☐ |
| Status do Desenvolvimento | `docs/STATUS.md` | ☐ | ☐ | ☐ | ☐ |
| Registro de Erros | `docs/ERROS.md` | ☐ | ☐ | ☐ | ☐ |
| Instruções para IAs | `CLAUDE.md` | ☐ | ☐ | ☐ | ☐ |

> **Regra:** NENHUM código é escrito antes de TODOS os itens acima estarem ✅.

---

## Conferências Obrigatórias (Checklist Passo 1)

### 1. Leitura Completa
- [ ] Ler `docs/DESIGN.md` por completo
- [ ] Ler `docs/FSD.md` por completo
- [ ] Ler `PRD.md` por completo
- [ ] Ler `DECISOES_TECNICAS.md` por completo
- [ ] Ler `docs/PLANO.md` por completo
- [ ] Ler `docs/STATUS.md` por completo
- [ ] Ler `docs/ERROS.md` por completo
- [ ] Ler `CLAUDE.md` por completo

### 2. Coerência FSD ↔ PRD
- [ ] Todas as funcionalidades do PRD (Seção 5) estão cobertas no FSD (Seções 11-17)
- [ ] Regras de negócio do PRD (Seção 7) refletidas no FSD (Seção 6, 11, 13)
- [ ] Critérios de aceitação do PRD (Seção 10) mapeados no FSD (Seção 26)
- [ ] Perfis do PRD (Seção 4) = Perfis do FSD (Seção 3, 9)
- [ ] Fluxos do PRD (Seção 9) = Fluxos do FSD (Seção 13)
- [ ] Entidades do PRD (Seção 8) = Entidades do FSD (Seção 11, 8.1)

### 3. Decisões Técnicas Completas (16 Seções)
- [ ] 1. Linguagem/Framework definida
- [ ] 2. Banco de dados definido
- [ ] 3. Desenvolvimento local definido
- [ ] 4. Hospedagem definida
- [ ] 5. Organização pastas/bootstrap definida
- [ ] 6. Login/Auth definido
- [ ] 7. Perfis/RBAC definido
- [ ] 8. Auditoria definida
- [ ] 9. Soft delete definido
- [ ] 10. Logs/Erros em banco definido
- [ ] 11. Contingência arquivo definida
- [ ] 12. Uploads definido (sim/não + detalhes)
- [ ] 13. Exportações definido (sim/não + detalhes)
- [ ] 14. APIs/Integrações definido (sim/não + detalhes)
- [ ] 15. Configs globais definido
- [ ] 16. Outras decisões registradas
- [ ] **NENHUMA lacuna para IA "inventar"**

### 4. Coerência DESIGN.md ↔ FSD
- [ ] Stack do FSD (Seção 3) suporta componentes do DESIGN.md (Seção 5)
- [ ] Responsividade DESIGN (Seção 6) = FSD Fase 4 critérios
- [ ] Acessibilidade DESIGN (Seção 7) = FSD Fase 14/23 checklist
- [ ] Cores/Tipografia/Espaçamento DESIGN = implementáveis na stack

### 5. Validação do FSD (Passo 6 Fase 1)
- [ ] FSD passou pela **Validação Independente** (Prompt em `references/analise-docs.md`)
- [ ] Relatório de validação: Resumo, Críticos, Importantes, Melhorias, Cobertura PRD, Decisões, Design, Conclusão
- [ ] Status do FSD = ✅ Validado

### 6. Ponto de Partida Confirmado
- [ ] Próxima fase pendente identificada no `docs/PLANO.md` (seguir ordem, não escolher)
- [ ] Fase anterior ✅ Concluída confirmada no `docs/STATUS.md`
- [ ] Contexto da fase lido no `docs/FSD.md` (seção correspondente)

---

## Lacunas/Conflitos Encontrados e Correções
> Registrar AQUI qualquer incongruência e o que foi corrigido ANTES de codificar.

| Item | Documento(s) | Incongruência | Correção Aplicada |
|---|---|---|---|
| 1 | <ex.: PRD vs FSD> | <ex.: PRD pede export PDF, FSD não tem Fase 10> | <ex.: Adicionada Fase 10 no FSD> |
| 2 | <ex.: DECISOES vs FSD> | <ex.: DECISOES diz PostgreSQL, FSD Seção 3 diz MySQL> | <ex.: Corrigido FSD para PostgreSQL> |
| 3 | | | |

---

## Confirmação Final (Obrigatória para Iniciar Codificação)

- [ ] **TODOS** os checklists acima estão ✅
- [ ] **NENHUM** documento com status ⏳ Em elaboração
- [ ] FSD **Validado** (Passo 6 concluído)
- [ ] Próxima fase = <número e nome> confirmada
- [ ] **Pronto para executar Prompt 04 (Codificar em etapas) para essa fase**

---

> **Regra de Ouro:** "Validar insumos é o Passo 1 da Codificação. Nenhum código é escrito antes desta conferência."
> Se algo faltar → **PARE**, corrija o documento, revalide, só então codifique.