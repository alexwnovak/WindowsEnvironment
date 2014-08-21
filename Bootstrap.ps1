$chocolateyPath = Join-Path ${Env:ALLUSERSPROFILE} chocolatey

if ( Test-Path $chocolateyPath )
{
   Write-Host Chocolatey already installed
   exit 1
}

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

[Environment]::SetEnvironmentVariable("Path", "${Env:Path};$chocolateyPath", "Machine")

$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


Write-Host Chocolatey installed successfully
