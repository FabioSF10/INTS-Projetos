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


## 🔵 Últimas Atualizações
* **01/03/2026 01h30:** Implementação do comando `msg.exe` para permitir que o usuário (ex: médicos em plantão) visualize o aviso e tenha a opção de interagir/cancelar a suspensão caso ainda esteja utilizando a estação. Testes de interatividade validados com sucesso.

* ## 🔵 Últimas Atualizações
* **01/03/2026 04h30:** Não deu certo a questão de aviso para o usuário remotamente, foi decidido junto com meu colega de trabalho Gilberto que o mais importante é que as máquinas desliguem (não hibernem) às 20h30, horario este que não há mais pessoas no hospital. A tentativa de criar opções de mecher no mouse caso haja alguém, são questões que somente com GPO será possivel, entretanto podemos adiantar o caso desligando nas máquinas CORRETAS neste horario e assim faremos, 
