# 🕒 Sincronização de Horário - Automação INTS
Este documento descreve a estratégia de sincronização de relógios nos desktops do hospital, garantindo a precisão necessária para os registros no sistema MV.

## 📌 O Problema
Corrigir atrasos nos relógios das estações de trabalho de forma ágil, contornando bloqueios de rede ou falhas de bateria (CMOS).

## ⚙️ Implementação via Terminal (CMD/PowerShell)

A solução utiliza WMI (Windows Management Instrumentation) para disparar o ajuste de hora remotamente em massa, garantindo que todos os PCs operem no mesmo minuto simultaneamente.

## Comandos para Configuração
1. Ajuste em Massa (Executar no PowerShell do Notebook Técnico)
Copie o código abaixo, ajuste os nomes dos PCs e o horário, e execute:

```cmd
$PCs = @("SMSHDSATPC03", "SMSHDSATPC04", "SMSHDSATPC05")
$Horario = "05:30"

foreach ($PC in $PCs) {
    Write-Host "Ajustando horário no $PC..." -ForegroundColor Cyan
    Invoke-WmiMethod -ComputerName $PC -Class Win32_Process -Name Create -ArgumentList "cmd.exe /c time $Horario"
}
```

2. Correção Individual (Via Shell DWService)
Caso precise forçar manualmente em uma única máquina:
```cmd
time 05:30
```

## 🔵 Histórico de Evolução (Changelog)

* **03/03/2026 05h- Versão 2.0 (Ajuste Remoto em Massa):**
  * Implementação de script PowerShell por um usuário administrador.  * 

* **03/03/2026 3h30 - Versão 1.0 (Tentativa de Sincronização NTP)**
  * Testes com servidores a.ntp.br e domhier. Método descontinuado em alguns setores devido a bloqueios de porta e instabilidade de rede.  * 

