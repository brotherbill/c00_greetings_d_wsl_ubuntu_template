## Cleaning Build Artifacts

To remove the dub build folder and any c00_greetings_d_wsl_ubuntu_template executables or debug symbol files, use the provided clean.sh script:

1. In the project folder, make sure the script is executable (already set):

   ```bash
   chmod +x clean.sh
   ```


2. Run the script:

   ```bash
   ./clean.sh
   ```

This will clean up build artifacts and binaries related to the template.
# Welcome to the D Project Template (WSL Ubuntu/Windows)

This is a template for D language projects designed for use with both WSL Ubuntu and Windows. This README serves as a quick guide to the documentation and resources in this folder.

> **Important:**
> This template project should **not** be edited, deleted, or moved.
> The `new_d_project.ps1` script depends on this folder and its contents being present in this exact location.
> Always create new projects in a separate directory using the provided script.
This template project should **not** be edited, deleted, or moved.
Always create new projects in a separate directory using the provided Bash script.

---

## Creating a New D Project (WSL-Ubuntu)

To create a new D project from this template, use the provided Bash scripts:

1. In the template folder, run:

   ```bash
   bash setup_new_d_project_global.sh
   ```

   This will make the `new_d_project` command available globally (after restarting your terminal or running `source ~/.bashrc`).

2. To create a new project, run:

   ```bash
   new_d_project <project_name> "<description>"
   ```

   Example:

   ```bash
   new_d_project my_new_project "My new D project for WSL Ubuntu"
   ```

   This will clone the template, update all references, and set your project description.

---

**Note:** The PowerShell scripts and their commentary have been removed. Use only the Bash scripts for project setup and creation in WSL-Ubuntu.

## Start Here

- **README_BEGINNER.md** — Step-by-step beginner guide for setting up, creating, running, and debugging D projects. Highly recommended for new users.
- **README_EXPERT.md** — Concise expert guide for experienced users or those already familiar with D and VS Code.

- **dub.json** — Project configuration for the D build tool (dub).
- **dub.selections.json** — Dependency lock file for dub.

- Always start with the Markdown (.md) files for documentation and setup help.
- For troubleshooting or advanced usage, see the EXPERT guides.

---

# WSL Ubuntu Setup Guide

**Preamble (WSL Ubuntu Users Only):**

Installing WSL for Ubuntu does not install a full Virtual Machine (VM) for Ubuntu. Instead, it provides just enough of Ubuntu for you to use Visual Studio Code in "Ubuntu mode," giving you the power of VS Code to create and debug console applications with D language in a real Linux environment—without the overhead of a full VM.

Alternatives include running a true VM (*such as with Oracle VirtualBox*) or purchasing a dedicated Linux machine running Ubuntu from a Linux hardware manufacturer like System76. However, using Oracle VirtualBox or other VMs is outside the scope of this course.

For this course, you will create and edit D projects exclusively using Visual Studio Code in Ubuntu mode. Ubuntu graphical apps like Terminal and Files are not available; instead, use the integrated VS Code Terminal and Windows File Explorer for all development tasks.

**Disclaimer:**
Copilot was extensively used to help create this setup guide.

## Step 1: Install WSL on Windows 11


1. Open PowerShell as Administrator *(right-click Start, choose "Windows Terminal (Admin)")*.
   - **Check:** The terminal window title should say `Administrator: Windows PowerShell` if you started it as an admin. If it just says `Windows PowerShell`, you are **not** running as an administrator—close it and try again.
