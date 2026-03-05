# 🚀 Sistema de Economia de Energia - INTS

![Versão](https://img.shields.io/badge/vers%C3%A3o-4.0.0-green)
![Autor](https://img.shields.io/badge/autor-Fabio%20Stefano-blue)
![Licença](https://img.shields.io/badge/license-MIT-important)

Este projeto foi desenvolvido para otimizar o consumo de energia no hospital INTS através do desligamento programado de desktops, visando a redução de custos e preservação de hardware.

## 🌟 Novidade: Versão 4.0 (Instalador Visual)
A nova versão abandonou a linha de comando manual e agora conta com uma interface amigável (`.hta`) que automatiza todo o processo de configuração, garantindo que o sistema seja instalado corretamente no diretório padrão `C:\`.

### 📦 Como Instalar:
1. Baixe o arquivo **[Desligamento_Inteligente_INTS.zip]([https://github.com/FabioStefano/Desligamento_Inteligente/raw/main/Desligamento_Inteligente_INTS.zip](https://github.com/FabioSF10/INTS-Projetos/raw/refs/heads/main/ECONOMIA_ENERGIA/Desligamento_Inteligente_INTS.zip))**.
2. Extraia o conteúdo em qualquer pasta (ex: Downloads ou Desktop).
3. Execute o atalho **"INSTALAR - ECONOMIA DE ENERGIA INTS"** (ícone de relógio).
4. O instalador moverá os arquivos automaticamente para o `C:\` e abrirá a interface de configuração.
5. Defina o horário desejado e clique em **INSTALAR / ATUALIZAR**.

---

## 🛠️ Implementação Técnica
A solução utiliza uma tríade de tecnologias nativas do Windows para máxima compatibilidade sem softwares de terceiros:
* **Interface (HTA/JS):** Front-end interativo para configuração do horário.
* **Monitoramento (BAT):** Script em loop de 20s que verifica o horário do sistema e do arquivo `config.txt`.
* **Execução Silenciosa (VBS):** Garante que o monitoramento rode em segundo plano, sem janelas pretas atrapalhando o usuário.

---

## 🔵 Histórico de Evolução (Changelog)

* **05/03/2026 05:00 - Versão 4.0 (Instalador Inteligente & Interface Visual):**
  * **Nova Estratégia:** Substituição dos comandos manuais via Shell/DWService por um pacote instalador completo.
  * **Automatização:** Criado script `instalar_automatico.bat` que padroniza a instalação no `C:\` e limpa os arquivos temporários da pasta de origem.
  * **Interface:** Implementada interface HTA com auto-elevação de privilégios e opção de desinstalação completa.
  * **Invisibilidade:** O processo de monitoramento agora é 100% oculto para o usuário final.

* **01/03/2026 06:00 - Versão 3.0 (Mudança de estratégia):**
  * O método de disparo remoto via rede foi descontinuado devido a limitações de segurança.
  * Adotada a criação de tarefas agendadas via Shell no DWService.

* **01/03/2026 05:00 - Versão 2.0 (Foco em Desligamento):**
  * Mudança do foco de "modo dormir" para "desligamento direto" devido a limitações de GPO e Hardware.

* **28/02/2026 22:00 - Versão 1.0 (Protótipo em .bat):**
  * Criação do primeiro script de suspensão testado em ambiente controlado (T.I.).

---

## ⚖️ Licença
Este projeto está sob a licença MIT - Veja o arquivo [LICENSE](LICENSE) para detalhes.
