@echo off
setlocal

set PROJECT_DIR=C:\Users\mathe\OneDrive\Desktop\ESTUDOS\Engenharia de Software\godziny\Godziny_APP
set FRONTEND_DIR=%PROJECT_DIR%\front-end

cd /d "%FRONTEND_DIR%"

if exist node_modules (
    echo As dependências já estão instaladas. Iniciando o frontend...
) else (
    echo Dependências não encontradas. Instalando dependências com npm...
    npm install

    :: Verifique se o npm install foi executado com sucesso
    if %ERRORLEVEL% NEQ 0 (
        echo Erro durante a instalação das dependências. Verifique o arquivo npm-install.log para mais detalhes.
        pause
        exit /b %ERRORLEVEL%
    )
)

echo Iniciando o frontend com npm run serve...
npm run serve

pause
