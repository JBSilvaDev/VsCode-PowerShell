# Guia de Configuração para VSCode e PowerShell

Este repositório contém configurações, temas e scripts para otimizar o ambiente de desenvolvimento com Visual Studio Code e PowerShell.

## 📋 Requisitos

- **VSCode** (Visual Studio Code)
- **PowerShell 7+** (Windows)
- **Git** (opcional, para controle de versão)

## 📑 Sumário

- [⚙️ Funções e Atalhos para o Shell](#-funções-e-atalhos-para-o-shell)
- [🚀 Configuração do Ambiente PowerShell](#-configuração-do-ambiente-powershell-no-windows)
- [🎨 Temas para o PowerShell](#-temas-para-o-powershell-oh-my-posh)
- [📁 Estrutura de Perfis VSCode](#-estrutura-de-perfis-vscode)
- [✅ Arquivo de Perfil de Exemplo](#-arquivo-de-perfil-de-exemplo)
- [📂 Meus Perfis DEV](#-meus-perfis-dev)
- [🖱️ Correção: Ponteiro do Mouse](#-correção-ponteiro-do-mouse-desaparecendo-no-vscode)
- [📌 Dicas Adicionais](#-dicas-adicionais)
- [🔗 Links Úteis](#-links-úteis)

---

## ⚙️ Funções e Atalhos para o Shell

Crie atalhos (funções ou aliases) para comandos longos e repetitivos.

### Windows (PowerShell)

**Objetivo:** Criar uma função `meuip` para verificar os endereços IPv4.

1.  **Comando Original:**
    ```powershell
    Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress, PrefixLength
    ```

2.  **Abra o seu perfil do PowerShell:**
    ```powershell
    code $PROFILE
    ```

3.  **Adicione a função ao arquivo `.ps1` que abrir:**
    ```powershell
    function meuip() {
        Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress, PrefixLength
    }
    ```

4.  **Pronto!** Após salvar o arquivo e recarregar seu terminal, basta digitar `meuip` para executar o comando.

### macOS (Zsh/Bash)

**Objetivo:** Criar um alias `meuip` para verificar as configurações de rede.

1.  **Comando Original:**
    ```bash
    ifconfig | grep "inet " | awk '{print $1, $2, $4}'
    ```

2.  **Adicione o alias ao seu arquivo de configuração** (como `~/.zshrc` ou `~/.bash_profile`):
    ```bash
    alias meuip="ifconfig | grep 'inet ' | awk '{print \$1, \$2, \$4}'"
    ```

3.  **Pronto!** Recarregue seu shell e o comando `meuip` estará disponível.

---

## 🚀 Configuração do Ambiente PowerShell no Windows

Este guia auxilia na instalação das dependências para o funcionamento do perfil customizado do PowerShell.

### Pré-requisitos

- **PowerShell 7+:** Certifique-se de ter uma versão atualizada.
  ```powershell
  winget install --id Microsoft.PowerShell
  ```
  ou
  ```powershell
  store install powershell
  ```

### 1. Instalar Oh My Posh

Gerenciador de temas para o prompt de comando.

- **Instalação via Winget:**
  ```powershell
  winget install JanDeDobbeleer.OhMyPosh -s winget
  ```
   ou
  ```powershell
  store install oh-my-posh
  ```
  *Reinicie o terminal após a instalação.*

### 2. Instalar Nerd Fonts

Para que os ícones e temas funcionem corretamente, é essencial ter uma "Nerd Font" instalada e configurada no seu terminal (VSCode, Windows Terminal, etc.).

- **Instalação via Oh My Posh (Administrador):**
  ```powershell
  oh-my-posh font install meslo
  ```
  *Após a instalação, configure seu terminal para usar a fonte desejada.*


### 3. Instalar Módulos Essenciais do PowerShell

Execute os comandos abaixo para adicionar funcionalidades ao seu terminal:

| Módulo | Descrição | Comando |
|--------|-----------|---------|
| **posh-git** | Integração com Git | ```Install-Module posh-git -Scope CurrentUser -Force```  |
| **Terminal-Icons** | Ícones para arquivos e pastas (ls/dir) | ```Install-Module Terminal-Icons -Scope CurrentUser -Force``` |
| **DockerCompletion** | Autocompletar para comandos Docker | ```Install-Module DockerCompletion -Scope CurrentUser -Force``` |
| **Microsoft.WinGet.Client** | Módulo da Microsoft para gerenciar pacotes | ```Install-Module -Name Microsoft.WinGet.Client -Scope CurrentUser -Force``` |
| **Get-ChildItemColor** | Cores para o comando Get-ChildItem (opcional se já usar Terminal-Icons) | ```Install-Module Get-ChildItemColor -Scope CurrentUser -Force``` |

---

## 🎨 Temas para o PowerShell (Oh My Posh)

Para alterar o tema, modifique a seguinte linha no seu perfil (`$PROFILE`):

```powershell
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
$tema = "<nome-do-tema>.omp.json"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/$tema" | Invoke-Expression

```

Use o comando `Get-PoshThemes` para ver a lista completa de temas disponíveis.

### Exemplos de Temas

| Tema       | Preview                                            |
| ---------- | -------------------------------------------------- |
| `material` | ![](image/README/1767806489629.png)        |
| `spaceship`| ![](image/README/1767806578612.png)       |
| `easy-term`| ![](image/README/1767806619109.png)      |
| `json`     | ![](image/README/1767806536749.png)            |

Para mais temas, visite o repositório oficial do Oh My Posh: [Oh My Posh Themes](https://ohmyposh.dev/docs/themes).

---

## 📁 Estrutura de Perfis VSCode

Este repositório inclui perfis de configuração para o VSCode organizados por tipo de desenvolvimento. Cada perfil contém:

| Arquivo | Descrição |
|---------|-----------|
| **settings.json** | Configurações específicas do editor (fonte, tema, formatação, etc.) |
| **extensions.json** | Lista de extensões recomendadas para o perfil |

### Como Usar os Perfis

1. Abra o VSCode
2. Pressione `Ctrl + Shift + P`
3. Digite `Preferences: Open Workspace Settings (JSON)`
4. Copie as configurações desejadas do perfil escolhido para o seu `settings.json`

Para instalar as extensões recomendadas:
1. Abra o arquivo `extensions.json` do perfil desejado
2. Instale as extensões listadas manualmente ou use o comando:
   ```powershell
   code --install-extension <id-da-extensao>
   ```
---

## ✅ Arquivo de Perfil de Exemplo

Um arquivo `Microsoft.PowerShell_profile.ps1` com todas essas configurações prontas para uso está disponível [aqui](./Arquivo%20PS1/Microsoft.PowerShell_profile.ps1). Você pode usá-lo como base para o seu perfil.

## 📂 Meus Perfis DEV

- [Default](./Default/)
  - Perfil padrão com configurações básicas.
- [Flutter](./Flutter-Profile/)
  - Perfil otimizado para desenvolvimento Flutter.
- [Python](./Python-Profile/)
  - Perfil otimizado para desenvolvimento Python.
- [HTML](./HTML-Profile/)
  - Perfil otimizado para desenvolvimento web front-end.

---

## 🖱️ Correção: Ponteiro do Mouse Desaparecendo no VSCode

Caso o ponteiro do mouse desapareça ao digitar no editor ou terminal do VSCode, siga os passos abaixo para desabilitar a aceleração de hardware:

### Solução

1. **Abra a Paleta de Comandos:**
   - Pressione `Ctrl + Shift + P`

2. **Acesse as Configurações de Runtime:**
   - Digite e selecione: `Preferences: Configure Runtime Arguments`

3. **Edite o Arquivo `argv.json`:**
   - Adicione a seguinte linha de configuração:
   ```json
   "disable-hardware-acceleration": true
   ```
   
   **Exemplo de como deve ficar o arquivo:**
   ```json
   {
       "disable-hardware-acceleration": true
   }
   ```

4. **Reinicie o VSCode:**
   - Feche completamente o VSCode e abra novamente para que a alteração tenha efeito.

> **Nota:** Esta é uma solução paliativa. A desabilitação da aceleração de hardware pode impactar levemente a performance de renderização, mas resolve o problema do cursor invisível na maioria dos casos.

---

## 📌 Dicas Adicionais

### Recarregar o Perfil do PowerShell

Após fazer alterações no seu perfil, recarregue-o sem precisar reiniciar o terminal:

```powershell
. $PROFILE
```

### Verificar Versão do PowerShell

```powershell
$PSVersionTable.PSVersion
```

### Localizar o Arquivo de Perfil

```powershell
$PROFILE
```

### Listar Temas Disponíveis do Oh My Posh

```powershell
Get-PoshThemes
```

---

## 🔗 Links Úteis

| Recurso | Link |
|---------|------|
| Oh My Posh | [ohmyposh.dev](https://ohmyposh.dev) |
| Nerd Fonts | [nerdfonts.com](https://www.nerdfonts.com) |
| VSCode | [code.visualstudio.com](https://code.visualstudio.com) |
| PowerShell | [microsoft.com/powershell](https://microsoft.com/powershell) |
| Winget | [learn.microsoft.com/winget](https://learn.microsoft.com/windows/package-manager/) |
