param(
    [Parameter(Mandatory, Position=0)]
    [string]$name,
    [Parameter(Mandatory, Position=1)]
    [string]$description
)
$repoUrl = 'https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template'
$dest = $name
if (Test-Path $dest) {
    Write-Host "[INFO] The directory '$dest' already exists. Please choose a different project name or delete the existing directory if you want to recreate it. No files were changed."
    return
}

git clone $repoUrl $dest
if (!(Test-Path $dest)) {
    Write-Error "Failed to clone repository."
    exit 1
}

# Remove project creation scripts from the new project
$removeScripts = @('new_d_project.ps1', 'setup_new_d_project_global.ps1')
foreach ($script in $removeScripts) {
    $scriptPath = Join-Path $dest $script
    if (Test-Path $scriptPath) {
        Remove-Item $scriptPath -Force
    }
}

# Replace all references in all files
$files = Get-ChildItem -Path $dest -Recurse -File -Include *.md,*.json,*.d,*.gitignore
foreach ($file in $files) {
    (Get-Content $file.PSPath) -replace 'c00_greetings_d_wsl_ubuntu_template', $name | Set-Content $file.PSPath
}

# Update description in dub.json
$dubFile = Join-Path $dest 'dub.json'
if (Test-Path $dubFile) {
    $dubContent = (Get-Content $dubFile -Raw)
    $dubContent -replace '"description": ".*?"', ('"description": "' + $description + '"') | Set-Content $dubFile
}

# Update description in launch.json if present
$launchFile = Join-Path $dest '.vscode/launch.json'
if (Test-Path $launchFile) {
    $launchContent = (Get-Content $launchFile -Raw)
    $launchContent -replace '"description": ".*?"', ('"description": "' + $description + '"') | Set-Content $launchFile
}

Write-Host "Project '$name' created and customized."

# Sample usage:
# new_d_project -name my_new_project -description "My new D project for WSL Ubuntu"
