#!/bin/sh
# Monta os dois arquivos de instalação a partir de skills/escrita-humana/.
#
#   escrita-humana.md   arquivo único, com a checagem embutida — o caminho mais simples
#   escrita-humana.zip  SKILL.md e eval.md na raiz do arquivo, sem pasta em volta
#
# Rode depois de editar a skill:  sh montar.sh

set -e
cd "$(dirname "$0")"

ORIGEM=skills/escrita-humana

# --- arquivo único -----------------------------------------------------------
# A skill manda conferir o resultado contra o eval. Sem o eval.md ao lado, a
# referência precisa apontar para dentro do próprio arquivo, senão o passo 5 do
# fluxo manda ler um arquivo que não existe.
sed 's/o `eval.md`, você mesmo./a **Checagem** no fim deste arquivo, você mesmo./' \
  "$ORIGEM/SKILL.md" > escrita-humana.md

printf '\n---\n\n' >> escrita-humana.md

# Rebaixa os títulos do eval um nível para ele caber como seção do arquivo maior.
sed -e 's/^## /### /' -e 's/^# Checagem da escrita humana/## Checagem/' \
  "$ORIGEM/eval.md" >> escrita-humana.md

# --- zip ---------------------------------------------------------------------
# Sem pasta em volta: o SKILL.md fica na raiz do arquivo.
rm -f escrita-humana.zip
(cd "$ORIGEM" && zip -q ../../escrita-humana.zip SKILL.md eval.md)

echo "escrita-humana.md  $(wc -c < escrita-humana.md) bytes"
echo "escrita-humana.zip $(wc -c < escrita-humana.zip) bytes"
