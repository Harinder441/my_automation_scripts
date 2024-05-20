@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: %0 ^<folder_path^>
    exit /b 1
)

set "folder=%1"

if not exist "%folder%" (
    echo Folder not found: "%folder%"
    exit /b 1
)

if exist "%folder%\.git" (
    echo Can't assume unchanged the full git repo: "%folder%"
    exit /b 1
)

echo Assuming unchanged for each file in "%folder%"

for /r "%folder%" %%i in (*) do (
    if exist "%%i" (
        git update-index --assume-unchanged "%%i"
        echo File assumed unchanged: "%%i"
    )
)

echo Done
exit /b 0
