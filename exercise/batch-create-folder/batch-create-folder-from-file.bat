@echo off
for /f %%i  in (list.txt) do md %%i
echo finished...
pause > nul