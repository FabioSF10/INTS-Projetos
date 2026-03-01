# 🌿 ECONOMIA_ENERGIA - Eficiência Energética em Redes Corporativas

Este projeto documenta a estratégia de automação para desligamento de desktops em ambiente de rede hospitalar, visando a redução de custos operacionais e consumo de energia em períodos de inatividade.

## 🚀 O Problema
Em ambientes hospitalares, muitas máquinas permanecem ligadas após o turno devido ao esquecimento. Embora a solução definitiva via GPO (Group Policy Object) esteja em desenvolvimento pela equipe de infraestrutura, este projeto surgiu como uma resposta ágil para implementar a economia de energia de forma imediata em setores mapeados.

## 🛠️ A Solução (Evolução para Agendamento Local)
Após testes com orquestração remota via scripts Batch e PsTools, identificamos que restrições de firewall (RPC/SMB) e latência de rede tornavam o disparo centralizado ineficiente em certas sub-redes.

A solução final adotada utiliza o **Agendador de Tarefas do Windows** disparado via Shell (DWService), garantindo:
1. **Execução Local:** Independência de estabilidade da rede no momento do desligamento.
2. **Privilégios de SYSTEM:** Garantia de execução mesmo com o computador na tela de bloqueio ou sem usuário logado.
3. **Confiabilidade:** Uso de comandos nativos do Windows (`schtasks` e `shutdown`).

## 📋 Implementação via Shell (CLI)
Para aplicar o desligamento em massa sem depender de GPO, utiliza-se os seguintes comandos no terminal de cada máquina (via DWService ou Acesso Remoto):

**1. Criar tarefa de desligamento (Diário às 20:30):**
```cmd
schtasks /create /tn "ECONOMIA_ENERGIA" /tr "shutdown /s /f /t 0" /sc daily /st 20:30 /f /rl highest /ru "SYSTEM"
```
**2. Remover tarefa caso necessário**
```cmd
schtasks /delete /tn "ECONOMIA_ENERGIA" /f
```

## 📂 Estrutura do Repositório
* `README.md`: Documentação completa da estratégia, lições aprendidas e guia de comandos CLI.
* *(A pasta de scripts foi removida por obsolescência técnica, priorizando agora a implementação via comandos nativos de sistema para maior confiabilidade).*


## 🔵 Histórico de Evolução (Changelog)

* **01/03/2026 06:00 - Versão 3.0 (Arquitetura de Contingência Local):**
  * **Pivotagem do Projeto:** O método de disparo remoto (Batch + PsTools) foi descontinuado devido a limitações de segurança de rede (bloqueios de Admin$) e alta latência entre sub-redes.
  * **Implementação Final:** Adotada a criação de tarefas agendadas via conta `SYSTEM`. Esta abordagem eliminou o erro "Access Denied" e garantiu 100% de eficácia nos testes, mesmo em máquinas bloqueadas.

* **01/03/2026 05:00 - Versão 2.0 (Foco em Desligamento Estruturado):**
  * Mudança do foco de suspensão para desligamento direto às 20h30. Identificação de desafios em permissões de domínio e firewall que impediam a orquestração centralizada.

* **01/03/2026 01:30 - Versão 1.5 (Fase de Testes):**
  * Implementação experimental do `msg.exe` e tentativas de alertas interativos. Validação de que, em redes corporativas restritas, o foco deve ser a automação direta em janelas de ociosidade.

* **28/02/2026 22:00 - Versão 1.0 (Prova de Conceito - Sleep Mode):**
  * **Ambiente de Teste:** O script inicial de suspensão (Sleep) obteve 100% de sucesso em testes entre máquinas do setor de T.I. (notebooks técnicos).
  * **Limitação Identificada:** Ao migrar para o ambiente de produção (máquinas assistenciais), o script enfrentou restrições de permissões de energia e políticas de segurança mais rígidas que não se aplicavam aos dispositivos técnicos, exigindo a evolução para o método de desligamento (Shutdown).
