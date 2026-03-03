# 🕒 Sincronizador de Horário "Flash" - Infraestrutura INTS

Este projeto documenta o método de **Sincronização Manual Acelerada** via interface Web e DWService, desenvolvido para garantir 100% de eficácia em cenários onde protocolos automáticos (NTP) são bloqueados pela rede.

## 🎯 Objetivo
Corrigir o atraso de relógios em desktops de forma instantânea, garantindo que o prontuário eletrônico (MV) e os logs do hospital operem com precisão de segundos, eliminando erros de serviço do Windows (1058 e 1072).

## 🚀 Implementação Técnica (Workflow)
A solução utiliza uma **Single Page Application (SPA)** desenvolvida em HTML/JS para gerar comandos de sistema em tempo real.

**Fluxo de Execução:**
1. **Geração:** O técnico mantém o `horario.html` aberto (via GitHub Pages ou local).
2. **Cópia:** Um clique no botão gera e copia o comando `time HH:MM:SS` com o tempo exato do notebook.
3. **Aplicação:** O comando é colado diretamente no **Shell do DWService** da máquina destino.

## 🛠️ Comandos de Suporte

### Ajuste Manual (Via Interface Web)
Acesse a ferramenta e utilize o botão de cópia para o comando:
```cmd
time HH:MM:SS
