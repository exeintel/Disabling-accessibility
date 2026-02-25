@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:menu
cls
echo ==============================
echo     Accessibility Settings
echo ==============================
echo.
echo 0. Exit program
echo 1. Disable accessibility features
echo 2. Enable accessibility features
echo.
set /p choice="Enter your choice (0-2): "

if "%choice%"=="0" goto exit_program
if "%choice%"=="1" goto disable_features
if "%choice%"=="2" goto enable_features
echo Invalid choice! Please try again.
timeout /t 2 >nul
goto menu

:disable_features
echo.
echo Disabling accessibility features...
echo.

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Preference" /v "On" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\ScreenMagnifier" /v "MagnifierUIWindowShow" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Narrator\NoRoam" /v "WinEnterLaunchEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Narrator\NoRoam" /v "InstanceClsid" /t REG_SZ /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "HighContrast" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "58" /f

echo Applying changes...
timeout /t 1 >nul
rundll32.exe user32.dll, UpdatePerUserSystemParameters

echo.
echo Accessibility features have been disabled!
echo Some changes may require restart to take effect.
echo.
pause
goto menu

:enable_features
echo.
echo Enabling accessibility features...
echo.

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "510" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "126" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "62" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Preference" /v "On" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ScreenMagnifier" /v "MagnifierUIWindowShow" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Narrator\NoRoam" /v "WinEnterLaunchEnabled" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "HighContrast" /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "62" /f

echo Applying changes...
timeout /t 1 >nul
rundll32.exe user32.dll, UpdatePerUserSystemParameters

echo.
echo Accessibility features have been enabled!
echo Some changes may require restart to take effect.
echo.
pause
goto menu

:exit_program
echo.
echo Exiting program...
timeout /t 1 >nul
exit