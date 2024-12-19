@echo off
:: Get the name of the batch file without the extension
for %%F in ("%~n0") do set "customer_name=%%~F"

set "template_folder=C:\Users\user\Desktop\Template_Folder"
set "destination_folder=C:\Users\user\Desktop"

set "new_folder=%destination_folder%\%customer_name%"
xcopy "%template_folder%" "%new_folder%" /E /I

for /R "%new_folder%" %%F in (*) do (
    set "file=%%~nxF"
    setlocal enabledelayedexpansion
    set "new_file=%customer_name%_!file!"
    ren "%%F" "!new_file!"
    endlocal
)

echo Folder and files copied and renamed with prefix: %customer_name%
