@echo off
setlocal

cd app-godziny-backend\godziny

:: Verifique se o JAR já foi construído
if exist target\godziny-0.0.1-SNAPSHOT.jar (
    echo O arquivo JAR já existe. Iniciando o backend...
) else (
    echo Construindo o backend com Maven...
    mvn clean package

    :: Verifique se o Maven foi executado com sucesso
    if %ERRORLEVEL% NEQ 0 (
        echo Erro durante a construção. Verifique o arquivo build.log para mais detalhes.
        pause
        exit /b %ERRORLEVEL%
    )
)

:: Inicie o backend
echo Iniciando o backend...
java -jar target\godziny-0.0.1-SNAPSHOT.jar

:: Mantenha o terminal aberto
pause
