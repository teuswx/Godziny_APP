@echo off
setlocal

set PROJECT_DIR=C:\Users\mathe\OneDrive\Desktop\ESTUDOS\Engenharia de Software\godziny\Godziny_APP
set DASHBOARD_DIR=%PROJECT_DIR%\dashboard

cd /d "%DASHBOARD_DIR%"

echo Iniciando o dashboard com python...
python consulta.py

pause