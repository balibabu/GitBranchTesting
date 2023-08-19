@ECHO OFF
SETLOCAL

REM Get the current date in the format yyyymmdd
FOR /F "usebackq tokens=1-3 delims=-/" %%A IN (`echo %DATE%`) DO (
    SET "YYYY=%%C"
    SET "MM=00%%B"
    SET "DD=00%%A"
)
SET "TODAY=%YYYY%%MM:~-2%%DD:~-2%"

ECHO ====== %TODAY% ========
ECHO Auto pulling, adding, committing, and pushing on Github.

ECHO -------- Pulling --------
git pull
git status

ECHO -------- Adding --------
git add .
git status

ECHO -------- Committing --------
git commit -m "updating timeline"

ECHO -------- Creating and Pushing Branch --------
git checkout -b %TODAY%
git push origin %TODAY%

ECHO Don't Just Have a Good Day, Have a Great Day
PAUSE
exit
