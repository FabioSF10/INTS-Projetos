# 🚀 Sistema de Economia de Energia - INTS

![Versão](https://img.shields.io/badge/vers%C3%A3o-4.0.0-green)
![Autor](https://img.shields.io/badge/autor-Fabio%20Stefano-blue)
![Licença](https://img.shields.io/badge/license-MIT-important)

Este projeto foi desenvolvido para otimizar o consumo de energia no hospital INTS através do desligamento programado de desktops, visando a redução de custos e preservação de hardware.

## 🌟 Novidade: Versão 4.0 (Instalador Visual)
A nova versão abandonou a linha de comando manual e agora conta com uma interface amigável (`.hta`) que automatiza todo o processo de configuração, garantindo que o sistema seja instalado corretamente no diretório padrão `C:\`.

### 📦 Como Instalar:

1.  **Download:** Baixe o arquivo **[Desligamento_Inteligente_INTS.zip](https://github.com/FabioSF10/INTS-Projetos/raw/refs/heads/main/ECONOMIA_ENERGIA/Economia_de_energia_descompactar_tudo.zip)**.
2.  **Extração:** **IMPORTANTE:** Extraia o conteúdo do ZIP para uma pasta (Downloads ou Desktop). Não execute os arquivos diretamente de dentro do ZIP.
   <img width="440" height="362" alt="image" src="https://github.com/user-attachments/assets/061a1e29-5687-45fd-b019-b69113476356" />

3.  **Execução:** Clique duas vezes no atalho **"✅ CLIQUE AQUI PARA INSTALAR"** (Ícone Verde).
   <img width="562" height="313" alt="image" src="https://github.com/user-attachments/assets/0c62a6b3-facc-493b-9172-5e0c2e1f0c9b" />

4.  **Permissão de Administrador (UAC):** Uma janela do Windows aparecerá perguntando se deseja permitir que o "Host de Aplicativo HTML" faça alterações. Clique em **SIM**.
    > *Essa permissão é obrigatória para que o instalador consiga criar o agendamento de desligamento no sistema.*
<img width="701" height="380" alt="image" src="https://github.com/user-attachments/assets/14e2f256-5660-4a8d-a048-3349a6bd10a6" />

5.  **Configuração:** O sistema moverá os arquivos para o `C:\` e abrirá a interface visual. Defina o horário desejado e clique em **INSTALAR / ATUALIZAR**.
   <img width="215" height="267" alt="image" src="https://github.com/user-attachments/assets/7c936c5f-1229-4f59-a07a-2952f24cdba8" />


---

### 🛡️ Confirmação de Instalação
Após o passo 4, uma mensagem confirmará que os arquivos foram movidos com sucesso. A pasta original de download ficará apenas com um arquivo de texto informativo e poderá ser apagada para manter a organização da máquina.

---

### 💡 Dicas de Suporte
* **Diretório Padrão:** O sistema opera sempre a partir de `C:\Desligamento_Inteligente`.
* **Desinstalação:** Para remover o agendamento e os arquivos, abra a interface e clique no botão de desinstalação.

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
