## 🚀 O Problema
Em ambientes hospitalares ou grandes escritórios, muitas máquinas permanecem ligadas após o expediente. Embora a solução via GPO (Group Policy Object) seja o caminho definitivo, ela pode levar tempo para ser implementada por questões burocráticas ou hierárquicas. 

Como técnico de suporte, desenvolvi este projeto para:
1. Antecipar a entrega de valor (economia de energia) para a instituição.
2. Validar a lógica de automação antes da implementação global.
3. Aprofundar meus conhecimentos em scripting e administração de redes.

## 📂 Como Utilizar
Para implementar esta solução em seu ambiente:
1. Copie a pasta `Scripts` para o seu **Disco Local C:\**.
2. No arquivo `pcs.txt`, liste os hostnames dos computadores alvos.
3. No script `Automacao_Energia.bat`, insira as credenciais de rede (`USUARIO` e `SENHA`) e defina o horário de execução desejado.
4. Execute o arquivo `.bat` como **Administrador**.

> **Nota:** O projeto está em constante evolução. Consulte a seção de atualizações para as novidades.

## 🔵 Últimas Atualizações
* **01/03/2026:** Implementação do comando `msg.exe` para permitir que o usuário (ex: médicos em plantão) visualize o aviso e tenha a opção de interagir/cancelar a suspensão caso ainda esteja utilizando a estação. Testes de interatividade validados com sucesso.
