@echo off
cls
echo Website checking process started...
echo.

:: List of websites to check (20 websites added)
set "sites[1]=https://www.facebook.com"
set "sites[2]=https://www.linkedin.com"
set "sites[3]=https://www.twitter.com"
set "sites[4]=https://www.instagram.com"
set "sites[5]=https://www.naukri.com"
set "sites[6]=https://www.indeed.com"
set "sites[7]=https://www.monster.com"
set "sites[8]=https://www.glassdoor.com"
set "sites[9]=https://www.jobstreet.com"
set "sites[10]=https://www.reddit.com"
set "sites[11]=https://www.youtube.com"
set "sites[12]=https://www.google.com"
set "sites[13]=https://www.amazon.com"
set "sites[14]=https://www.bbc.com"
set "sites[15]=https://www.cnn.com"
set "sites[16]=https://www.apple.com"
set "sites[17]=https://www.microsoft.com"
set "sites[18]=https://www.pinterest.com"
set "sites[19]=https://www.snapchat.com"
set "sites[20]=https://www.tiktok.com"

:: Loop through all websites and check their status
for /L %%i in (1, 1, 20) do (
    echo Checking website: !sites[%%i]!
    curl -Is !sites[%%i]! | findstr "HTTP/1.1" >nul
    if errorlevel 1 (
        echo !sites[%%i]! is DOWN or unreachable.
    ) else (
        echo !sites[%%i]! is UP and reachable.
    )
    echo.
)

:: End of script
echo Website check process completed.
pause
