@echo off
echo txt files >d:\txts.txt
:: .表示当前目录
for /r . %%i in (*.txt) do echo %%i >>d:\txts.txt
echo Finish
pause > nul