#!/bin/sh
# Gera a versão de produção em dist/: valida as referências e copia
# apenas o que o site publica (não há compilação: é HTML/CSS/JS puro).
set -eu
cd "$(dirname "$0")/.."

sh scripts/check.sh

rm -rf dist
mkdir -p dist
cp index.html favicon.svg dist/
cp -R assets dist/assets

count=$(find dist -type f | wc -l | tr -d ' ')
size=$(du -sh dist | cut -f1)
echo "build: dist/ pronto com $count arquivos ($size)"
