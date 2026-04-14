#!/bin/bash
set -Eeuo pipefail

# 项目目录（脚本在 scripts/ 下，父目录即为项目根目录）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"

cd "${PROJECT_DIR}"

echo "Working directory: $(pwd)"
echo "Installing dependencies..."
pnpm install --prefer-frozen-lockfile --prefer-offline --loglevel debug --reporter=append-only
