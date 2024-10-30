@echo off
setlocal

:: Define the password for IT Technicians
set "password=1234"

:: Prompt for IT Technician confirmation
set /p isITTech="Are you an IT Technician? (yes/no): "
if /i not "%isITTech%"=="y" (
    echo You must be an IT Technician to run this script.
    exit /b
)

:: Prompt for password input
set /p input_password="Enter password to proceed: "
if not "%input_password%"=="%password%" (
    echo Incorrect password. Exiting...
    exit /b
)



:: Check if the user is a telecaller; skip if the user is an admin
set "username=%username%"
if /i "%username%"=="admin" (
    echo Admin user detected, skipping cleanup.
    exit /b
)

echo Starting cleanup for telecaller user: %username% ...

:: Clear Chrome data (do not delete cookies or cache to maintain login)
echo Clearing Chrome data...
rd /s /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\History*"

:: Clear Temporary Files
echo Clearing temporary files...
rd /s /q "%USERPROFILE%\AppData\Local\Temp"
rd /s /q "%windir%\Temp"

:: Clear Recent Files
echo Clearing recent files...
del /f /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\*"

:: Clear Microsoft Office recent files
echo Clearing Microsoft Office recent files...
del /f /q "%USERPROFILE%\AppData\Roaming\Microsoft\Office\Recent\*"
del /f /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations\*"
del /f /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*"

:: Clear Run Command History from Registry
echo Clearing Run command history...
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f

:: Clear Downloads folder
echo Clearing Downloads folder...
del /f /q "%USERPROFILE%\Downloads\*"

echo Cleanup complete for user: %username%.
pause

