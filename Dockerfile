FROM microsoft/nanoserver
MAINTAINER github.com/daveyb

RUN powershell Get-PackageProvider -Name Nuget -Force

RUN powershell Invoke-WebRequest "https://raw.githubusercontent.com/dotnet/cli/rel/1.0.0/scripts/obtain/dotnet-install.ps1" -OutFile "$env:TEMP\dotnet-install.ps1" -UseBasicParsing
RUN powershell Invoke-Expression $env:TEMP\dotnet-install.ps1
RUN mkdir \app

WORKDIR \app
