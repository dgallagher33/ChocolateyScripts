# This script installs multiple applications using Chocolatey

# Ensure that Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey is already installed."
}

# List of packages to install
$packages = @(
    "googlechrome",
    "firefox",
    "vcredist-all",
    "notepadplusplus",
    "nordvpn",
    "steam",
    "ubisoft-connect",
    "eadesktop",
    "vlc",
	"foxitreader",
	"malwarebytes",
	"steam-rom-manager",
	"libreoffice-fresh",
	"sidequest",
	"occt",
	"qbittorrent",
	"vortex",
	"discord",
	"epicgameslauncher",
	"hwinfo.install",
	"nvidia-display-driver",
	"amd-ryzen-chipset",
	"k-litecodecpackmega"
)

# Install each package
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    choco install $package -y
}

# Verify installations
foreach ($package in $packages) {
    if (choco list --local-only | Select-String $package) {
        Write-Host "$package has been installed successfully."
    } else {
        Write-Host "$package installation failed."
    }
}
