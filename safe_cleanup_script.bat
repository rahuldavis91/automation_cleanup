@echo off
echo Safe PC Cleaning Script Running...

:: Deleting Windows Temporary Files
echo Deleting Windows Temporary files...
del /s /q %temp%\*.* 2>nul
echo Temporary files deleted.

:: Clearing Windows Prefetch Folder
echo Clearing Prefetch files...
del /s /q C:\Windows\Prefetch\*.* 2>nul
echo Prefetch files cleared.

:: Clear Recent Files History
echo Clearing Recent Files history...
del /s /q %userprofile%\Recent\*.* 2>nul
echo Recent files history cleared.

:: Empty Recycle Bin (safe to delete)
echo Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin 2>nul
echo Recycle Bin emptied.

:: Clear Browser Cache Only (Chrome)
echo Clearing Chrome Cache...
del /s /q "%localappdata%\Google\Chrome\User Data\Default\Cache\*.*" 2>nul
echo Chrome cache cleared.

:: Clear Browser Cache Only (Edge)
echo Clearing Edge Cache...
del /s /q "%localappdata%\Microsoft\Edge\User Data\Default\Cache\*.*" 2>nul
echo Edge cache cleared.

:: Optional: Clear System Event Logs (Security Logs)
:: Clear only if needed for extra privacy, but check company policy before using this
:: echo Clearing System Event Logs...
:: wevtutil cl System
:: wevtutil cl Application
:: echo Event logs cleared.

echo All unnecessary data cleared successfully!
pause
