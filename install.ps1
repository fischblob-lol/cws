# install.ps1
# !!! UNFINISHED !!!
Write-Host "Do NOT run this script as root, it WILL mess up your system." -ForegroundColor Yellow
Write-Host "Checking if running as root" -ForegroundColor Cyan

# Checks before installation
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Do not run this script as administrator, aborting!" -ForegroundColor Red
    exit 1
}

Write-Host "Cloning GitHub repo in 5 seconds. Press CTRL+C to abort." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Temporary directory
try {
    Set-Location -Path $HOME -ErrorAction Stop
}
catch {
    Write-Host "Failed to cd into HOME" -ForegroundColor Red
    exit 1
}

# Check if directory already exists
if (Test-Path -Path "cws") {
    Write-Host "Directory 'cws' already exists. Remove it or update manually." -ForegroundColor Red
    exit 1
}

# Clone the repository
try {
    git clone https://github.com/fischblob-lol/cws
    if ($LASTEXITCODE -ne 0) {
        throw "Git clone failed"
    }
}
catch {
    Write-Host "Git clone failed" -ForegroundColor Red
    exit 1
}

# Enter the cloned directory
try {
    Set-Location -Path "cws" -ErrorAction Stop
}
catch {
    Write-Host "Failed to enter cws directory" -ForegroundColor Red
    exit 1
}

Write-Host "Installing now" -ForegroundColor Green
# insert kewl installing

# -----
