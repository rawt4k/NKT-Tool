@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------   
title Nico Knows Tech's Windows Fix Script v1.1
color 90
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
echo *After Temp Removal, Windows Updates will reset
echo *After all task have completed, Your screen will turn green and you can reboot your PC.
echo.
@pause
echo Running tasks...
color 60
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
rd /s /q c:\windows\tempor~1
del /f /q c:\windows\tempor~1
rd /s /q c:\windows\temp
del /f /q c:\windows\temp
rd /s /q c:\windows\tmp
del /f /q c:\windows\tmp
rd /s /q c:\windows\ff*.tmp
del /f /q c:\windows\ff*.tmp
rd /s /q c:\windows\history
del /f /q c:\windows\history
rd /s /q c:\windows\cookies
del /f /q c:\windows\cookies
rd /s /q c:\windows\recent
del /f /q c:\windows\recent
rd /s /q c:\windows\spool\printers
del /f /q c:\windows\spool\printers
del c:\WIN386.SWP
echo Done!
echo.
echo --- Reset Windows Updates Starting ---
echo.
net stop wuauserv
@pause
net start wuauserv
echo.
echo Task completed successfully...
echo.
color 20
echo All tasks have completed successfully!
echo You can press any key to close this window. Reboot your PC.
@pause
exit
