@echo off
cd /d "%~dp0"

:: --- CONFIGURAÇÕES ---
set user=hisa\fabio.figueiredo
set pass=(sua senha amigao)
set target=SMSHDSANOT37
set hora_teste=02:41

echo ==========================================================
echo DISPARO REMOTO - ALVO: %target%
echo Aguardando horario: %hora_teste%
echo EXECUTE COMO ADMINISTRADOR!
echo ==========================================================

:loop
set current_time=%time:~0,5%
if "%current_time:~0,1%"==" " set current_time=0%current_time:~1,4%

if "%current_time%"=="%hora_teste%" goto iniciar
timeout /t 5 /nobreak >nul
goto loop

:iniciar
echo.
echo Horario atingido! Autenticando em %target%...

:: Cria o túnel de autenticação
net use \\%target%\ipc$ /user:%user% %pass% >nul 2>&1

:: 1. ENVIA MENSAGEM REMOTA
echo Enviando mensagem para a tela do colega...
msg /server:%target% * "AVISO INTS: Este PC entrara em economia de energia em 60 segundos. Salve seu trabalho."

:: 2. ESPERA 60 SEGUNDOS (Dando tempo para ele ler)
echo Mensagem enviada. Aguardando 60s para suspender...
timeout /t 60 /nobreak >nul

:: 3. EXECUTA A SUSPENSÃO
echo Suspendendo maquina remota...
.\psshutdown64.exe -x -t 0 -nobanner \\%target%

if %errorlevel% equ 0 (
    echo [OK] Comando concluido com sucesso.
) else (
    echo [ERRO] Falha ao suspender. Verifique se o PC alvo esta bloqueado.
)

:: Limpa rastro de rede
net use \\%target%\ipc$ /delete /y >nul 2>&1
pause