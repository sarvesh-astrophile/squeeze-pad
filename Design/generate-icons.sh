#!/bin/bash
# Regenerates every AppIcon PNG from Design/AppIcon-1024.png.
# Usage: ./generate-icons.sh
set -euo pipefail

cd "$(dirname "$0")"

SRC="AppIcon-1024.png"
OUT="../SqueezePad/Assets.xcassets/AppIcon.appiconset"

if [[ ! -f "$SRC" ]]; then
  echo "error: $SRC not found"
  exit 1
fi

[[ -d "$OUT" ]] || { echo "error: appiconset not found at $OUT"; exit 1; }

gen() {
  local name="$1" size="$2"
  sips -z "$size" "$size" "$SRC" --out "$OUT/$name" >/dev/null
}

gen icon_16x16.png      16
gen icon_16x16@2x.png   32
gen icon_32x32.png      32
gen icon_32x32@2x.png   64
gen icon_128x128.png    128
gen icon_128x128@2x.png 256
gen icon_256x256.png    256
gen icon_256x256@2x.png 512
gen icon_512x512.png    512
gen icon_512x512@2x.png 1024

echo "Generated 10 icon sizes in $OUT"
