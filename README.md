# 🌿 WinSleep Automator - Eficiência Energética em Redes Corporativas

Este projeto foi desenvolvido para automatizar a suspensão (Modern Standby/Hibernação) de notebooks e desktops em ambiente de rede local (Active Directory), visando a redução de custos operacionais e consumo de energia em períodos de inatividade.

## 🚀 O Problema
Em ambientes hospitalares ou grandes escritórios, muitas máquinas permanecem ligadas após o turno de trabalho devido ao esquecimento ou processos de atualização pendentes. O acesso via GPO (Group Policy Object) nem sempre está disponível de imediato para o nível de suporte técnico operacional.

## 🛠️ A Solução
Um script de automação em **Batch (Windows)** que utiliza a suíte **PsTools (PsShutdown)** e comandos nativos de mensagens (**msg.exe**) para:
1. Validar horários de inatividade.
2. Alertar o usuário logado com um aviso pop-up (permitindo cancelamento manual).
3. Forçar a suspensão segura do hardware remotamente.

## 📋 Pré-requisitos
* [PsTools da Microsoft](https://learn.microsoft.com/en-us/sysinternals/downloads/pstools) (psshutdown64.exe).
* Permissão de Administrador Local/Rede.
* Arquivo `pcs.txt` na raiz da pasta com o nome das máquinas.

## 📂 Estrutura do Repositório
* `Automacao_Energia.bat`: Script principal de controle de horários e disparos.
* `pcs.txt`: Lista de computadores alvos (Hostname).
* `psshutdown64.exe`: Executável da Sysinternals utilizado.

## ⚠️ Segurança
**Atenção:** Por questões de segurança, as variáveis de `USUARIO` e `SENHA` foram removidas do script principal. Antes de utilizar, preencha as credenciais em seu ambiente local. **Nunca suba suas senhas reais para o GitHub.**

## 👤 Autor
**Fabio Stefano de Figueiredo**
*Suporte Técnico de T.I. focado em Cloud Computing (AWS)*
