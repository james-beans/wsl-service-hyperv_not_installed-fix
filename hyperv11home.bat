@echo off

echo [hyperv11home] Install starting in 10 seconds.
timeout /T 10
echo [hyperv11home] Installing Hyper-v now...

pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL

echo [hyperv11home] Installed Hyper-v.
echo [hyperv11home]
echo [hyperv11home] Setup instructions:
echo [hyperv11home] - Press WIN + R to go to the run prompt.
echo [hyperv11home] - Type `optionalfeatures.exe` in the box.
echo [hyperv11home] - Scroll down in the new window and check:
echo [hyperv11home]     - Hyper-v
echo [hyperv11home]     - Virtual Machine Platform
echo [hyperv11home]     - Windows Hypervisor Platform
echo [hyperv11home]
echo [hyperv11home] This will ask you to restart and then it will work.
echo [hyperv11home] 
echo [hyperv11home] Warning:
echo [hyperv11home] - If you find and use this DO NOT:
echo [hyperv11home]     - Look up how to fix it. Most results might give solutions to this that might break this.
pause