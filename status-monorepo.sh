#!/bin/bash
# Show status of all main services (Docker, Backend, Frontend, AI)

if [ -f "../docker-compose.yml" ]; then
  echo "[INFO] Docker Compose status:"
  docker compose -f ../docker-compose.yml ps
else
  echo "[INFO] Checking npm and Python processes..."
  echo "--- Backend (npm run start:dev) ---"
  pgrep -fl "npm run start:dev" || echo "Not running."
  echo "--- Frontend (npm run dev) ---"
  pgrep -fl "npm run dev" || echo "Not running."
  echo "--- AI (python3 main.py) ---"
  pgrep -fl "python3 main.py" || echo "Not running."
fi
