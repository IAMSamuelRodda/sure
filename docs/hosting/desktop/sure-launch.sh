#!/usr/bin/env bash
# Launch Sure finance app via Docker Compose, then open in browser
set -euo pipefail

COMPOSE_FILE="${SURE_COMPOSE_FILE:-$HOME/docker-apps/sure/compose.yml}"
SURE_URL="${SURE_URL:-http://sure.localhost:3000}"

# Start containers if not already running
docker compose -f "$COMPOSE_FILE" up -d 2>&1

# Wait for web container to be healthy (max 30s)
for i in $(seq 1 30); do
    if curl -sf http://localhost:3000 > /dev/null 2>&1; then
        break
    fi
    sleep 1
done

# Open in default browser
xdg-open "$SURE_URL"
