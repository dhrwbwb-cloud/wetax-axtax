@echo off
REM Wetax Chrome with remote debugging on 127.0.0.1:9335 (used by the scripts).
REM Ports: hometax 9333, wehago 9334, wetax 9335. Do not reuse another tool's port.
REM Profile is kept in this folder (chrome-profile). Do NOT share that folder (login cookies).
REM --disable-features=LocalNetworkAccessChecks is needed for certificate login. Do not remove.
REM --disable-background-timer-throttling / -backgrounding-occluded-windows / -renderer-backgrounding:
REM   keep Wetax working at full speed while the window is minimized or covered (same as hometax).
REM CalculateNativeWinOcclusion off: copied from hometax (covered popup stopped painting there).
set "HERE=%~dp0"
set "CHROME=C:\Program Files\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" (
  echo Chrome not found. Install Google Chrome first.
  exit /b 1
)
start "" "%CHROME%" --remote-debugging-port=9335 --user-data-dir="%HERE%chrome-profile" --no-first-run --no-default-browser-check --disable-features=LocalNetworkAccessChecks,CalculateNativeWinOcclusion --disable-background-timer-throttling --disable-backgrounding-occluded-windows --disable-renderer-backgrounding --new-window https://www.wetax.go.kr/
