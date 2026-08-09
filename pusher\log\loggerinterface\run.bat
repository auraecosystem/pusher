@echo off
setlocal enabledelayedexpansion
title InstaWP CLI Session Manager

:menu
cls
echo ========================================
echo         InstaWP CLI Session Manager
echo ========================================
echo  [1] Interactive Login (Browser)
echo  [2] Token Login (CI/CD or API)
echo  [3] Check Session Status (whoami)
echo  [4] Exit
echo ========================================
set /p choice="Select an option (1-4): "

if "%choice%"=="1" goto browser_login
if "%choice%"=="2" goto token_login
if "%choice%"=="3" goto check_status
if "%choice%"=="4" goto end

echo.
echo [ERROR] Invalid selection, please try again.
timeout /t 2 >nul
goto menu

:browser_login
echo.
echo Opening browser for authentication...
instawp login
pause
goto menu

:token_login
echo.
set /p token="Enter your InstaWP API Token: "
if "%token%"=="" (
    echo [ERROR] Token cannot be empty.
    pause
    goto menu
)
instawp login --token %token%
pause
goto menu

:check_status
echo.
echo Checking current InstaWP session...
instawp whoami
echo.
pause
goto menu

:end
exit /b 0
