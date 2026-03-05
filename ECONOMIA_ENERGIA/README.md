# 🚀 Sistema de Economia de Energia - INTS

![Versão](https://img.shields.io/badge/vers%C3%A3o-4.0.0-green)
![Autor](https://img.shields.io/badge/autor-Fabio%20Stefano-blue)

Este projeto foi desenvolvido para otimizar o consumo de energia no hospital INTS...


Este documento descreve a estratégia de automação para o desligamento programado de desktops, visando a redução do consumo de energia e a preservação do hardware em períodos de inatividade operacional no hospital INTS.

## Objetivo
Otimizar o consumo energético através da automação do desligamento das máquinas que não operam em regime 24h. Esta medida atua como uma solução ágil e segura enquanto as políticas definitivas de GPO estão em fase de homologação pela infraestrutura.

## Implementação Técnica
A solução utiliza o **Agendador de Tarefas do Windows** para garantir a execução local do comando com máxima confiabilidade.

**Diferenciais desta abordagem:**
* **Autonomia:** O comando é executado localmente pelo sistema operacional, com configuração remota simplificada via **DWService**.
* **Consistência:** A tarefa é disparada mesmo se o computador estiver na tela de bloqueio ou sem usuário logado.
* **Segurança:** Utiliza comandos nativos do Windows (`schtasks`), sem necessidade de softwares de terceiros.

## Comandos para Configuração

Para aplicar o agendamento em máquinas mapeadas:
1. Acesse o **DWService** (previamente configurado nas máquinas do hospital);
2. Realize o login e acesse a máquina de interesse;
3. Utilize o recurso **Shell** para inserir os comandos abaixo:

<img width="353" height="284" alt="image" src="https://github.com/user-attachments/assets/b7573edc-d441-47f9-a505-5b39f7e75fff" />

**1. Criar agendamento (Diário às 20:30):**
Ao entrar na linha de comando da maquina copiar o codigo abaixo e colar usando o mouse e da Enter:
```cmd
schtasks /create /tn "ECONOMIA_ENERGIA" /tr "shutdown /s /f /t 0" /sc daily /st 20:30 /f /rl highest /ru "SYSTEM"

```

**2. Remover tarefa caso necessário**
```cmd
schtasks /delete /tn "ECONOMIA_ENERGIA" /f
```


## 🔵 Histórico de Evolução (Changelog)

* **01/03/2026 06:00 - Versão 3.0 (Mudança de estratégia):**
  * O método de disparo remoto .bat foi descontinuado devido a limitações de segurança de rede (bloqueios de Admin$) e alta latência entre sub-redes.
  * **Implementação Final:** Adotada a criação de tarefas agendadas via DWService. Esta abordagem eliminou o erros  e garantiu 100% de eficácia nos testes, mesmo em máquinas bloqueadas.

* **01/03/2026 05:00 - Versão 2.0 (Foco em Desligamento):**
  * Mudança do foco de "modo dormir" para "desligamento direto" às 20h30. Identificação de desafios em permissões de domínio e firewall que não permitia modo dormir. Ao tentar executar .Bat em modo "Desligar" nos computadores da recepção, tivemos problemas de lentidão na execução. Funcionou, mas levava muito tempo para desligar máquina por máquina, o que não é viavel.

* **01/03/2026 01:30 - Versão 1.5 (Teste de botão de cancelamento):**
  * Foi realizado a tentativa de implementar uma mensagem de cancelar modo dormir. O botão de cancelar não funcionou, sendo assim, a opção é de simplesmente desligar ou entrar em modo sleep sem possibilidade de cancelamento via botão.

* **28/02/2026 22:00 - Versão 1.0 (Criado arquivo .bat para modo Sleep):**
  * **Ambiente de Teste:** Foi criado um arquivo .bat de suspensão (Sleep) obteve 100% de sucesso em testes entre máquinas do setor de T.I. (notebooks técnicos).

