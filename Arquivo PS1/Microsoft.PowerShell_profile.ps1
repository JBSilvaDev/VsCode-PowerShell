$MaximumHistoryCount = 2000

# Importação segura: carrega apenas se o módulo estiver instalado
$modules = @("posh-git", "Terminal-Icons", "DockerCompletion","Microsoft.WinGet.Client")
foreach ($module in $modules) {
    if (Get-Module -ListAvailable -Name $module) {       
      Import-Module $module
        
    } else {
        if ($module -eq "Microsoft.WinGet.Client"){
          Write-Host "PowerToys CommandNotFound module não está instalado." -ForegroundColor DarkGray
        } else {
          
              Write-Host "Módulo '$module' não instalado (veja README)." -ForegroundColor DarkGray
        }
    }
}
Import-Module PSReadLine

# Configuração tema
$tema = "material.omp.json"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/$tema" | Invoke-Expression

# Uses tab for autocompletion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# History definitions
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) {
    try {
        Import-Clixml $HistoryFilePath -ErrorAction Stop | Add-History
    } catch {
        # Remove arquivo de histórico corrompido para evitar erro na próxima abertura
        Remove-Item $HistoryFilePath -Force
    }
}

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

# Aliases
Set-Alias which Get-Command
Set-Alias open Invoke-Item

function ll() { Get-ChildItem | Format-Table }
function la() { Get-ChildItem | Format-Wide }
function lb() { Get-ChildItem | Format-List }

Set-Alias ls la
Set-Alias l lb

# Aliases Functions

function profile() { code $PROFILE }
function historico() { code "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }

# Compute file hashes - useful for checking successful downloads
function md5    { Get-FileHash -Algorithm MD5 $args }
function sha1   { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }

function tail { Get-Content $args -Tail 30 -Wait }

function take {
  New-Item -ItemType directory $args
  Set-Location "$args"
}
# Minhas funcoes
function meuip(){  
  Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress, PrefixLength
}
function new-venv(){
  "
  Criando ambiente virtual: 'venv'
  python -m venv venv
  "
  python -m venv venv
  ative-venv
}
function ative-venv(){  
  "
  Ativando ambiente virtual: 'venv'
  venv/Scripts/activate
  "
  venv/Scripts/activate
  att-pip
  cls
}
function desative-venv() {
  "
  Desativando ambiente virtual: 'venv'
  deactivate
  "
  deactivate
}
function att-pip(){
  "
  Atualizando pip
  python.exe -m pip install --upgrade pip
  "
  python.exe -m pip install --upgrade pip
  freeze-install
}

function freeze-save(){  
  "Executando: pip freeze > requirements.txt"
  pip freeze > requirements.txt
  freeze-clear
}
function freeze-install(){  
  "
  Verificando e instalando pacotes
  pip install -r requirements.txt
  "
  pip install -r requirements.txt
}
function freeze-uninstall(){
  "
  Lista todos os pacotes instalados no ambiente
  pip freeze > requirements.txt
  "
  pip freeze > requirements.txt
  "
  Desinstalando pacotes
  pip uninstall -r requirements.txt -y
  "
  pip uninstall -r requirements.txt -y

  freeze-clear 
}

function freeze-clear(){
  "Limpar pacotes do jupter do arquivo requirements.txt"
  $exclude = "asttokens|comm|debugpy|decorator|executing|ipykernel|ipython|ipython_pygments_lexers|jedi|jupyter_client|jupyter_core|matplotlib-inline|nest-asyncio|packaging|parso|platformdirs|prompt_toolkit|psutil|pure_eval|Pygments|python-dateutil|pywin32|pyzmq|six|stack-data|tornado|traitlets|wcwidth"
  (Get-Content requirements.txt) | Where-Object {$_ -notmatch $exclude} | Set-Content requirements.txt
}

# Comandos DJANGO
function django-init(){
  "Executando: django-admin startproject setup ."
  django-admin startproject setup .
}
function django-app($appName){
  "Executando: django-admin startapp $appName"
  django-admin startapp $appName
}
 
function pmr(){  
  django-tables
  "Executando: python manage.py runserver"
  python manage.py runserver
}
function django-tables(){
  "Executando: python manage.py makemigrations"
  python manage.py makemigrations
  "Executando: python manage.py migrate"
  python manage.py migrate
}
