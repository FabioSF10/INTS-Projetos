@echo off
title Limpeza de Perfis Antigos
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0LimparPerfisAntigos.ps1"
pause