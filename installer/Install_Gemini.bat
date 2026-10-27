@echo off
chcp 65001 >nul
title Установка Gemini by kaiser (Vivo & iQOO OriginOS)
cls
echo =====================================================================
echo       GEMINI BY KAISER v3.0 - УСТАНОВЩИК В 1 КЛИК ДЛЯ ORIGINOS
echo =====================================================================
echo.
echo Подключите ваш Vivo или iQOO по USB к компьютеру.
echo Убедитесь, что включена "Отладка по USB" (USB Debugging).
echo.
pause

set ADB="%~dp0platform-tools\adb.exe"

echo.
echo [1/4] Проверка подключения устройства...
%ADB% wait-for-device
echo [OK] Устройство обнаружено!
echo.

echo [2/4] Установка приложения Gemini by kaiser v3.0...
%ADB% install -r -d "%~dp0Gemini_by_kaiser_v3.0.apk"
echo.

echo [3/4] Выдача необходимых системных разрешений...
%ADB% shell pm grant com.kaiserdev.geminitrigger android.permission.WRITE_SECURE_SETTINGS
%ADB% shell pm grant com.kaiserdev.geminitrigger android.permission.SYSTEM_ALERT_WINDOW
echo.

echo [4/4] Активация перехвата кнопки питания в OriginOS...
%ADB% shell settings put secure long_press_power_key 1
%ADB% shell settings put secure power_button_long_press 1
echo.

echo =====================================================================
echo                    УСТАНОВКА УСПЕШНО ЗАВЕРШЕНА!
echo =====================================================================
echo.
echo Теперь зажатие кнопки питания на 0.5 сек открывает Google Gemini!
echo Двойной тап по задней крышке открывает Circle to Search.
echo.
pause
