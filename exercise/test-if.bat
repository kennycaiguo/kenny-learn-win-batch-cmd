@echo off
set /p choice=notepad(1) or write(2):
if %choice%==1  (
notepad
) else (
write
)

:c1
rem notepad

:c2
rem write

pause

