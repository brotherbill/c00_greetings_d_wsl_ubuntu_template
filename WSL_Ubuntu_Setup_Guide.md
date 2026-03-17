# WSL Ubuntu Setup Guide

This guide will walk you through setting up **WSL** for **Ubuntu**, installing **Ubuntu** and configuring **VS Code** and **D** Language development on a fresh **Windows 11** device. (*This will also work for a mature development machine*)

**Preamble**

**WSL Ubuntu** is **Windows Subsystem for Linux**, with distro **Ubuntu** installed to run in **VS Code** as well as **PowerShell**.  **WSL Ubuntu** is not a full Virtual Machine (**VM**), and does not include **Ubuntu** graphical apps such as **Terminal** and **Files**.

Using **VS Code** and **PowerShell** provides an adequate environment to code and debug **D** projects in a **Linux Ubuntu** environment, where everything **just works**.

## Step 0: About the instructor and the course 

- This step is optional.  You may skip it if you are an experienced developer.  If you are a newbie, consider reading it in full.  It is fairly short.
- I'm Brother Bill, your instructor on your path to learning D language.  FWIW, I am an old timer, cutting my teeth on punch cards and machine language programming on an IBM 1620 mini-computer back in 1970.  Since then I've worked for many companies and made many mistakes, some of which I learned something from.
- The fact that you are taking this course, perhaps just the free parts, means that you don't need convincing as to why D language is worth learning and mastering.  You may find this easily with a browser search.
- We want to get to running and debugging the traditional Greetings, World app as quickly as possible, and this installation video is designed to do just that.  Just enough narration to guide you to cover the steps needed to do this.
- You don't need to know anything about the commands used in the installation.  Just blindly follow the instructions to the letter.  (*This is not the time for improvisation*)
- Remember that although Windows is generally case ignorant, Ubuntu Linux is generally case sensitive, with certain exceptions such as URL names.
  - Use copy and paste to avoid typos, and have a smooth voyage of this nine part installation series.
    - Don't rush to press Enter after the copy/paste.
    - Breathe and double check the spelling, then press Enter
- You will notice that the videos are simply edited, mostly to get the captions right, the umm's removed, and that's about it.  If you are expecting a highly polished video with Power Point presentations, drawing animated red rectangles around highlighted code, background music and transitional effects, this is not the course for you.
- Let's commence installing WSL on Windows 11, as this is necessary to be able to start coding and debugging D language projects in WSL (Ubuntu)

## Step 1: Install WSL on Windows 11

1. Open **PowerShell** as **Administrator**
   1. **Check:** The terminal window title should say `Administrator: Windows PowerShell` if you started it as an admin.  If it just says `Windows PowerShell`, you are not running as an administrator.  Close it and try again.
2. Run `wsl --install`
   1. This command installs WSL
      1. This takes several minutes to run and is not chatty
      2. If it states that it is corrupted, press any key to repair.  (*You then have 60 seconds to press any key, but not the ENTER key*)
3. Restart the computer
4. Run `wsl --install` again
   1. This does no harm, has no corruption message, and does work
5. Restart the computer
   

## Step 2: Install Ubuntu in WSL

1. Open **PowerShell**
2. Run: `wsl --install -d Ubuntu`
   1. This will download and install the latest **Ubuntu** distribution for **WSL**
   2. When installation completes, a new window will open to finish **Ubuntu** setup
   3. When **Ubuntu** setup starts, you will be prompted to create a user account
      1. The prompt may say **Unix user account**, this is simply your Linux username
      2. Choose a short, memorable username.  The name will appear in your terminal prompt and take up space.  For example, use `bb` for Brother Bill
      3. Enter a password when prompted.  This password is used for administrative `sudo` commands.
         1. A strong password has an Uppercase character, lowercase character, a digit and a punctuation character
      4. Then confirm the password by entering it again
   4. You are now in Ubuntu mode in **PowerShell**
   5. Close **PowerShell**
   6. Close **Welcome to Windows Subsystem for Linux** window


## Step 3: Install Visual Studio Code in Windows

1. Visit: https://code.visualstudio.com
2. Click the **Download for Windows** button and run the installer
3. Follow the setup wizard to complete installation (*accept defaults unless you have a preference*)
   1. You may want to check **Create a desktop icon** to make it easy to open VS Code by double clicking its icon on the Desktop
