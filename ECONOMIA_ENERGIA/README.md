# 🚀 Sistema de Economia de Energia - INTS (v5.0)

![Versão](https://img.shields.io/badge/vers%C3%A3o-5.0.0-green)
![Autor](https://img.shields.io/badge/autor-Fabio%20Stefano-blue)
![Licença](https://img.shields.io/badge/license-MIT-important)

O **INTS Energy Control** é uma solução profissional para otimizar o consumo de energia no hospital. Ele automatiza o desligamento de desktops fora do horário operacional, preservando o hardware e reduzindo custos.

## 🌟 O que há de novo na Versão 5.0?
* **Instalador Maestro:** Agora o processo é 100% automático e invisível.
* **Motor em Python:** Monitoramento mais robusto e leve.
* **Auto-Instalação no C:\:** O sistema organiza seus próprios arquivos para evitar deleções acidentais.
* **Manual em PDF Integrado:** Documentação técnica movida junto com o sistema.

---

## 📦 Como Instalar (Passo a Passo)

### 1. Download
Baixe o instalador no link:
👉 **[BAIXAR Instalador_INTS_ENERGY.exe](https://github.com/FabioSF10/INTS-Projetos/raw/refs/heads/main/ECONOMIA_ENERGIA/Instalador_INTS_ENERGY.exe
)**

### 2. Execução 
*Execute o programa e ele irá iniciar sozinho*
* Se o Windows pedir permissão de Administrador. Clique em **SIM**.
* Aguarde a mensagem de confirmação: *"SISTEMA INSTALADO COM SUCESSO"*.
* <img width="900" alt="image" src="https://github.com/user-attachments/assets/15b4744e-a29a-4b15-b207-3e4dcd6b17a8" />

### 3. Configuração Final
Após o "OK", a tela de configuração (Setup) abrirá automaticamente:
1.  Defina o **Horário de Desligamento**.
2.  Ajuste o **Tempo de Aviso** e **Adiamento**.
3.  Clique em **INSTALAR/ATUALIZAR**.
<img width="215" height="333" alt="image" src="https://github.com/user-attachments/assets/4ea9d4e8-db37-4998-8f3a-2c179df67490" />


Como os arquivos foram movidos à pasta "C:\INTS_Energy", então lá você encontrará o executável, caso vá desinstalar ou atualizar.

---

## 📂 O que acontece após a instalação?
* **Pasta Segura:** Todos os arquivos são movidos para `C:\INTS_Energy`.
* **Limpeza:** Você já pode apagar a pasta que baixou (Downloads/Desktop) para manter o computador limpo.
* **Persistência:** O sistema cria tarefas agendadas no Windows que garantem o funcionamento após cada reinicialização.

---

## 🛠️ Detalhes Técnicos
A solução utiliza uma estrutura híbrida para máxima eficiência:
* **Core:** Motor de monitoramento desenvolvido em **Python**.
* **Interface:** Front-end interativo em **HTA/JS**.
* **Deploy:** Script de automação **Batch/VBScript** convertido para Executável de baixo nível.

---

## 💡 Suporte e Manutenção
* **Manual:** Um guia detalhado em PDF é copiado para `C:\INTS_Energy\Manual_Tecnico.pdf`.
* **Logs:** Verifique `install_log.txt` na pasta de destino para auditoria.
* **Desinstalação:** Utilize o botão de remoção dentro da interface de Setup.

---

## 🔵 Histórico de Evolução (Changelog)

* **19/03/2026 05:00 - Versão 5.0 (O Maestro & Motor Python) 🚀:**
    * **Arquitetura Híbrida:** Migração do motor de monitoramento para **Python**, garantindo maior estabilidade, leveza e precisão no processamento de horários.
    * **Instalador Maestro (EXE):** O novo instalador em `.exe` agora gerencia toda a logística. Ele identifica o local de execução, move os arquivos para o `C:\INTS_Energy` e abre o setup automaticamente.
    * **Inteligência de Localização:** O script agora detecta se já está na pasta de destino. Se estiver, ele pula a instalação e abre o configurador direto, evitando mensagens redundantes.
    * **Documentação Embarcada:** Integração automática do **Manual Técnico em PDF** durante o processo de cópia.
    * **Invisibilidade Total:** Refinamento dos scripts VBS para garantir que o usuário final nunca veja janelas de prompt de comando (CMD).

* **06/03/2026 21:00 - Versão 4.1 (Parâmetros Dinâmicos & Segurança):**
    * **Configuração Flexível:** Adicionado campo de "Intervalo de Reaviso" no Setup (1 a 60 min).
    * **Lógica de Persistência:** Uso do `config.txt` como banco de dados local para leitura dinâmica pelo motor.
    * **Blindagem na Desinstalação:** O botão de desinstalar agora encerra forçadamente o `mshta.exe`, eliminando riscos de desligamento residual.

* **05/03/2026 05:00 - Versão 4.0 (Instalador Inteligente & Interface Visual):**
    * **Nova Estratégia:** Substituição dos comandos manuais por um pacote instalador completo em Visual Basic.
    * **Interface HTA:** Implementada interface com auto-elevação de privilégios e opção de desinstalação simplificada.

* **01/03/2026 - Versões 2.0 e 3.0 (Pivotagem de Estratégia):**
    * Migração de "Modo Dormir" para "Desligamento Direto" e adoção de Tarefas Agendadas via Shell para maior compatibilidade com o hardware do hospital.
    * Criação da tarefa de desligamento, jogar este comando no Shell: schtasks /create /tn "ECONOMIA_ENERGIA" /tr "shutdown /s /f /t 0" /sc daily /st 21:00 /f /rl highest /ru "SYSTEM"
    * Apagar a Tarefa: schtasks /delete /tn "ECONOMIA_ENERGIA" /f

* **28/02/2026 22:00 - Versão 1.0 (Protótipo em .bat):**
    * Criação do primeiro script de suspensão testado em ambiente controlado (T.I.).
    * Funcionou, mas não era viável porque demorava mais de 5 minutos para fazer o outro computador entrar em modo "sleep" via rede, imagina realizar a tarefa no hospital todo? Mas o resultado positivo foi animador e deu impulso e pensar em melhorias, os codigos foram perdidos.
    

---

## ⚖️ Licença
Este projeto está sob a licença MIT - Veja o arquivo [LICENSE](LICENSE) para detalhes.
