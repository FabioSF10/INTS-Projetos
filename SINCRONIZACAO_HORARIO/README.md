# 🕒 Projeto: Sincronização de Horário (NTP) via Shell

Este repositório documenta a padronização dos relógios das estações de trabalho do hospital. Horários dessincronizados causam erros críticos em logs de auditoria, sistemas de prontuário (MV) e autenticação de rede.

## 📌 O Problema
Identificamos divergências de horário entre as recepções, o que impacta diretamente na precisão dos registros de atendimento. Como alternativa à GPO, utilizei o **DWService (Shell)** para uma intervenção imediata e centralizada.

## ⚙️ Implementação via Terminal (CMD/PowerShell)

Para forçar a sincronização de uma máquina com os servidores oficiais do **NTP.br**, utilizei a seguinte sequência de comandos:

```cmd
:: Define o servidor de tempo brasileiro como referência
w32tm /config /manualpeerlist:"a.ntp.br,0x1 b.ntp.br,0x1" /syncfromflags:manual /reliable:YES /update

:: Reinicia o serviço para aplicar as configurações
net stop w32time && net start w32time

:: Força a sincronização imediata do relógio
w32tm /resync
