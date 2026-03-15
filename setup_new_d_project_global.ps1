# This script sets up new_d_project.ps1 for global use by copying it to a user scripts directory and updating the PATH if needed.
# Usage: Run this script from the project folder containing new_d_project.ps1

$scriptName = "new_d_project.ps1"
$cmdName = "new_d_project.cmd"
$userScripts = "$env:USERPROFILE\scripts"
$source = Join-Path $PSScriptRoot $scriptName
$dest = Join-Path $userScripts $scriptName
$cmdDest = Join-Path $userScripts $cmdName

# Create scripts directory if it doesn't exist
if (!(Test-Path $userScripts)) {
    New-Item -ItemType Directory -Path $userScripts | Out-Null
}

# Copy new_d_project.ps1 to scripts directory
Copy-Item $source $dest -Force

# Create a wrapper batch file for easy calling
$cmdContent = @'
@echo off
setlocal
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0new_d_project.ps1" %*
'@
Set-Content -Path $cmdDest -Value $cmdContent

# Add scripts directory to user PATH if not already present (persistent)
$envPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")
if (-not ($envPath -split ";" | Where-Object { $_ -eq $userScripts })) {
    [System.Environment]::SetEnvironmentVariable("PATH", "$envPath;$userScripts", "User")
    Write-Host "Added $userScripts to your user PATH. You may need to restart your terminal."
} else {
    Write-Host "$userScripts is already in your PATH."
}

# Add scripts directory to current session PATH if not already present
if (-not ($env:PATH -split ";" | Where-Object { $_ -eq $userScripts })) {
    $env:PATH = "$env:PATH;$userScripts"
    Write-Host "Added $userScripts to your current session PATH."
} else {
    Write-Host "$userScripts is already in your current session PATH."
}

Write-Host "new_d_project is now globally available. You can call it from any folder:"
Write-Host "new_d_project -name my_new_project -description 'My new D project'"
