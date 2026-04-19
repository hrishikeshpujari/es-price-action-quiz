#!/bin/bash
# ES Price Action Quiz — Local Launcher
# Double-click this file (or run it in Terminal) to start the quiz
# Requires: Python 3 (pre-installed on all Macs)

PORT=8765
DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "  ╔══════════════════════════════════╗"
echo "  ║   ES · PRICE ACTION · DAILY QUIZ  ║"
echo "  ╚══════════════════════════════════╝"
echo ""
echo "  Starting local server on port $PORT..."
echo "  Opening quiz in your browser..."
echo ""
echo "  ▶ Visit: http://localhost:$PORT"
echo ""
echo "  Press Ctrl+C to stop the server."
echo ""

# Kill anything already on this port
lsof -ti:$PORT | xargs kill -9 2>/dev/null

# Open browser after a short delay
(sleep 1.2 && open "http://localhost:$PORT/") &

# Start Python server
cd "$DIR"
python3 -m http.server $PORT
