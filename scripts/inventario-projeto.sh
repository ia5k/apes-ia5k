#!/bin/bash
# Inventario do projeto — APES IA5K.
# Lista TUDO que precisa ser coberto na leitura inicial (cold start), para que a
# geracao de PRD/FSD/DECISOES_TECNICAS nasca do projeto inteiro, nao de amostra.
#
# Uso: inventario-projeto.sh [diretorio]
set -u
RAIZ="${1:-$PWD}"
cd "$RAIZ" 2>/dev/null || { echo "diretorio invalido: $RAIZ" >&2; exit 1; }

IGNORAR='node_modules|/vendor/|/dist/|/build/|/.git/|/.next/|/target/|/__pycache__|/.venv/|/venv/|/coverage/|/.cache/|package-lock.json|yarn.lock|pnpm-lock.yaml|composer.lock|Cargo.lock|poetry.lock|/migrations/.*\.pyc'

listar() { git ls-files 2>/dev/null | grep -vE "$IGNORAR" || find . -type f | sed 's|^\./||' | grep -vE "$IGNORAR"; }

echo "# INVENTARIO DO PROJETO"
echo "Raiz: $RAIZ"
echo "Data: $(date +%Y-%m-%d)"
echo

total="$(listar | wc -l | tr -d ' ')"
echo "## 1. Total de arquivos versionados (fora dependencias): $total"
echo

echo "## 2. Arquivos por extensao (o que precisa ser lido)"
listar | sed -n 's/.*\.\([A-Za-z0-9]\{1,8\}\)$/\1/p' | sort | uniq -c | sort -rn | head -25
echo

echo "## 3. Pastas de primeiro e segundo nivel (com contagem)"
listar | awk -F/ 'NF>1{print $1"/"(NF>2?$2"/":"")}' | sort | uniq -c | sort -rn | head -30
echo

echo "## 4. Manifestos e configuracao (definem a stack)"
for f in package.json composer.json pyproject.toml requirements.txt Pipfile Cargo.toml Gemfile go.mod pubspec.yaml pom.xml build.gradle build.gradle.kts Makefile Dockerfile docker-compose.yml .env.example .env.sample tsconfig.json vite.config.ts next.config.js tailwind.config.js artisan manage.py; do
  [ -f "$f" ] && echo "  - $f"
done
echo

echo "## 5. Banco de dados (migrations, schemas, models)"
listar | grep -iE 'migrat|schema|/models?/|entity|entities|\.sql$|prisma' | head -40
echo

echo "## 6. Rotas, controllers e telas"
listar | grep -iE '/routes?/|/controllers?/|/pages?/|/screens?/|/views?/|/app/.*/page\.|urls\.py|web\.php|api\.php' | head -40
echo

echo "## 7. Autenticacao, permissao e seguranca"
listar | grep -iE 'auth|login|permission|policy|guard|middleware|session|role' | head -30
echo

echo "## 8. Testes existentes"
listar | grep -iE '(^|/)(tests?|spec|__tests__)/|\.test\.|\.spec\.|_test\.' | head -25
echo

echo "## 9. Variaveis de ambiente declaradas"
for f in .env.example .env.sample .env.template; do
  [ -f "$f" ] && grep -oE '^[A-Z0-9_]+' "$f" | sort -u | sed 's/^/  - /'
done
echo

echo "## 10. Integracoes externas citadas no codigo"
grep -rhoE 'https?://[a-zA-Z0-9.-]+' --include='*.*' . 2>/dev/null | grep -vE "$IGNORAR" | sed 's|https\?://||' | sort | uniq -c | sort -rn | head -15
echo

echo "## 11. Pendencias ja marcadas no codigo"
grep -rn -E '(TODO|FIXME|HACK|XXX):?' --include='*.*' . 2>/dev/null | grep -vE "$IGNORAR" | wc -l | tr -d ' ' | sed 's/^/  ocorrencias: /'
echo

echo "## COMO USAR ESTE INVENTARIO"
cat <<'TXT'
  Cada item das secoes 3 a 9 precisa estar COBERTO antes de escrever PRD, FSD ou
  DECISOES_TECNICAS. Cobrir = entender pelo grafo (tokensave / code-review-graph)
  ou, quando o grafo nao alcancar, ler o arquivo.
  Ao final, monte a tabela de cobertura: pasta/modulo -> como foi coberto -> o que faz.
  O que continuar sem resposta vira "PENDENTE - confirmar com o usuario" no documento.
  Nunca inventar funcionalidade que o codigo nao mostra.
TXT
