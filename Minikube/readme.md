# Dependencies to install minikube on windows machine
1. Oracle VM Virtualbox
2. Chocolatey

# Oracle VM Virtualbox
Download latest version of virtual box using below link and install it.
https://www.virtualbox.org/wiki/Downloads
# Choclatey Installation:

##Open powershell as administrator and execute below command to install choclatey

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

## If getting Error, Turn Off Your Anti Virus for a moment and try again.