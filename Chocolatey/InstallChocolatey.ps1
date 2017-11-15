function Install-Chocolatey {
   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-ChocolateyPackage($package) {
   choco install $package -y
)
