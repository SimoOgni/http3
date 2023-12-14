#!/bin/bash
chrome_path=$(which google-chrome-stable || which google-chrome || which chromium-browser)

if [ -z "$chrome_path" ]; then
  echo "Chrome non trovato sul sistema."
  exit 1
fi

"$chrome_path" --enable-quic --quic-version=h3 --origin-to-force-quic-on=localhost:443
