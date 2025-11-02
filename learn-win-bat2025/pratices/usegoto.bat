@echo off
:loop
if x%1==x goto stop

echo Displying %1
type %1
echo. 

shift
goto loop

:stop
echo No more file to display,script is now quit
@echo on