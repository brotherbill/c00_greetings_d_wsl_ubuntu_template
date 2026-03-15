## Parameters for new_d_project.ps1

The script `new_d_project.ps1` requires two parameters:

- `-name` (string, required): The name of your new project.
- `-description` (string, required): A description for your new project.

### Example usage
```bash
pwsh new_d_project.ps1 -name my_new_project -description "My new D project for WSL Ubuntu"
```

## Making new_d_project.ps1 Callable from Anywhere

To run `new_d_project.ps1` from any directory in WSL-Ubuntu, create a symbolic link to it in a directory that is in your PATH (e.g., `~/bin`).

### 1. Create ~/bin if it doesn't exist
```bash
mkdir -p ~/bin
```

### 2. Add ~/bin to your PATH (if not already present)
Add the following line to your `~/.bashrc`, `~/.zshrc`, or relevant shell config:
```bash
export PATH="$HOME/bin:$PATH"
```
Then reload your shell config:
```bash
source ~/.bashrc  # or source ~/.zshrc
```

### 3. Create a symlink to new_d_project.ps1
```bash
ln -s /home/bb/dev/d/c00_greetings_d_wsl_ubuntu_template/new_d_project.ps1 ~/bin/new_d_project.ps1
```

### 4. Usage
Now you can run the script from any directory:
```bash
pwsh new_d_project.ps1
```

Or, if you are already in PowerShell:
```powershell
./new_d_project.ps1
```
> **Tip:**
> When working in WSL-Ubuntu (including PowerShell sessions), always use forward slashes (`/`) as path delimiters. This ensures compatibility with Linux tools and scripts, and avoids issues that may arise from using backslashes (`\`).

> **Tip:**
> If your terminal prompt starts with `PS ` (e.g., `PS /home/ubuntu-username>`), you are in a PowerShell session. If you launched PowerShell using `pwsh` from within your WSL-Ubuntu terminal, then you are running PowerShell inside WSL-Ubuntu.

# PowerShell Installation on WSL Ubuntu

If you want to use PowerShell in WSL Ubuntu, you should install it using snap, as it is not available via apt by default.

## Install PowerShell
```bash
sudo snap install powershell --classic
```

## Start PowerShell
```bash
pwsh
```

This will launch a PowerShell session inside your WSL Ubuntu terminal.

## Exit PowerShell

To exit PowerShell and return to your WSL Ubuntu shell, type:

```powershell
exit
```

> **Environment:**
> You are now in PowerShell, running inside your WSL-Ubuntu terminal.

## Important: Run setup_new* ONCE

Before generating new D projects, you must run the setup script once from this core project directory. In WSL-Ubuntu, use:


pwsh ./setup_new_d_project_global.ps1

```bash
cd /home/bb/dev/d/c00_greetings_d_wsl_ubuntu_template
```

If your prompt starts with `PS ` (you are already in PowerShell):
```powershell
./setup_new_d_project_global.ps1
```

If you are in Bash or another shell (not PowerShell):
```bash
pwsh ./setup_new_d_project_global.ps1
```


> **Note:**
> The `setup_new*` script may receive updates over time. It is good practice to re-run this script periodically (e.g., every month or quarter) to ensure you have the latest setup and freshest scripts for generating new D projects.

This prepares your environment for creating new projects.

**Do NOT modify or delete this project.**

This directory serves as the core template for generating fresh D projects. Any changes here will affect all future projects created from this template. Always keep this project unchanged and available.

