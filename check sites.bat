@echo off
echo Creating test files in specified locations...

:: 1. Create Chrome Test Files
echo Creating Chrome test files...
echo Test File > "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache\test_file.txt"
echo Test File > "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\History\test_file.txt"
echo Test File > "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cookies\test_file.txt"
echo Test File > "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Local Storage\test_file.txt"
echo Chrome test files created.
echo.

:: 2. Create Edge Test Files
echo Creating Edge test files...
echo Test File > "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\test_file.txt"
echo Test File > "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\History\test_file.txt"
echo Test File > "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Cookies\test_file.txt"
echo Test File > "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Local Storage\test_file.txt"
echo Edge test files created.
echo.

:: 3. Create Office Recent Files
echo Creating Office recent files...
echo Test File > "C:\Users\%username%\AppData\Roaming\Microsoft\Office\Recent\test_file.xlsx"
echo Test File > "C:\Users\%username%\AppData\Local\Microsoft\Office\UnsavedFiles\test_file.xlsx"
echo Office recent files created.
echo.

:: 4. Create Windows Recent Files
echo Creating Windows Recent files...
echo Test File > "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\test_file.lnk"
echo Windows Recent files created.
echo.

:: 5. Create Temp Files
echo Creating Temp files...
echo Test File > "C:\Users\%username%\AppData\Local\Temp\test_file.txt"
echo Temp files created.
echo.

:: 6. Create Prefetch Files
echo Creating Prefetch files...
echo Test File > "C:\Windows\Prefetch\test_file.txt"
echo Prefetch files created.
echo.

:: 7. Create Internet Explorer History (Optional)
echo Creating Internet Explorer history (if IE is used)...
echo Test File > "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\test_file.txt"
echo Internet Explorer history created.
echo.

echo All test files created successfully!
pause