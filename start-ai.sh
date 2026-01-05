#!/bin/bash
# Start only the AI service

cd ../AI || { echo "[ERROR] AI directory not found."; exit 1; }
pip install -r requirements.txt
python3 main.py
