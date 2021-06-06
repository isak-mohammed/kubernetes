# Dependencies to install minikube on windows machine
1. Docker installed on windows machine
2. Chocolatey

# Docker desktop on windows 10
Download and install latest version of docker using below link 
https://docs.docker.com/docker-for-windows/install/

# Choclatey Installation:

### Open powershell as administrator and execute below command to install choclatey

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

### If getting Error, Turn Off Your Anti Virus for a moment and try again.