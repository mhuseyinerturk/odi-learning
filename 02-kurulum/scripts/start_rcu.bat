@echo off
REM RCU'yu yonetici olarak calistir
REM Not: rcu.bat yerine rcu_internal.bat kullanilir (WLS_ORACLE_HOME bug'i)
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
set "JAVA_HOME=C:\Java\jdk1.8.0_202"
cd /d "C:\Oracle\Middleware\Oracle_Home\oracle_common\bin"
echo RCU hazir. Asagidaki komutu yaz:
echo.
echo   call rcu_internal.bat
echo.
cmd /k
