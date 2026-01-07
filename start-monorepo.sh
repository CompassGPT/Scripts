#!/bin/bash
# Start all services in the monorepo using Docker Compose (if available)
# or fallback to npm scripts for Backend and Frontend

set -e

# Check if Docker Compose file exists
if [ -f "docker-compose.dev.yml" ]; then
  echo "[INFO] Starting all services with Docker Compose (Development mode)..."
  docker compose -f docker-compose.dev.yml up -d
  exit $?
fi

# Fallback: Start Backend and Frontend with npm

# Start Backend
if [ -d "../Backend" ]; then
  echo "[INFO] Starting Backend with npm..."
  (cd ../Backend && npm install && npm run start:dev &)
else
  echo "[WARN] Backend directory not found."
fi

# Start Frontend
if [ -d "../Frontend" ]; then
  echo "[INFO] Starting Frontend with npm..."
  (cd ../Frontend && npm install && npm run dev &)
else
  echo "[WARN] Frontend directory not found."
fi

# Start AI (if Python main.py exists)
if [ -d "../AI" ] && [ -f "../AI/main.py" ]; then
  echo "[INFO] Starting AI service with Python..."
  (cd ../AI && pip install -r requirements.txt && python3 main.py &)
else
  echo "[WARN] AI directory or main.py not found."
fi

echo "[INFO] All available services started."
wait
