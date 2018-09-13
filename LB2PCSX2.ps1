# Sample string to put in LaunchBox's "Default Command-Line Parameters" is below:
# "C:\Users\Joe\LaunchBox\7-Zip\Temp" "C:\PROGRA~2\PCSX2\pcsx2.exe" """"--nogui""" """--fullscreen""""

param (
    [Parameter(Mandatory=$True)]
    [string]$launchboxExtractionPath, #File location of where LaunchBox will extract the  game
    [Parameter(Mandatory=$True)]
    [string]$pcsx2Path, # Location of the PCSX2 .exe file
    [Parameter(Mandatory=$True)]
    [string]$pcsx2Arguments, # PCSX2 Arguments
    [Parameter(Mandatory=$True)]
    [string]$launchboxGameArchive # .zip/.7z etc archive of the game
)

# Set location to where the files have been extracted
Set-Location -Path $launchboxExtractionPath

# Look for .BIN first, and then .ISO
$extractedGameFile = Get-Item * | Where-Object -Property Extension -Match -Value 'BIN|ISO' | Select-Object -Last 1 -ExpandProperty FullName

# Launch emulator
Start-Process """$pcsx2Path""" -ArgumentList $pcsx2Arguments, """$extractedGameFile""" -Wait