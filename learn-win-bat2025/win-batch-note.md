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

## win script skill demos

#### 1.编写自己的磁盘检查程序cdsk.bat

```win batch
: 简化版的chkdsk,可以接受0-3个参数
: 在命令行中输入cdsk ===>chkdsk 没有参数,可以正常运行
: 在命令行中输入cdsk c:===>chkdsk c: 有一个参数,可以正常运行
: 在命令行中输入cdsk c: /f ===>chkdsk c: /f 有2个参数,可以正常运行
: 在命令行中输入cdsk c: /f /v ===>chkdsk c: /f /v 有3个参数,可以正常运行

chkdsk %1 %2 %3
```

#### 2.防止空字符串错误的脚本avoierr.bat

```win batch
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
```

###### 效果

![image-20251102164040369](assets/image-20251102164040369.png)



#### 3.正确使用goto指令,文件命usegoto.bat,这里有一个小技巧,echo.表示输出一个空行,也就是可以实现换行

```win batch
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
```

###### 效果

![image-20251102165704911](assets/image-20251102165704911.png)

## win tree command

### 1>mkdir创建一个空文件夹

![image-20251102170315678](assets/image-20251102170315678.png)

### 2>cd改变当前目录

![image-20251102170420956](assets/image-20251102170420956.png)

### 3>rmdir删除一个空目录,如果非空,删除报错

![image-20251102170915601](assets/image-20251102170915601.png)

### 4>move移动文件或者文件夹

![image-20251102172553628](assets/image-20251102172553628.png)

文件也是可以移动的

![image-20251102172806019](assets/image-20251102172806019.png)

### 5>path命令,显示系统的环境变量

![image-20251102173153728](assets/image-20251102173153728.png)

### 6>tree命令显示磁盘上或者指定的文件夹里面的所有路径,不显示文件

![image-20251102173531384](assets/image-20251102173531384.png)

###### 注意:如果需要显示文件,需要添加 /f选项

![image-20251102174039285](assets/image-20251102174039285.png)

### 7>subst把一个路径映射为一个磁盘驱动器

![image-20251102175256931](assets/image-20251102175256931.png)

### 8>sort对文件内容进行排序

我们有一个content.txt,内容如下

```
pineapple
apple
peach
banana
lemon
orange
strawberry
```

然后我们用sort命令对它进行排序,会输出排序后的内容

![image-20251102200004696](assets/image-20251102200004696.png)

还可以把排序后的内容输出到一个文件

![image-20251102200145663](assets/image-20251102200145663.png)

然后打开这个文件

![image-20251102200230457](assets/image-20251102200230457.png)

### 9>find在文件中查找字符串

比如,在上面的content.txt文件中查找字符串"pine",find 后面的字符串需要用双引号包裹

![image-20251102200759526](assets/image-20251102200759526.png)

注意,find命令通常和type命令一起使用

![image-20251102200949066](assets/image-20251102200949066.png)

![image-20251102202007037](assets/image-20251102202007037.png)

### 10>findstr也是在文件中查找字符串,不过他是区分大小写的.

比如,我们有一个msg.txt文件,内容如下

```
Hello girl
Hello lady
hey guy
welcome
hello ,man
good bye

```

然后我们用fingstr来查找hello

![image-20251102211656803](assets/image-20251102211656803.png)

然后我们来查找Hello

![image-20251102211727665](assets/image-20251102211727665.png)

### 11>more逐屏显示目录

![image-20251103065549649](assets/image-20251103065549649.png)

### 12>小技巧,去掉没有用的注释

比如,我们有一个文件cdsk.bat,它有很多注释,我们需要把它清除,但是:label不能够清除

![image-20251103070313201](assets/image-20251103070313201.png)

  我们使用下面的目录来清除,注意最好在普通的注释上面加一个*,这样子方便和label区分

![image-20251103070610707](assets/image-20251103070610707.png)

然后生成的$cdsk.bat就没有注释了.不过我觉得没有必要,了解即可

![image-20251103070745086](assets/image-20251103070745086.png)

### 13>数据管道|的用法,就是命令1|命令2|...|命令n,前一个的输出就是后一个的输入

![image-20251103071116946](assets/image-20251103071116946.png)

![image-20251103071143115](assets/image-20251103071143115.png)

![image-20251103071224380](assets/image-20251103071224380.png)

### 14>小技巧在脚本里面使用回车

首先需要创建一个叫做enter的文件,里面什么都没有,就是按了一下回车键,使用下面的命令

![image-20251103072114778](assets/image-20251103072114778.png)

然后就可以创建一个showdt.bat文件,内容如下

![image-20251103072158415](assets/image-20251103072158415.png)

然后就可以在命令行在使用

![image-20251103072237182](assets/image-20251103072237182.png)
