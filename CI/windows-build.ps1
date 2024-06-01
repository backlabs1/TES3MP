# Stop on error
$ErrorActionPreference = "Stop"

# Add a trap to prevent the PowerShell window from closing when an
# error is thrown unless connected via SSH.
trap {
    Write-Error "$($_.Exception.Message)"
    if ($null -eq $env:SSH_CONNECTION) {
        Read-Host -Prompt "Press Enter to exit"
    }
    exit 1
}

# Switch to this script's own directory
Set-Location -Path $PSScriptRoot

# Run script as Administrator
if (!
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    Start-Process -FilePath 'powershell' -ArgumentList (
        '-NoExit', '-File', $MyInvocation.MyCommand.Source, $args | %{ $_ }
    ) -Verb RunAs
    exit
}

# Install Chocolatey if not already installed
if (-Not (Get-Command choco -errorAction SilentlyContinue)) {
    Write-Host "--> Installing Chocolatey"
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Chocolatey packages defined in packages.config
& choco install windows-choco-packages.config --yes
$ChocoExitCode = $LastExitCode
if ($ChocoExitCode -eq 3010) {
    throw "Reboot required; please restart Windows."
}
elseif (-1,1 -Contains $ChocoExitCode) {
    throw "Choco exited with an error"
}

# Build using Git Bash
& "$env:ProgramFiles\Git\bin\bash.exe" -e -c @'
cd ..

# Ninja
rm -fr MSVC2019_64_Ninja
CI/before_script.msvc.sh -k -p Win64 -v 2019 -N -V
cd MSVC2019_64_Ninja
source activate_msvc.sh
ninja -f build-Release.ninja openmw-iniimporter openmw-launcher \
                             openmw-wizard tes3mp tes3mp-browser tes3mp-server

# Create archive
archive_filename=TES3MP-$(git describe --dirty)-Release.tar.gz
echo Creating archive $archive_filename
mkdir -p ../out
rm -rf ../out/*
tar --create --sort=name --mtime=@0 --owner=0 --group=0 \
    --directory=Release/ --file - . | \
    gzip --no-name > ../out/$archive_filename
'@
