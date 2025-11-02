## useful win  commands
#### 1.cls 清理屏幕的目录

~~~dos
cls
~~~



####  2.dir显示当前驱动器或者文件夹里面的目录和文件

~~~dos
dir 
dir *.txt
dir c:\windows
dir c:\windows /w /p

~~~

#### 3.type 显示文本文件的内容

```dos
type 文件名
type t.txt
```

![image-20251102120711395](assets/image-20251102120711395.png)

#### 4.copy拷贝文件

```dos
copy a.bat b.bat
copy a.txt b.txt /v 参数/v是用来检查拷贝有没有错误
合并拷贝:把多个文件的内容合并起来然后拷贝到一个文件在
copy *.txt total.txt
copy con: x.txt 在命令行在新建一个文本文件x.txt并且进入编辑模式,编辑完后可以按ctrl+z,然后回车退出
copy t.txt con: 显示t.txt的内容
注意: 上面的命令中的con: 在cmd窗口是有的,在powershell命令窗口中是没有的.
```

#### 5.ren (rename)文件重命名

```dos
ren file1.txt file.txt
```



#### 6.del (erase)删除指定的文件

```dos
del welcome.txt
# 删除指定文件夹里面的所有文件
del test 就是删除test文件夹里面的使用文件,test文件夹保留,相当于del D:\learn-win-bat\test\*,因为这里test文件夹是D:\learn-win-bat文件夹的子文件夹
erase file1.txt 删除文件file1.txt
del *.* 删除当前目录下面的所有文件
del *.bas /p 删除所有以bas结尾的文件,并且需要你确认.
```

#### 7.date重新设置系统日期,会先显示当前系统日期,然后等待你输入新日期

![image-20251102120615588](assets/image-20251102120615588.png)

#### 8.time重新设置当前日期,会先显示当前日期,然后等待你输入新日期,如果不输入,直接按回车

![image-20251102120335406](assets/image-20251102120335406.png)

#### 9. ver显示当前windows操作系统的版本

![image-20251102120529089](assets/image-20251102120529089.png)

#### 10.vol显示磁盘卷标信息

![image-20251102121001596](assets/image-20251102121001596.png)

#### prompt用来设置命令提示符格式

##### 可选格式如下

![image-20251102121506970](assets/image-20251102121506970.png)

![image-20251102121709191](assets/image-20251102121709191.png)

#### 11.comp比较两个文件的大小是否相同

![image-20251102122242854](assets/image-20251102122242854.png)

#### 12.chkdsk检查磁盘是否ok

![image-20251102122455583](assets/image-20251102122455583.png)

##### 从结果上看,这个d盘是good的

#### 13. recover可以恢复损坏的文件

## win batch command

#### 1>echo可以显示文本到控制台上面,也可以输出到文件

```batch
echo hello
echo This is the message from echo > echo.txt创建一个把内容输出到echo.txt文件中
```

![image-20251102124353324](assets/image-20251102124353324.png)

##### echo脚本实例echotest.bat

```win batch
echo echo test sample
echo off
dir *.bat
echo
echo on
echo
dir *.bat
```

###### ###### 效果

![image-20251102124919291](assets/image-20251102124919291.png)

#### 2>rem批处理文件里面的注释

#### 3>pause暂停批处理文件的执行

###### 小例子:testpause.bat

```win batch
dir 
pause
dir c:\windows
```

###### 效果

![image-20251102130636263](assets/image-20251102130636263.png)

#### 4>goto label转到label处执行

###### 小例子:gototest.bat

```win batch
dir
goto show
dir "C:\Program Files"

:show
type t.txt
```

###### 效果

![image-20251102132844228](assets/image-20251102132844228.png)

######  注意: 如果把label放在开头,然后在下面使用goto label,这样子会触发死循环,因为label在最上面的话,执行了label的语句后会继续往下执行,此时如果执行到了goto语句,又会转到label处执行,执行完又往下,等一下又会等等goto语句,所以就会一直执行,变为死循环.如果把label的语句放在最后,执行完label下面的语句后,程序就会结束,这样子会导致goto下面是语句无法执行.所以goto语句非常危险,如果不是必须,尽量必要使用.

#### 5> for指令,用来实现循环

###### for语句小实例fortest.bat

```win batch
for %%b in (c: d: e: f:) do vol %%b
```

###### 效果

![image-20251102133952578](assets/image-20251102133952578.png)

###### for语句小例子2,fortest2.bat

```win batch
for %%b in (*.txt) do type %%b
```

###### 效果

![image-20251102134707720](assets/image-20251102134707720.png)

#### 6> 给脚本添加命令行参数

###### 小例子 cmdparams.bat,你可以选择关闭回显或者不关闭也行

```
: 这个bat文件需要打开3个txt文件
: 使用方法: cmdparams.bat echo.txt t.txt t2.txt
@echo off
type %1
type %2
type %3
echo "Mission Complete!!!"
@echo on
```

###### 关闭回显的效果

![image-20251102140112516](assets/image-20251102140112516.png)

##### 注意,变量最多只能使用10个而且%0有特殊意义

#### 7>if语句,重要

##### 格式

```win batch
1.if [not] string1 == string2 命令
2.if [not] exists xx 命令
 
```

###### if小例子 testif1.bat

```win batch
@echo off
if %1 == show type %2
```

###### 效果

![image-20251102144116631](assets/image-20251102144116631.png)

###### if小例子testif2.bat

```
@echo off
: 如果找到了test文件夹,就把它里面的所有文件删除
if exist test del test
```

###### 效果

![image-20251102144724482](assets/image-20251102144724482.png)

#### 8>choice + if %errorlevel%==xx

##### 基本语法

```win batch
choice   ==> [Y,N]?
choice /c:1234 choose one (1-4)

```

##### choice + if %errorlevel%==xx 小例子

```win batch
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

```

###### 效果

![image-20251102153611679](assets/image-20251102153611679.png)

![image-20251102153819313](assets/image-20251102153819313.png)

![image-20251102153902855](assets/image-20251102153902855.png)

#### 9>在一个脚本里面调用另外一个脚本,call命令

##### call小例子,新建一个task.bat文件

```win batch
@echo off
echo inside task.bat
dir
echo now leaving task.bat
@echo on
```

##### 然后新建一个calldemo.bat,在里面调用task.bat

```win
@echo off
echo i will call task.bat 
call task
echo call finshed...
@echo on
```

###### 效果

![image-20251102155422137](assets/image-20251102155422137.png)



