#!/bin/bash
# Start only the Frontend service

cd ../Frontend || { echo "[ERROR] Frontend directory not found."; exit 1; }
npm install
npm run dev
