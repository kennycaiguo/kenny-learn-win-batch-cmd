@echo off
title 查找员工信息
:start
set /p kw=请输入你要搜索关的名字：
type contact.txt | findstr %kw%
if %kw%==exit  (goto end) else (goto start)

:end
exit
pause >nul



