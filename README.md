This script is designed specifically for **LaunchBox**. For similar functionality (extracting compressed files temporarily before passing onto an emulator) using a different front-end and even different game types, try my [7zEmuPrepper](https://github.com/UnluckyForSome/7zEmuPrepper).

# LaunchBox-to-PCSX2-Extractor
Currently the way LaunchBox works, when **"Extract ROM archives before running"** is ticked, the archives are extracted and then LaunchBox tries to run the extracted files with the emulator. Unfortunately, if there are multiple files extracted, LaunchBox will look for and prioritise a `.CUE` file, which PCSX2 does not support. This will result in PCSX2 not functioning.

I compress all of my PlayStation 2 games (I have a full set so must do this to fit them on my disk) - which saves a lot of space, but means I have to use the **"Extract ROM archives before running"** option in LaunchBox. If you have a large set of compressed PlayStation 2 games matched to something like **Redump** as I do, you will notice some games use just a `.ISO`, whereas others use `.BIN` and `.CUE`. PCSX2 does not need a `.CUE` file to play the games, but removing all the `.CUE` files from each archive in a PlayStation 2 set would take forever, and would ruin the verification against **Redump**'s PS2 database.

When put as the intermediary between **LaunchBox** and **PCSX2**, this script will find the **PCSX2-friendly** file which needs to be forwarded to the emulator, by first looking for a `.ISO`, and then if not found, looking for a `.BIN`

# Usage:
This **PowerShell** script has been converted into a `.exe` for usage. You can use the `.exe` provided here, but if you don't trust me (and why would you?) then I have also included **"PS2EXE.ps1"**, which is the tool I used that converts **PowerShell** scripts to `.exe` files. Using this, you can review the **LB2PCSX2.ps1** code, and compile your own `.exe` file. If you open up a PowerShell window, navigate to the directory **"PS2EXE.ps1"** and **LB2PCSX2** are both in, and type `./ps2exe.ps1 ./LB2PCSX2.ps1 ./LB2PCSX2.exe -noconfig` then your own `.exe` file will be compiled. See the [Microsoft PS2EXE Download Page](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5) for more information on how to use this (it's super easy).

Once you have the `.exe` file ready, all that’s left to do is set up the command-line arguments in the "Edit Emulator" options in LaunchBox, which will link everything together. Firstly, select the new `.exe` you compiled (or downloaded, thanks for trusting me!) as the **"Emulator Application Path"**. Then, this script needs the following as arguments in the **"Default Command-Line Parameters"** section:

1. Path to folder where files are being extracted. (Usually `X:/Your/Path/To/LaunchBox/7-Zip/Temp`)
2. Path to the PCSX2 `.exe`. (`X:/Your/Path/To/PCSX2/pcsx2.exe`)
3. Emulator arguments in **triple-quotes**. If you have multiple emulator arguments to pass, you need to surround these in *ANOTHER* pair of quotes. For example, for a single argument: `"""--no-gui"""` and for a double argument: `""""--no-gui""" """--fullscreen""""`

Lastly, remove anything in LaunchBox's "AutoHotkey Script", as this can cause files to be left behind when exiting PCSX2.

# An Example Setup:
**Emulator Application Path:** `..\..\..\Program Files (x86)\PCSX2\PCSX2Prepper.exe`

**Default Command-Line Parameters:** `"C:\Users\Joe\LaunchBox\7-Zip\Temp" "C:\Program Files (x86)\PCSX2\pcsx2.exe" """"--nogui""" """--fullscreen""""`

![LaunchBox Settings](https://i.imgur.com/eNyA6S6.png)
