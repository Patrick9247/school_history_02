#!/bin/bash
set -Eeuo pipefail

# 项目目录（脚本在 scripts/ 下，父目录即为项目根目录）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"

PORT=5000
DEPLOY_RUN_PORT="${DEPLOY_RUN_PORT:-$PORT}"

start_service() {
    cd "${PROJECT_DIR}"
    echo "Working directory: $(pwd)"
    echo "Starting HTTP service on port ${DEPLOY_RUN_PORT} for deploy..."
    PORT=${DEPLOY_RUN_PORT} node dist/server.js
}

echo "Starting HTTP service on port ${DEPLOY_RUN_PORT} for deploy..."
start_service
