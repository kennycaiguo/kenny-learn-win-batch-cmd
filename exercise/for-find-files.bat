@echo off
:: .表示当前目录
for /r . %%i in (*.txt) do echo %%i 
pause > nul