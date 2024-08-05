# This script will update all Chocolatey packages
try {
	Start-Transcript -Path "C:\Users\dgall\OneDrive\Desktop\Stuff\Choco_Update_Log.txt"
    # Update Chocolatey itself
    choco upgrade chocolatey -y

    # Update all packages
    choco upgrade all -y
}
catch {
    Write-Output "An error occurred while trying to update Chocolatey packages."
}
Stop-Transcript