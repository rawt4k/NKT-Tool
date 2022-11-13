@echo off
title Nico Knows Tech's Windows Fix Script v1.1
echo Nico Knows Tech's Windows Fix Script v1.1
echo https://youtube.com/NicoKnowsTech
echo.
echo NOTICE: THIS SCRIPT ONLY RUNS COMMANDS BUILT INTO WINDOWS. NO THIRD PARTY APPLICATIONS OR TOOLS
echo ARE USED BY THIS SCRIPT. THIS SCRIPT WAS DESIGNED TO SIMPLIFY THESE TASKS FOR THE EVERY DAY USER.
echo.
echo.
echo This tool will attempt to fix common Windows issues by running two built-in Windows functions:
echo.
echo 1.) SYSTEM FILE CHECKER
echo 2.) DEPLOYMENT IMAGE SERVICING AND MANAGEMENT TOOL
echo.
echo *SFC will scan your system files for corruption and try to automatically repair them.
echo *DISM will check your Windows installation image for problems and try to automatically repair it.
echo *After these two tasks, the script will try to delete all temporary files to speed up your pc.
echo *After all task have completed, reboot your PC.
echo.
@pause
echo Running tasks...
echo.
echo --- SYSTEM FILE CHECKER STARTED ---
SFC /scannow
echo.
echo --- DISM SCAN STARTED ---
echo.
DISM /Online /Cleanup-Image /ScanHealth
echo.
echo.
echo --- DISM REPAIR STARTED ---
DISM /Online /Cleanup-Image /RestoreHealth
echo Done...
echo.
echo --- Temp File Removal Started ---
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP
echo Done!
echo.
echo All tasks have completed successfully!
echo You can press any key to close this window. Reboot your PC.
@pause
exit
