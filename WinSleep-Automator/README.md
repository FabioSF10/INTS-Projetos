## 🚀 O Problema e a Solução
Em ambientes hospitalares ou grandes centros corporativos, o desperdício de energia por máquinas ociosas após o expediente é um desafio financeiro e ambiental. Embora o GPO (Group Policy Object) seja a solução final, processos burocráticos podem atrasar sua implementação.

Como técnico de suporte focado em **Cloud (AWS)** e **Automação**, desenvolvi este orquestrador nativo para:
1. **Entrega de Valor Imediata:** Redução drástica no consumo de energia da instituição.
2. **Escalabilidade:** Processamento de múltiplos ativos de rede em lote (Batch Processing).
3. **Low Overhead:** Solução 100% nativa do Windows, sem dependência de softwares de terceiros.

## 📂 Arquitetura do Projeto
A solução foi desenhada para ser executada de forma centralizada pelo administrador, percorrendo a rede e aplicando as diretivas de desligamento forçado em horários pré-definidos.

### Como Utilizar:
1. **Lista de Ativos:** Crie um arquivo `computadores.txt` na mesma pasta do script e insira os *hostnames* (ex: `SMSHDSANOT37`), um por linha.
2. **Configuração:** No script `Vassoura_Energia.bat`, defina as credenciais de administrador de rede e o horário de execução (ex: `20:30`).
3. **Execução:** Execute o arquivo `.bat` como **Administrador**. O sistema entrará em modo de espera (Idle) e disparará o gatilho no horário programado.

## 🛠️ O Script (Vassoura_Energia.bat)
```batch
@echo off
setlocal enabledelayedexpansion

:: Config
