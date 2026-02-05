#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost}"
EXPECTED_TEXT="Hello from Effective Mobile!"

echo "Making request on $URL";
echo "Expected output: $EXPECTED_TEXT";

# Делаем запрос и тело
response=$(curl -s "$URL")

echo "Response:" 
echo $response

# Проверка тела
if ! (echo $response | grep -q "$EXPECTED_TEXT"); then
    echo "Response body does not contain expected text: $EXPECTED_TEXT"
    exit 1
fi

echo "Backend is healthy."
exit 0
