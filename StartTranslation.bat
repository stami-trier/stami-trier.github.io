@echo OFF
for /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set localIp=%%i
echo IP address: %localIp%
cd C:\Users\julia\Documents\GitHub\stami-trier.github.io
echo.
echo Preparing GitHub page...
echo.
git pull
type part1.txt > index.html
<NUL set /p=%localIp%>> index.html
type part2.txt >> index.html
<NUL set /p=%localIp%>> index.html
type part3.txt >> index.html
git add --all
git commit -m "ip update"
git push
cd C:\Program Files (x86)\Icecast\web\player
echo.
echo Preparing player...
echo.
type part1.txt > index.html
<NUL set /p=%localIp%>> index.html
type part2.txt >> index.html
echo.
echo Preparations finished
cd C:\Program Files (x86)\Icecast\
call icecast.bat