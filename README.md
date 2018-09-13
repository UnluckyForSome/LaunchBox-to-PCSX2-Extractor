# LaunchBox-to-PCSX2-Extractor
Currently the way LaunchBox works, when "Extract ROM archives before running" is ticked, the archives are extracted and then LaunchBox tries to run the extracted files with the emulator. Unfortunately if there are multiple files LaunchBox will look for a .CUE, which PCSX2 does not support.

I compress all of my Playstation 2 games (I have a full set so must do this to fit them on my disk), which saves a lot of space, but means you will have to use the "Extract ROM archives before running" option in LaunchBox. If you have Playstation 2 game set of compressed games matched to something like Redump as I do, you will notice some games contain just an .ISO, whereas others contain .BIN and .CUE. PCSX2 does not need a .CUE file to play the games, but removing all the .CUE files from each archive in a PS2 set would take forever, and would ruin the verification against Redump's PS2 database.

When put as the intermediary between LaunchBox and PCSX2, this script will find the PCSX2-friendly file which needs to be forwarded to the emulator, by first looking for a .ISO, and then if not found, looking for a .BIN

# Usage
This PS script has been converted into a .exe for usage. You can use the .exe provided here, but if you don't trust me (and why would you?) then I have included "ps12exe.ps1", which is a tool to convert PS scripts to .exe files. Using this, you can reveiw the LB2PCSX2.ps1 code, and compile your own .exe file.

Once you have the .exe file ready, all thats left to do is set up the command-line arguments to link everything together. This script needs the following as arguments in the "Default command line parameters" box in the "Edit Emulator" options on LaunchBox:

1. Path to folder where files are being extracted. (Usually Path/To/LaunchBox/7-Zip/Temp)
2. Path to the PCSX2 exe
3. Emulator arguments in triple-quotes (if multiple arguments, surround by another pair of quotes. (For example """--no-gui""", or """"--no-gui""" """--fullscreen""""

An example setup:
![LaunchBox Settings](https://i.imgur.com/eNyA6S6.png)
