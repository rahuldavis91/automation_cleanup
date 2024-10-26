@echo off
echo Starting Automated PC Cleaning Task...

:: Step 1: Delete Temporary Files for Microsoft Apps (Excel, Office)
echo Deleting Microsoft Excel, Office, and Recent Data from AppData...
del /s /q "%localappdata%\Microsoft\Office\Recent\*.*" 2>nul
del /s /q "%appdata%\Microsoft\Excel\*.*" 2>nul
del /s /q "%appdata%\Microsoft\Windows\Recent\*.*" 2>nul
echo Microsoft temporary data deleted.

:: Step 2: Clear Browser Data (Chrome and Edge)
echo Clearing Chrome and Edge History and Cookies...
del /s /q "%localappdata%\Google\Chrome\User Data\Default\Cache\*.*" 2>nul
del /s /q "%localappdata%\Google\Chrome\User Data\Default\Cookies" 2>nul
del /s /q "%localappdata%\Microsoft\Edge\User Data\Default\Cache\*.*" 2>nul
del /s /q "%localappdata%\Microsoft\Edge\User Data\Default\Cookies" 2>nul
echo Chrome and Edge data cleared.

:: Step 3: Block Social Media Sites (Facebook, Instagram, Twitter, Indeed) via Hosts File
echo Blocking social media sites in hosts file...
echo 127.0.0.1 facebook.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 www.facebook.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 instagram.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 www.instagram.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 twitter.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 www.twitter.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 indeed.com >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 www.indeed.com >> %windir%\System32\drivers\etc\hosts
echo Social media sites blocked in hosts file.

:: Step 4: Clear File History from Control Panel
echo Clearing File History...
if exist "%localappdata%\Microsoft\Windows\FileHistory\" rd /s /q "%localappdata%\Microsoft\Windows\FileHistory\" 2>nul
echo File History cleared.

:: Step 5: Delete Browsing History and Cookies via Control Panel
echo Deleting browsing history and cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo Browsing history and cookies cleared.

echo All tasks completed successfully!
pause
