@echo off
echo.
echo   ES . PRICE ACTION . DAILY QUIZ
echo   Starting local server...
echo.
echo   Open your browser to: http://localhost:8765/
echo   (it should open automatically)
echo.
echo   Press Ctrl+C to stop.
echo.
start "" http://localhost:8765/
python -m http.server 8765