2. Run `wsl --install`
   - This command installs WSL.  (*It doesn't hurt to run it many times.  Reboot after each install*)
     - This takes several minutes to run and is not chatty.
     - If it states that it is corrupted, press any key to repair. (*you then have 60 seconds to press any key*)
3. Restart the computer.
4. Run again on Powershell as Administrator: `wsl --install`

   1. This may not be necessary, but does no harm.  

5. Restart  the computer.

## Step 2: Install Ubuntu in WSL

1. After your computer restarts, open PowerShell *(*normal rights are fine*)*.
   
2. Run:

```
wsl --install -d Ubuntu
```

- This will download and install the latest Ubuntu distribution for WSL.
- When installation completes, a new window will open to finish Ubuntu setup.

   When Ubuntu setup starts, you'll be prompted to **create a user account**:
   - The prompt may say "Unix user account"—this is simply your Linux username.
   - Choose a short, memorable **username**. This name will appear in your terminal prompt and take up space. For example, `bb` for Brother Bill.
   - Enter a **password** when prompted. This password is used for administrative (sudo) commands.
     - A strong password has an Uppercase character, lowercase character, a digit and a punctuation character.
   - Then confirm the password by entering it again.

- You are now in Ubuntu mode in the Terminal.

- Close the Terminal by Alt+F4 or clicking on the top-right X (close window).

- Close: "Welcome to Windows Subsystem for Linux" window.


---

## Step 3: Install Visual Studio Code on Windows

1. Open your web browser in Windows.
2. Visit: https://code.visualstudio.com/
3. Click the **Download for Windows** button and run the installer.
4. Follow the setup wizard to complete installation (accept defaults unless you have a preference).
   1. You may want to check **Create a desktop icon** to make it easy to open VS Code by double clicking its icon on the Desktop.

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
7. Press **Ctrl+Shift+P** to open the Command Palette, then type and select:
   - **WSL: Connect to WSL**
   - You should see: **>< WSL: Ubuntu** on the bottom-left of VS Code, with blue background.
   - **If nothing appears or you get an error:**
     - Make sure WSL and Ubuntu are installed and working (open a Windows terminal and run `wsl`).
     - Restart your computer and try again.
     - If the problem persists, check for Windows or VS Code updates.
8. Leave VS Code up and running

**VS Code is now running in Ubuntu**

*Tip: You can now open folders and files inside your Ubuntu filesystem directly from VS Code!* (*Provide decoder ring*)

---

## Step 5: Install D Language Tools in Ubuntu (WSL)

1. In VS Code, open the Terminal with **Terminal > New Terminal**
2. In the VS Code terminal (connected to Ubuntu), run the following command to download and run the official D language installer:

```
wget https://dlang.org/install.sh -O - | bash
```

- This will download and run the D installer script. Follow the prompts to install the latest stable D compiler (usually just press Enter to accept defaults).

3. When installation completes, activate D for your current terminal session:

*The `source` command runs the activate script in your current terminal, setting up environment variables so you can use the D compiler (`dmd`) and related tools right away.*

**To make this automatic in every new terminal session, run the following command in your Ubuntu (WSL) terminal:**
```
echo 'source ~/dlang/dmd-*/activate' >> ~/.bashrc
```
4. Close VS Code.

*This adds the activation command to your `.bashrc` profile, so the D environment will be set up automatically each time you open a new terminal.*

5. Open the VS Code Terminal.  
   1. You should now be able to run `dmd --version` to verify the installation.
   2. It should have version 2.112.0 or higher.

6. Close Terminal in VS Code.

---


## Step 6: Install D Language Extensions in VS Code

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

sudo apt update && sudo apt install build-essential
```

For second command, answer **Y** if prompted to continue.

Debugging is a powerful way to understand how your program works, line by line. With the VS Code debugger, you can pause your program, inspect variables, and watch how each statement is executed. This is especially helpful for learning D, experimenting with code, as well as finding and fixing bugs.

### Start with the Project Template


1. Clone the starter project repository:
   
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
    - In VS Code, click **File → Open Folder** and select the `/home/bb/dev/d/c00_greetings_d_wsl_ubuntu_template/` directory.
      - If asked: "Do you trust the authors of the files in this folder?"
        - Check: **Trust the authors of all files in the parent folder 'd'** 
        - Click: **Yes, I trust the Authors** button
    
4. **Set a Breakpoint**
   
   - In D source file `source/app.d`, click to the left of line number 7, where you want the program to pause. A red dot will appear (this is a breakpoint).
   
5. **Start Debugging**
   
   - Press **F5** or click the green "Run and Debug" button at the top of the sidebar.
   - The debugger will start, and your program will pause at the breakpoint on line 7. You can now inspect variables, step through code, and use the debug console.
   - Click on **Terminal** tab in bottom **Terminal** pane.
   - Press F10 to advance to next line (*line 8*)
   - Observe that **Greetings from D!** is displayed on the Terminal.
   - Press F5 to complete the program.
     - You may ignore the lines displayed to the Terminal.  These were printed by the environment outside your program.

**Congratulations, your development environment for WSL - Ubuntu on Windows is complete**
**You are ready to start learning D language, the old school way**
