@echo off
setlocal enabledelayedexpansion

:: 1. VERIFICA ADMIN
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /B
)

:: --- IDENTIFICA ONDE O ARQUIVO ESTÁ RODANDO ---
pushd "%~dp0"
set "PASTA_ATUAL=%cd%"
set "DESTINO=C:\INTS_Energy"

:: 2. VERIFICAÇÃO INTELIGENTE: SE JÁ ESTIVER NO C:\ SÓ ABRE O HTA
if /i "%PASTA_ATUAL%"=="%DESTINO%" (
    goto :ABRIR_SISTEMA
)

:: 3. SE NÃO ESTIVER NO C:\, ELE REALIZA A INSTALAÇÃO
if not exist "%DESTINO%" mkdir "%DESTINO%"

echo Instalando arquivos e manuais...
xcopy /y /e /i /h /c "%~dp0*" "%DESTINO%\" >nul

:: MENSAGEM DE SUCESSO (Apenas na primeira instalação)
echo m1 = "SISTEMA INSTALADO COM SUCESSO!" > "%temp%\ints_msg.vbs"
echo m2 = "Os arquivos e o Manual PDF foram movidos para C:\INTS_Energy." >> "%temp%\ints_msg.vbs"
echo m3 = "O tecnico ja pode excluir esta pasta e seguir com o Setup." >> "%temp%\ints_msg.vbs"
echo MsgBox m1 ^& vbCrLf ^& vbCrLf ^& m2 ^& vbCrLf ^& vbCrLf ^& m3, 64, "INTS Energy Control v5.0" >> "%temp%\ints_msg.vbs"

wscript.exe "%temp%\ints_msg.vbs"
del "%temp%\ints_msg.vbs"

:ABRIR_SISTEMA
:: 4. ABRE O HTA (Sempre abre, seja instalação nova ou apenas execução)
start "" "mshta.exe" "C:\INTS_Energy\Setup_INTS_Energy.hta"

popd
exit