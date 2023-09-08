@echo off
echo 请勿关闭本窗口
echo 正在清理系统垃圾文件，请稍等....
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md  %windir%\temp
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q "%userprofile%\cookies\*.*"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\Temporary Internet Files\*.*"
echo 清理系统垃圾完成！
pause > nul
