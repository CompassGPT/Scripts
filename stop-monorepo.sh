#!/bin/bash
# Stop all services started by start-monorepo.sh

# Stop Docker Compose if running
if [ -f "../docker-compose.yml" ]; then
  echo "[INFO] Stopping all services with Docker Compose..."
  docker compose -f ../docker-compose.yml down
  exit $?
fi

# Fallback: Kill npm and Python processes for Backend, Frontend, and AI
pkill -f "npm run start:dev" || true
pkill -f "npm run dev" || true
pkill -f "python3 main.py" || true

echo "[INFO] All services stopped."
