# Remover Usuários Antigos

Ferramenta desenvolvida em **PowerShell** para auxiliar equipes de T.I. na identificação e remoção segura de perfis de usuários inativos em computadores Windows.

O projeto surgiu da necessidade de liberar espaço em disco em computadores compartilhados, onde diversos perfis de usuários podem permanecer armazenados mesmo após longos períodos sem utilização.

## 🎯 Objetivo

Automatizar a identificação de perfis locais sem uso há mais de **90 dias**, reduzindo a necessidade de analisar e excluir manualmente pastas dentro de `C:\Users`.

A exclusão manual de uma pasta não é o método ideal para remover um perfil do Windows, pois:

- As datas apresentadas nas pastas de `C:\Users` não representam necessariamente o último login do usuário;
- O perfil pode continuar registrado no Windows mesmo após a exclusão da pasta;
- Podem permanecer referências associadas ao SID e ao `ProfileList`;
- Existe maior risco de remover um perfil incorreto ou que esteja sendo utilizado.

## ⚙️ Como funciona

O script utiliza o `Win32_UserProfile` para identificar os perfis registrados no Windows.

Para determinar a idade do perfil, são consultadas informações do registro em:

```text
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList
```

São utilizados os registros de carga e descarga do perfil (`LocalProfileLoadTime` e `LocalProfileUnLoadTime`) para auxiliar na identificação de perfis que ultrapassaram o período definido de inatividade.

Antes de qualquer exclusão, o script realiza diversas verificações de segurança.

## 🛡️ Proteções implementadas

O programa:

- Ignora perfis especiais do Windows;
- Não remove perfis atualmente carregados;
- Possui uma lista de contas protegidas;
- Separa perfis sem uma data confiável para revisão manual;
- Exibe os perfis identificados antes da remoção;
- Solicita confirmação do operador antes de executar a exclusão;
- Realiza uma nova verificação antes de remover cada perfil;
- Utiliza `Remove-CimInstance` com `Win32_UserProfile` para solicitar ao Windows a remoção do perfil;
- Registra o resultado da execução em arquivo de log.

## 📊 Progresso e espaço em disco

Antes da limpeza, a ferramenta calcula o tamanho dos perfis selecionados.

Durante o processo são apresentadas informações como:

- Perfil atualmente processado;
- Quantidade total de perfis;
- Tamanho estimado dos perfis;
- Volume já processado;
- Percentual de progresso;
- Tempo decorrido;
- Estimativa aproximada de tempo restante.

Ao finalizar, são exibidos:

```text
Perfis processados
Volume processado
Tempo total
Espaço livre antes
Espaço livre depois
Espaço recuperado
```

> A estimativa de tempo é aproximada. Perfis com muitos arquivos pequenos podem levar mais tempo para serem removidos do que perfis de tamanho semelhante contendo poucos arquivos grandes.

## 🚀 Utilização

1. Copie a pasta completa do projeto para o computador que será analisado.
2. Execute o arquivo:

```text
CLIQUE AQUI - Limpar Perfis Antigos.bat
```

3. Autorize a execução como **Administrador**.
4. Analise a relação de perfis apresentada pelo programa.
5. Confirme quais perfis poderão ser removidos.
6. Revise cuidadosamente a lista final.
7. Para autorizar a exclusão, digite:

```text
APAGAR
```

O arquivo `.bat` é responsável por iniciar o PowerShell com os parâmetros necessários e executar o script principal:

```text
Arquivo do Sistema - Nao Alterar.ps1
```

## 📝 Logs

Após uma limpeza, um arquivo de log é criado em:

```text
C:\TI\Logs
```

O log registra informações como computador, data da execução, perfis removidos, perfis bloqueados, erros encontrados e outras informações do processo.

## ⚠️ Importante

Esta ferramenta realiza **exclusão de perfis de usuário e seus respectivos dados locais**.

Antes de utilizá-la em ambiente corporativo ou de produção:

- Revise a lista de contas protegidas;
- Valide o período de inatividade configurado;
- Verifique se existem arquivos locais que precisam ser preservados;
- Teste a ferramenta em ambiente controlado;
- Execute somente com autorização administrativa.

A ferramenta possui mecanismos para reduzir o risco de exclusões indevidas, porém a validação do operador continua sendo necessária.

## 💡 Motivação do projeto

A primeira abordagem considerada foi utilizar informações comuns, como datas das pastas dos usuários e `LastUseTime`.

Durante os testes, foi identificado que essas informações poderiam apresentar datas que não correspondiam ao uso real de determinados perfis.

A partir disso, a lógica foi aprimorada para consultar informações do `ProfileList` do Windows e adicionar múltiplas etapas de validação antes da exclusão.

Esse processo transformou uma tarefa manual e suscetível a erros em um procedimento mais padronizado, rastreável e seguro.

## 🖥️ Tecnologias utilizadas

- PowerShell
- Windows Management Instrumentation / CIM
- `Win32_UserProfile`
- Windows Registry
- Batch Script
- Windows PowerShell

## 📌 Requisitos

- Windows 10 ou Windows 11;
- Windows PowerShell 5.1 ou superior;
- Permissões de Administrador.

## 👨‍💻 Autor

**Fabio Stefano**

Projeto desenvolvido como iniciativa de automação de rotinas de suporte e infraestrutura de T.I.
