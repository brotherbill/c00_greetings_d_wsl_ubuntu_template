## Quick Reference: Creating New D Projects

### One-Time Setup

Follow FROM_SCRATCH.md to set up your environment. This will install all prerequisites and create the `c00_greetings_d_wsl_ubuntu_template` project, which contains the templates and scripts for new projects.

**Note:**
- Do not edit or delete the `c00_greetings_d_wsl_ubuntu_template` directory. It is required for creating new projects with `new_d_project.ps1`.

### Creating a New D Project
To create a new D project:

1. Go to the parent folder where you want your new project (e.g., `C:\dev\d` in Windows, or `/mnt/c/dev/d` in WSL Ubuntu).
2. Open VS Code, open the folder containing your D project, and open the Terminal.
3. (Optional, for updates) Every month or quarter, update your setup:
   - Run: `cd C:\dev\d\` (Windows) or `cd /mnt/c/dev/d/` (WSL Ubuntu)
   - Run: `git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template`
   - Run: `cd c00_greetings_d_wsl_ubuntu_template`
   - Run: `./setup_new_d_project_global.ps1` (in Windows PowerShell)
4. Create and open a new project in VS Code:
   - Run: `cd C:\dev\d\` (Windows) or `cd /mnt/c/dev/d/` (WSL Ubuntu)
   - Run: `new_d_project -name chess_master_2525 -description "A chess engine and GUI"`
   - Run: `cd C:\dev\d\chess_master_2525` (Windows) or `cd /mnt/c/dev/d/chess_master_2525` (WSL Ubuntu)
   - Run: `code .`

This will:
- Create a new folder called `chess_master_2525` in your chosen parent directory
- Set up all the files for your new D project
- Open the project in VS Code, ready for you to start coding
