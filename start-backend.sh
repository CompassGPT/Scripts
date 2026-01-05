#!/bin/bash
# Start only the Backend service

cd ../Backend || { echo "[ERROR] Backend directory not found."; exit 1; }
npm install
npm run start:dev
