@echo off
:: Ensure script runs as administrator
:: Check social media site access for 15 common sites, then perform cleanup for user accounts only.

echo Starting social media access check and cleanup process for user accounts...

:: Define an output file for results
set outputFile=%userprofile%\Desktop\SocialMediaCheckResults.txt
echo Checking social media site access... > "%outputFile%"

:: List of social media and entertainment sites to check
set sites=facebook.com instagram.com twitter.com linkedin.com snapchat.com reddit.com pinterest.com tiktok.com tumblr.com youtube.com netflix.com hulu.com spotify.com discord.com indeed.com

:: Check if each site is accessible and record the result
for %%s in (%sites%) do (
    echo Checking %%s...
    ping -n 1 %%s >nul
    if %errorlevel%==0 (
        echo %%s is Available >> "%outputFile%"
    ) else (
        echo %%s is Not Accessible >> "%outputFile%"
    )
)

:: Pause briefly before cleanup to avoid system hang
timeout /t 2

:: Clear Chrome and Edge browser history for each user profile
for /d %%u in (%systemdrive%\Users\*) do (
    echo Clearing Chrome history for %%u...
    taskkill /f /im chrome.exe 2>nul
    del /s /q "%%u\AppData\Local\Google\Chrome\User Data\Default\History" 2>nul
    del /s /q "%%u\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*" 2>nul
    del /s /q "%%u\AppData\Local\Google\Chrome\User Data\Default\Cookies" 2>nul

    echo Clearing Edge history for %%u...
    taskkill /f /im msedge.exe 2>nul
    del /s /q "%%u\AppData\Local\Microsoft\Edge\User Data\Default\History" 2>nul
    del /s /q "%%u\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*.*" 2>nul
    del /s /q "%%u\AppData\Local\Microsoft\Edge\User Data\Default\Cookies" 2>nul
)

:: Clear temporary data paths for Microsoft Office and Windows recent files for each user profile
for /d %%u in (%systemdrive%\Users\*) do (
    echo Cleaning temp and recent files for %%u...
    del /s /q "%%u\AppData\Roaming\Microsoft\Office\Recent\*.*" 2>nul
    del /s /q "%%u\AppData\Roaming\Microsoft\Windows\Recent\*.*" 2>nul
    del /s /q "%%u\AppData\Local\Microsoft\Office\UnsavedFiles\*.*" 2>nul
)

:: Clear Recent Run Command history for each user profile
for /d %%u in (%systemdrive%\Users\*) do (
    echo Clearing Recent Run Command history for %%u...
    reg delete "HKEY_USERS\%%u\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f 2>nul
)

:: Clear Downloads folder for each user account
for /d %%u in (%systemdrive%\Users\*) do (
    echo Clearing Downloads folder for %%u...
    del /s /q "%%u\Downloads\*.*" 2>nul
)

:: Clear DNS cache to ensure any changes are applied
echo Clearing DNS cache...
ipconfig /flushdns

echo User account cleanup completed successfully. Social media access check results saved on the desktop.
pause
