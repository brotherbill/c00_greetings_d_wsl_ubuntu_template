## Running PowerShell from WSL Ubuntu

You can run PowerShell directly from your WSL Ubuntu environment:

1. **Install PowerShell (if not already installed):**
   ```bash
   sudo snap install powershell --classic
   ```

2. **Start PowerShell:**
   ```bash
   pwsh
   ```

This will launch a PowerShell session inside your WSL Ubuntu terminal, allowing you to run PowerShell commands as you would on Windows.
# WSL Ubuntu vs Windows: Quick Reference

## Running Scripts
- **Windows PowerShell**: Use for running `.ps1` PowerShell scripts.
- **WSL (Ubuntu)**: Use for running Linux shell commands and scripts.

## How to Run a PowerShell Script from Windows
1. Open Windows PowerShell.
2. Navigate to the script directory:
   ```powershell
   cd <path-to-your-project>
   ```
3. Run the script:
   ```powershell
   .\setup_new_d_project_global.ps1
   ```

## How to Switch to WSL (Ubuntu) After Running a Script
- In Windows PowerShell, after running your script, type:
  ```powershell
  wsl
  ```
- This opens a WSL (Ubuntu) shell where you can run Linux commands.

## Automating: Run Script, Then Enter WSL
```powershell
.\setup_new_d_project_global.ps1; wsl
```

## File System Access
- **Windows** can access WSL files at: `\\wsl$\Ubuntu\home\<ubuntu-username>`
- **WSL** can access Windows files at: `/mnt/c/Users/<windows-username>`

## Notes
- Use Windows tools for `.exe`, `.ps1`, `.bat` files.
- Use WSL for Linux tools, `bash`, `apt`, etc.
- Paths and environment variables differ between Windows and WSL.

## How to Find Your Username

### Windows Username
Open Command Prompt or PowerShell and run:
```powershell
echo %USERNAME%
```
or
```powershell
whoami
```
This will display your Windows username.

### WSL (Ubuntu) Username
Open your WSL (Ubuntu) terminal and run:
```bash
whoami
```
or
```bash
echo $USER
```
This will display your Ubuntu (Linux) username.
