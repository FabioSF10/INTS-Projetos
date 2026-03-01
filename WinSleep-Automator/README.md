# 🌿 WinSleep Automator - Eficiência Energética em Redes Corporativas

Este projeto foi desenvolvido para automatizar a suspensão (Modern Standby/Hibernação) de notebooks e desktops em ambiente de rede local (Active Directory), visando a redução de custos operacionais e consumo de energia em períodos de inatividade.

## 🚀 O Problema
Em ambientes hospitalares ou grandes escritórios, muitas máquinas permanecem ligadas após o turno de trabalho devido ao esquecimento ou processos de atualização pendentes. O processo via GPO é possivel, mas esta em andamento ainda, porém como não tenho acesso, consigo me adiantar na criação deste projeto até que o analista de Infra estrutura crie a solução via GPO. É bom para meu aprendizado e pode ajudar mais pessoas caso precisem.

## 🛠️ A Solução
Um script de automação em **Batch (Windows)** que utiliza a suíte **PsTools (PsShutdown)** e comandos nativos de mensagens (**msg.exe**) para:
1. Validar horários de inatividade.
2. Alertar o usuário logado com um aviso pop-up (permitindo cancelamento manual).
3. Forçar a suspensão segura do hardware remotamente.

## 📋 Pré-requisitos
* Arquivo `pcs.txt` na raiz da pasta com o nome das máquinas.

## 📂 Estrutura do Repositório
* `Automacao_Energia.bat`: Script principal de controle de horários e disparos.
* `pcs.txt`: Lista de computadores alvos (Hostname).
* O arquivo encontra-se nesta pasta chamado Scripts, terá sempre atualizações, o projeto esta em andamento.

## ⚠️ Segurança
**Atenção:** Por questões de segurança, as variáveis de `USUARIO` e `SENHA` foram removidas do script principal. Antes de utilizar, preencha as credenciais em seu ambiente local.


## 🔵 Histórico de Evolução (Changelog)

* **01/03/2026 05:00 - Versão 2.0 (Foco em Desligamento Estruturado):**
  * Identificamos restrições de segurança para alertas remotos. Em conjunto com a equipe (Gilberto), mudamos o foco para desligamento direto às 20h30, garantindo eficácia total no período de ociosidade do hospital. Esta versão antecipa a economia de energia enquanto a GPO definitiva é processada, focando em máquinas previamente mapeadas.

* **01/03/2026 01:30 - Versão 1.5 (Fase de Testes):**
  * Implementação experimental do `msg.exe` e tentativas de alertas interativos. Validação de que, em redes corporativas travadas, o foco deve ser a automação direta em janelas de manutenção ociosas.
