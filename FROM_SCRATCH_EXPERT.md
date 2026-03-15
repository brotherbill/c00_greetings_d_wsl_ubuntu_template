# FROM_SCRATCH_EXPERT.md
---

Quick, scriptable setup for D development on Windows 11 or WSL Ubuntu (for experienced users):

1. **Download and install Visual Studio Code**
   - https://code.visualstudio.com/ (defaults OK)
   - Install C/C++ extension (Microsoft)

2. **Install DMD D Compiler**
   - https://dlang.org (Windows or Linux installer)
   - On Windows: Use the installer
   - On WSL Ubuntu: Use the Linux install instructions

3. **Install code-d Extension**
   - VS Code: Ctrl+Shift+X, search "code-d" (WebFreak)

4. **Create Project Folder**
   - e.g., `C:\dev\d` (Windows) or `/mnt/c/dev/d` (WSL Ubuntu)

5. **Clone Project Template**
   ```powershell
   cd C:\dev\d

   git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template

   cd c00_greetings_d_wsl_ubuntu_template
   ```
   Or in WSL Ubuntu:
   ```bash
   cd /mnt/c/dev/d

   git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template

   cd c00_greetings_d_wsl_ubuntu_template
   ```

6. **Set Up Project Creation Script**
   ```powershell
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

   cd C:\dev\d\c00_greetings_d_wsl_ubuntu_template

   ./setup_new_d_project_global.ps1
   ```
   Or in WSL Ubuntu, run the script from Windows PowerShell.

7. **Create a New D Project**
   ```powershell
   cd C:\dev\d

   new_d_project -name tic_tac_toe -description "this plays tic-tac-toe with two players, one player, or zero players. (See War Games movie, 1983)"
   ```
   Or in WSL Ubuntu:
   ```bash
   cd /mnt/c/dev/d

   new_d_project -name tic_tac_toe -description "this plays tic-tac-toe with two players, one player, or zero players. (See War Games movie, 1983)"
   ```

8. **Open and Debug**
   - Open VS Code, open the new project folder
   - Open `source/app.d`, set a breakpoint, F5 to debug, F10 to step

---

- No hand-holding, no screenshots
- All steps are scriptable and repeatable
- For troubleshooting, see FROM_SCRATCH_BEGINNER.md or search error messages
