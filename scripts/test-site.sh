#!/usr/bin/env bash
set -euo pipefail
test -s dist/index.html
python3 scripts/check_install_copy.py dist
