# Guia de Configuração para VSCode e PowerShell

Este repositório contém configurações, temas e scripts para otimizar o ambiente de desenvolvimento com Visual Studio Code e PowerShell.

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
  winget search --id Microsoft.PowerShell
  ```

### 1. Instalar Oh My Posh

Gerenciador de temas para o prompt de comando.

- **Instalação via Winget:**
  ```powershell
  winget install JanDeDobbeleer.OhMyPosh -s winget
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

>Integração com Git
```powershell
Install-Module posh-git -Scope CurrentUser -Force
```

>Ícones para arquivos e pastas (ls/dir)
```powershell
Install-Module Terminal-Icons -Scope CurrentUser -Force
```

>Autocompletar para comandos Docker
```powershell
Install-Module DockerCompletion -Scope CurrentUser -Force
```


>Modulo da Microsoft para gerenciar pacotes
```powershell
Install-Module -Name Microsoft.WinGet.Client -Scope CurrentUser -Force
```

>Cores para o comando Get-ChildItem (ls/dir) <br>
>Não necessario se tiver usando os outros modulos de icones e cores acima
```powershell
Install-Module Get-ChildItemColor -Scope CurrentUser -Force
```

---

## 🎨 Temas para o PowerShell (Oh My Posh)

Para alterar o tema, modifique a seguinte linha no seu perfil (`$PROFILE`):

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/<nome-do-tema>.omp.json" | Invoke-Expression
```

Use o comando `Get-PoshThemes` para ver a lista completa de temas disponíveis.

### Exemplos de Temas

| Tema       | Preview                                            |
| ---------- | -------------------------------------------------- |
| `material` | ![](image/README/1767806489629.png)        |
| `spaceship`| ![](image/README/1767806578612.png)       |
| `easy-term`| ![](image/README/1767806619109.png)      |
| `json`     | ![](image/README/1767806536749.png)            |

---

## ✅ Arquivo de Perfil de Exemplo

Um arquivo `VsCode.ps1` com todas essas configurações prontas para uso está disponível [aqui](./Arquivo%20PS1/VsCode.ps1). Você pode usá-lo como base para o seu perfil.

## Meus Perfis DEV
- [Default](./Default/)
  - Perfil padrão com configurações básicas.
- [Flutter](./Flutter/)
  - Perfil otimizado para desenvolvimento Flutter.
- [Python](./Python/)
  - Perfil otimizado para desenvolvimento Python.
- [HTML-CSS-JS](./HTML-CSS-JS/)
  - Perfil otimizado para desenvolvimento web front-end.