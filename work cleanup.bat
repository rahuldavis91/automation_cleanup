@echo off
cls
setlocal

:: Set the predefined password
set "password=1234"

:: Prompt for password
set /p "userInput=Enter password to continue: "

:: Check if the entered password matches the predefined password
if "%userInput%"=="%password%" (
    echo Password correct! Starting automated cleanup process...
    echo.
    goto start_cleanup
) else (
    echo Incorrect password! Exiting...
    exit /b
)

:start_cleanup
:: 1. Clear Chrome Data
echo Clearing Chrome data...
rd /s /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache"
rd /s /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\History"
rd /s /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cookies"
rd /s /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Local Storage"
echo Chrome data cleared.
echo.

:: 2. Clear Edge Data
echo Clearing Edge data...
rd /s /q "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Cache"
rd /s /q "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\History"
rd /s /q "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Cookies"
rd /s /q "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Local Storage"
echo Edge data cleared.
echo.

:: 3. Delete Recent Files in Excel and Office
echo Deleting recent Excel and Office files...
del "C:\Users\%username%\AppData\Roaming\Microsoft\Office\Recent\*.*" /F /Q
del "C:\Users\%username%\AppData\Local\Microsoft\Office\UnsavedFiles\*.*" /F /Q
echo Recent files cleared.
echo.

:: 4. Delete Windows Recent Files
echo Deleting Windows Recent Files...
del "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\*.*" /F /Q
echo Windows Recent Files cleared.
echo.

:: 5. Delete Temp and Prefetch Files
echo Deleting temporary and prefetch files...
del "C:\Users\%username%\AppData\Local\Temp\*.*" /F /Q
del "C:\Windows\Prefetch\*.*" /F /Q
echo Temp and Prefetch files cleared.
echo.

:: 6. Clear Control Panel File History
echo Clearing Control Panel File History...
PowerShell -Command "Clear-History"
echo File History cleared.
echo.

:: 7. Clear Internet Explorer browsing history
echo Clearing Internet Explorer browsing history...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo Internet Explorer browsing history cleared.
echo.

echo Cleanup process complete.
pause