4. After installation, close **VS Code** and your browser

## Step 4: Install WSL Extension and Connect to Ubuntu in VS Code

1. Open **VS Code**
2. Close **Welcome** tab
3. Click the **Extensions** icon on the left sidebar (*or press Ctrl+Shift+X*)
4. In the search box, type `wsl`
5. Click on the extension named **WSL** (*by Microsoft*)
6. Click either **Install** button
7. Close all **VS Code** windows
8. Open **VS Code** from the **Windows Start Menu**.
9. Close **Welcome** tab
10. Press **Ctrl+Shift+P** to open the Command Palette, then type and select **WSL: Connect to WSL**
    1. You should see **>< WSL: Ubuntu** on the bottom-left of **VS Code**, with blue background
    1. You are now running **Ubuntu** inside **VS Code**
11. Close **VS Code**.

## Step 5: Install D Language Tools in Ubuntu (WSL)

1. Open **VS Code**, close **Welcome** tab
3. Open the **Terminal** with **Terminal > New Terminal**
4. Run `wget https://dlang.org/install.sh -O - | bash`
   1. This will download and run the **D** installer script
5. Run `echo 'source ~/dlang/dmd-*/activate' >> ~/.bashrc`
6. Close **VS Code**
7. Open **VS Code**
8. Open **Terminal**
9. Run `dmd --version` to verify the installation
   1. It should have version 2.112.0 or higher
10. Close **VS Code**

## Step 6: Install D Language Extensions in VS Code

1. Open **VS Code**, close **Welcome** tab
2. Click **Extensions** icon on left sidebar
3. Using the Search bar, install each of these VS Code extensions
   1. **code-d** (*by WebFreak*)
      1. If asked **Do you trust publishers "WebFreak" and "Holger Benl"?**, click **Trust Publishers and Install** button
   2. **Native Debug** (*by WebFreak*)
   3. **C/C++** (*by Microsoft*)
4. Close **VS Code**

## Step 7: Setup for Debugging D Language in VS Code

1. Open **VS Code**, close **Welcome** tab
2. Open **Terminal**
3. Run `sudo apt-get update && sudo apt-get install -y gdb`
4. Run `sudo apt update && sudo apt install build-essential`
   1. Press Enter key (*for Yes*) if prompted to continue
5. Run `sudo apt update`
6. Run `sudo apt install -y gdb`
7. Close **VS Code**

## Step 8: Start with the Project Template

Debugging is a powerful way to understand how your program works, line by line.
With the VS Code debugger, you can pause your program, inspect variables, and watch how each statement is executed.  This is especially helpful for learning D, experimenting with code, as well as finding and fixing bugs.

1. Open **VS Code**, close **Welcome** tab
2. Open **Terminal**
3. Clone the starter project repository
   1. Run `git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template.git`
      1. This is one line, even though it may wrap around
4. Place the template and all your course projects in the directory `~/dev/d/` in your Ubuntu home folder.
   1. Run `mkdir -p ~/dev/d`
   2. Run `cd ~/dev/d`
   3. Run `git clone https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template.git`
      1. This will create a folder named `c00_greetings_d_wsl_ubuntu_template` inside `~/dev/d/` with all the necessary files and configuration for **D** development and debugging.
5. **Warning:**  This template is intended only for testing your **D** installation and as a base for creating new **D** language projects.  It provides a ready-to-use programming environment with debugging support, so you can avoid tedious setup steps.  **Do not edit or delete this template folder**.
6. **File > Open Folder** and select **/home/bb/dev/d/c00_greetings_d_wsl_ubuntu_template** folder
   1. If asked **Do you trust the authors of the files in this folder?**
      1. Check **Trust the authors of all files in the parent folder 'd'**
      2. Click **Yes, I trust the Authors** button
7. Close **VS Code**

## Step 9: Debug D with F5

1. Open **VS Code**, close **Welcome** tab
2. **Set a breakpoint**
   1. **Open source/app.d**
   2. Click to the left of line 5 to set a breakpoint.
      1. A red dot will appear, which is the breakpoint.
3. **Start Debugging**
   1. Press **F5** to start debugging
      1. The debugger will start, and your program will pause at the breakpoint.  You can now inspect variables, step through code and use the debug console.
4. Close **VS Code**

**Congratulations, your development environment is set up, and you may now start the main body of the course, learning D language**
