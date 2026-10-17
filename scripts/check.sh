#!/bin/sh
# Confere se todo arquivo local citado no index.html existe e se não sobrou
# nenhum caminho do computador ou endereço privado.
set -eu
cd "$(dirname "$0")/.."

fail=0

# Caminhos locais: src/href de tags e valores "assets/..." do JSON de dados.
refs=$( { grep -oE '(src|href)="[^"#:$]+"' index.html | sed -E 's/^(src|href)="//; s/"$//'; \
          grep -oE '"assets/[^"]+"' index.html | tr -d '"'; } | sort -u )

for ref in $refs; do
  if [ -f "$ref" ]; then
    echo "ok       $ref"
  else
    echo "FALTANDO $ref"
    fail=1
  fi
done

# Nada pode apontar para o computador local, arquivos temporários ou sessões privadas.
if grep -nE 'file://|/Users/|/private/tmp|localhost|127\.0\.0\.1|claude\.ai/artifact' index.html; then
  echo "ERRO: referência local ou privada encontrada acima"
  fail=1
fi

if [ "$fail" -ne 0 ]; then
  echo "check: falhou"
  exit 1
fi
echo "check: tudo certo"
