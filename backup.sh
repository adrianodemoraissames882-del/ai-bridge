#!/usr/bin/env bash
# Backup del lab Dracky (VM). NO incluye secretos: el .env se guarda aparte.
#
# Uso:   ./backup.sh [destino]        -> por defecto SIN cache de modelos (~60 KB)
#        FULL=1 ./backup.sh           -> completo, incluye cache de modelos (~960 MB)
#
# La cache de modelos (embeddings) se re-descarga sola, así que por defecto se omite.
set -euo pipefail

DEST="${1:-$HOME/dracky-recovery/backups}"
FULL="${FULL:-0}"
STAMP="$(date +%Y%m%d-%H%M)"
mkdir -p "$DEST"

SUFFIX="slim-"
EXCLUDE="--exclude=./cache"
MODE="sin cache de modelos"
if [ "$FULL" = "1" ]; then
  SUFFIX=""
  EXCLUDE=""
  MODE="completo (con cache de modelos)"
fi

echo "==> 1/2 Volumen de Open WebUI: chats, usuarios, login ($MODE)"
if docker volume inspect open-webui >/dev/null 2>&1; then
  docker run --rm \
    -v open-webui:/data \
    -v "$DEST":/backup \
    -e EXCLUDE="$EXCLUDE" \
    -e OUT="/backup/open-webui-data-${SUFFIX}${STAMP}.tgz" \
    alpine sh -c 'tar czf "$OUT" $EXCLUDE -C /data .'
else
  echo "    aviso: no existe el volumen 'open-webui', se omite"
fi

echo "==> 2/2 Config de Hermes (personalidad, memoria, config, cron)"
tar czf "$DEST/hermes-config-$STAMP.tgz" -C "$HOME" \
  .hermes/SOUL.md \
  .hermes/MEMORY.md \
  .hermes/memories \
  .hermes/config.yaml \
  .hermes/cron

echo
echo "Backup en $DEST:"
ls -lh "$DEST" | tail -n +2
echo
echo "RECORDATORIO: el .env (~/.hermes/.env) con las API keys NO está en este backup."
