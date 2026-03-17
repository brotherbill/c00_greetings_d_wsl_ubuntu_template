## Step 1: Install WSL on Windows 11

1. Open PowerShell as Administrator.  Tap Windows key, then type POW, which should select Windows PowerShell.  
   1. Using your mouse, click on: Run as Administrator.
   2. Click Yes on UAC (*User Account Control*) to grant permission to run PowerShell as Administrator.
      1. This will not display on this video recording
   3. PowerShell will launch.  Ensure that the title starts with Administrator.  If not, close PowerShell and start over.
2. Enter command `clear` to clear the body of PowerShell
3. Enter command `wsl --install` by typing it in or copying it from the associated document.
   1. As of the time of this recording, this will fail with a message about a corrupted file.  This happens a few minutes after you press Enter.  You then have 60 seconds to press any alphanumeric key to repair the corrupted file. Then the command will complete without further ado.  We will edit out the time installing both before and after the corrupted file message.
4. Reboot or Restart the computer.  We will stop the video here, expecting that you rebooted the computer.
5. We're back after reboot.  
6. Open PowerShell as Admin, then clear, then run same command again `wsl --install` 
7. This should run uneventfully, and as before, we edit out much of the installation progress.
8. Reboot or Restart the computer.  As before, we will stop the video here, and see you at Step 2.

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

1. Open **VS Code**, close **Welcome** tab
2. Click the **Extensions** icon on the left sidebar (*or press Ctrl+Shift+X*)
3. In the search box, type `wsl`
4. Click on the extension named **WSL** (*by Microsoft*)
5. Click either **Install** button
6. Close all **VS Code** windows
7. Open **VS Code** from the **Windows Start Menu**, then close **Welcome** tab
8. Press **Ctrl+Shift+P** to open the Command Palette, then type and select **WSL: Connect to WSL**
   1. You should see **>< WSL: Ubuntu** on the bottom-left of **VS Code**, with blue background
   2. You are now running **Ubuntu** inside **VS Code**
9. Close **VS Code**.
