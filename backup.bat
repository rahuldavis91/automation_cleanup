@echo off
echo Starting system clean-up...

REM Step 1: Clear Chrome browsing data
echo Clearing Chrome browsing data...
rmdir /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
rmdir /s /q "%LocalAppData%\Google\Chrome\User Data\Default\History"
rmdir /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cookies"
rmdir /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Web Data"

REM Step 2: Clear Edge browsing data
echo Clearing Edge browsing data...
rmdir /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"
rmdir /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\History"
rmdir /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cookies"
rmdir /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data"

REM Step 3: Clear Excel and Office recent files in AppData Roaming
echo Clearing recent files from Excel and Office...
del /q "%AppData%\Microsoft\Excel\*.xls*"
del /q "%AppData%\Microsoft\Office\Recent\*"
del /q "%AppData%\Microsoft\Windows\Recent\*"

REM Step 4: Clear Unsaved Files in Local AppData
echo Clearing unsaved Office files...
del /q "%LocalAppData%\Microsoft\Office\UnsavedFiles\*"

REM Step 5: Clear Temp and Prefetch Files
echo Clearing Temp and Prefetch files...
del /q /s "%Temp%\*"
del /q /s "C:\Windows\Prefetch\*"

REM Step 6: Clear Control Panel File History
echo Clearing Control Panel File History...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1

REM Step 7: Clear Internet Options Browsing History from Control Panel
echo Clearing Internet Options browsing history...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

echo Clean-up completed successfully!
pause
