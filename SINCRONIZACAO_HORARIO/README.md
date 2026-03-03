# 🕒 Sincronizador de Horário "Flash" - Infraestrutura INTS

Este projeto documenta o método de **Sincronização Manual Acelerada** via interface Web e DWService, desenvolvido para garantir 100% de eficácia em cenários onde protocolos automáticos (NTP) são bloqueados pela rede hospitalar.

## 🚀 Acesso à Ferramenta
Para agilizar o processo de cópia do comando, utilize o link abaixo:

🔗 **[Abrir Sincronizador de Horário (Clique Aqui)](SINCRONIZACAO_HORARIO/horario.html)**
*(Nota: Se o GitHub Pages estiver ativo, utilize o link da URL pública para maior agilidade)*

## 🎯 Objetivo
Corrigir o atraso de relógios em desktops de forma instantânea, garantindo que o prontuário eletrônico (MV) opere com precisão de segundos, eliminando erros persistentes de serviço do Windows como o 1058 e 1072.

## 🛠️ Fluxo de Trabalho (Workflow)
A solução utiliza uma **SPA (Single Page Application)** para gerar comandos de sistema em tempo real:

1. **Geração:** O técnico mantém o `horario.html` aberto;
2. **Cópia:** Um clique no botão gera e copia o comando `time HH:MM:SS` com o tempo exato;
3. **Aplicação:** O comando é colado diretamente no **Shell do DWService** da máquina destino.

## 💻 Comandos Auxiliares

### Ajuste Manual Direto
Caso não possa acessar a ferramenta web, digite no terminal:
```cmd
time HH:MM:SS
