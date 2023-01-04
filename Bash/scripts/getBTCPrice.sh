#!/usr/bin/env bash
# Fetches the current price of Bitcoin in Euro € from Binanace
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
set -euf -o pipefail
if ! command -v jq > /dev/null
then
  curl \
    --silent \
    --location \
    "https://api.binance.com/api/v3/ticker/price?symbol=BTCEUR"
else
  curl \
    --silent \
    --location \
    "https://api.binance.com/api/v3/ticker/price?symbol=BTCEUR" | \
    jq '.'
fi
set +euf -o pipefail
exit 0
