: 这个bat文件需要打开3个txt文件
: 使用方法: cmdparams.bat echo.txt t.txt t2.txt
@echo off
type %1
type %2
type %3
echo "Mission Complete!!!"
@echo on