: 简化版的chkdsk,可以接受0-3个参数
: 在命令行中输入cdsk ===>chkdsk 没有参数,可以正常运行
: 在命令行中输入cdsk c:===>chkdsk c: 有一个参数,可以正常运行
: 在命令行中输入cdsk c: /f ===>chkdsk c: /f 有2个参数,可以正常运行
: 在命令行中输入cdsk c: /f /v ===>chkdsk c: /f /v 有3个参数,可以正常运行

chkdsk %1 %2 %3