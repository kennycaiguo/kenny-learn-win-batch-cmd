@echo off
echo 1.Show files of current dir.
echo 2.Show  .txt files
echo 3.Show .bat files.

choice /C 123 /M "Please Choose(1-3) ==}"

if %errorlevel%==1 goto action1
if %errorlevel%==2 goto action2
if %errorlevel%==3 goto action3

:action1
 dir
 goto end

:action2
 dir *.txt
 goto end

 :action3
 dir *.bat
 goto end

 :end
 echo That's all
@echo on
