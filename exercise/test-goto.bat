@echo off
set /p choice=notepad(1) or write(2):
if %choice%==1  (
goto c1
) else (
goto c2
)

:c1
notepad
goto end

:c2
write

:end
pause