@echo off
if x%1==x goto empty

echo %%1 is not empty
goto stop

:empty
echo %%1 is empty
goto stop

:stop
echo the bat is now ended...
@echo on