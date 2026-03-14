# WSL Ubuntu/Pop!_OS Setup Guide

This guide will walk you through setting up WSL, installing Ubuntu or Pop!_OS, and configuring VS Code and D language development on a fresh Windows 11 device.

## Step 1: Install WSL on Windows 11


1. Open PowerShell as Administrator *(right-click Start, choose "Windows Terminal (Admin)")*.
   - **Check:** The terminal window title should say `Administrator: Windows PowerShell` if you started it as an admin. If it just says `Windows PowerShell`, you are **not** running as an administrator—close it and try again.
2. Run `wsl --install`
   - This command installs WSL.  (*It doesn't hurt to run it twice.  Reboot after each install*)
     - This takes several minutes to run and is not chatty.
     - If it states that it is corrupted, press any key to repair.
3. Restart the computer.
4. Run again on Powershell as Administrator: `wsl --install`

   1. This may not be necessary, but does no harm.  

5. Restart  the computer.

## Step 2: Install Ubuntu or Pop!_OS in WSL

### Option A: Install Ubuntu (Recommended)
1. After your computer restarts, open PowerShell *(*normal rights are fine*)*.
   
2. Run:

```
wsl --install -d Ubuntu
```

- This will download and install the latest Ubuntu distribution for WSL.
- When installation completes, a new window will open to finish Ubuntu setup.

   When Ubuntu setup starts, you'll be prompted to create a user account:
   - The prompt may say "Unix user account"—this is simply your Linux username.
   - Choose a short, memorable username. This name will appear in your terminal prompt and take up space. For example, `bb` for Brother Bill.
   - Enter a password when prompted. This password is used for administrative (sudo) commands.
     - A strong password has an Uppercase character, lowercase character, a digit and a punctuation character.
   - Then confirm the password by entering it again.

- You are now in Ubuntu mode in the Terminal.

- Close the Terminal by Alt+F4 or clicking on the top-right X (close window).

- Close: "Welcome to Windows Subsystem for Linux" window.

### Option B: Install Pop!_OS (Advanced)
1. Pop!_OS is not available in the Microsoft Store or via `wsl --install` *by default*.
2. If you want Pop!_OS, follow the official guide: https://github.com/pop-os/wsl-instructions


---

## Step 3: Support Copy/Paste between Windows and Ubuntu

1. Open your web browser in Windows.
2. Visit: https://code.visualstudio.com/
3. Click the **Download for Windows** button and run the installer.
4. Follow the setup wizard to complete installation (accept defaults unless you have a preference).
5. After installation:
   1. Launch **Visual Studio Code** (the installer does this by default).
   2. Close your web browser.

*Tip: You can pin VS Code to your taskbar for easy access.*

---

## Step 3: Install Visual Studio Code on Windows

1. Open your web browser in Windows.
2. Visit: https://code.visualstudio.com/
3. Click the **Download for Windows** button and run the installer.
4. Follow the setup wizard to complete installation (accept defaults unless you have a preference).
5. After installation:
   1. Launch **Visual Studio Code** (the installer does this by default).
   2. Close your web browser.

*Tip: You can pin VS Code to your taskbar for easy access.*

---

## Step 4: Install the WSL Extension and Connect to Ubuntu in VS Code

1. In Visual Studio Code, click the Extensions icon on the left sidebar *(or press `Ctrl+Shift+X`)*.
2. In the search box, type: `WSL`
3. Click on the extension named **WSL** *(by Microsoft)*.
4. Click the **Install** button.


5. Fully close all VS Code windows.
6. Open VS Code again from the Windows Start menu (not from inside WSL or a terminal).
5. Press **Ctrl+Shift+P** to open the Command Palette, then type and select:
   - **WSL: Connect to WSL**
8. You should see: **>< WSL: Ubuntu** on the bottom-left of VS Code, with blue background.
5. **If nothing appears or you get an error:**
   - Make sure WSL and Ubuntu are installed and working (open a Windows terminal and run `wsl`).
   - Restart your computer and try again.
   - If the problem persists, check for Windows or VS Code updates.

**VS Code is now running in Ubuntu**

*Tip: You can now open folders and files inside your Ubuntu filesystem directly from VS Code!* (*Provide decoder ring*)

---

## Step 5: Install D Language Tools in Ubuntu (WSL)

1. In VS Code, open the Terminal with **Terminal > New Terminal**
1. In the VS Code terminal (connected to Ubuntu), run the following command to download and run the official D language installer:

```
wget https://dlang.org/install.sh -O - | bash
```

- This will download and run the D installer script. Follow the prompts to install the latest stable D compiler (usually just press Enter to accept defaults).

2. When installation completes, activate D for your current terminal session:

*The `source` command runs the activate script in your current terminal, setting up environment variables so you can use the D compiler (`dmd`) and related tools right away.*

**To make this automatic in every new terminal session, run the following command in your Ubuntu (WSL) terminal:**
```
echo 'source ~/dlang/dmd-*/activate' >> ~/.bashrc
```
​	Close and reopen VS Code.

*This adds the activation command to your `.bashrc` profile, so the D environment will be set up automatically each time you open a new terminal.*

3. You should now be able to run `dmd --version` to verify the installation.
   1. It should have version 2.112.0 or higher.
4. Close Terminal in VS Code.

---


## Step 6: Install D Language Extension in VS Code

Install the following VS Code extensions to enable D language development and debugging:

1. In VS Code (connected to Ubuntu), click the Extensions icon on the left sidebar *(or press Ctrl+Shift+X)*.

2. In the search box, install each of these extensions:
   - **code-d** (by WebFreak) — D language support: syntax highlighting, code completion, and debugging.
     - If dialog asks: Do you trust publishers "WebFreak" and "Golger Benl"?, click **Trust Publishers & Install**
   - **Native Debug** (by WebFreak) — Required for debugging D programs with GDB/LLDB.
   - **C/C++** (by Microsoft) — Provides essential debugging support for GDB/LLDB and C/C++ code.
     - Do **not** click on: "Switch to Pre-Release Version".  (*Use stable legacy version*)
   
3. After installing all extensions, reload VS Code if prompted.

*Tip: Installing all required extensions now ensures a smooth experience for building, running, and debugging D projects in later steps.*

---

## Step 7: Set Up and Test F5 Debugging for D in VS Code

If you have not already installed GDB (the GNU Debugger), you will need it for debugging support. In the VS Code terminal (Ubuntu), run:

```bash
sudo apt-get update && sudo apt-get install -y gdb
```

Debugging is a powerful way to understand how your program works, line by line. With the VS Code debugger, you can pause your program, inspect variables, and watch how each statement is executed. This is especially helpful for learning D, experimenting with code, as well as finding and fixing bugs.

### Start with the Project Template


1. Clone the starter project repository:
   ```bash
   git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template.git
   ```

   Place the template and all your course projects in the directory `~/dev/d/` in your Ubuntu home folder. For example:
   ```bash
   mkdir -p ~/dev/d
   
   cd ~/dev/d
   
   git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template.git
   ```
   This will create a folder named `c00_greetings_d_wsl_ubuntu_template` inside `~/dev/d/` with all the necessary files and configuration for D development and debugging.
   
   **Warning:**
   This template is intended only for testing your D installation and as a base for creating new D language projects. It provides a ready-to-use programming environment with debugging support, so you can avoid tedious setup steps.
   **Do not edit or delete this template folder.**
   
2. Open the cloned folder in VS Code (Ubuntu):
    - In VS Code, click File → Open Folder and select the `c00_greetings_d_wsl_ubuntu_template` directory.
      - If asked: "Do you trust the authors of the files in this folder?"
        - Check: "Trust the authors of all files in the parent folder 'd' "
        - Click: "Yes, I trust the Authors" button
    
3. Review the `.vscode/launch.json` file:
    - The project already includes a pre-configured `launch.json` for debugging D programs with GDB.
    - If you need to customize it, open `.vscode/launch.json` and edit as needed. The default configuration should work for the provided example.

4. Build and debug your D program as described in the project’s README or in the next steps.
   - **Tip:** If your program has a different name, change `greetings` to match your executable.

4. **Set a Breakpoint**
   
   - In your D source file, click to the left of a line number where you want the program to pause. A red dot will appear (this is a breakpoint).
   
5. **Start Debugging**
   
   - Press **F5** or click the green "Run and Debug" button at the top of the sidebar.
   - The debugger will start, and your program will pause at the breakpoint. You can now inspect variables, step through code, and use the debug console.

**Troubleshooting Tips:**

- Make sure your D program is compiled with debug symbols (the default for dmd is fine).
- If you see errors about missing GDB, install it in Ubuntu with:
   ```bash
   sudo apt update
   
   sudo apt install -y gdb
   ```
- If you have issues, double-check your launch.json file and make sure the program path matches your compiled D executable.

---

## Step 8: Test Terminal I/O (stdin/stdout) in VS Code Ubuntu Terminal

To ensure that interactive D programs work correctly in the VS Code (Ubuntu) terminal, follow these steps:

1. Create a new D source file:
   ```bash
   nano echo_input.d
   ```
2. Paste the following code into nano:
   ```d
   import std.stdio;
   
   void main()
   {
       writeln("Enter your name:");
       string name = stdin.readLine();
       writeln("Hello, ", name, "!");
   }
   ```
3. Save and exit nano *(press Ctrl+O, Enter, then Ctrl+X)*.
4. Compile the program:
   ```bash
   dmd echo_input.d
   ```
5. Run the program:
   ```bash
   ./echo_input
   ```
6. When prompted, type your name and press Enter. You should see the greeting printed immediately.

*If the program responds to your input without delay or buffering issues, your VS Code terminal is handling stdin and stdout correctly for D programs.*
