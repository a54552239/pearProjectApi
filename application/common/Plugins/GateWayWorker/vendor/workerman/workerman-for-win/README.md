# workerman-for-win
workerman-for-win

## 环境要求
(php>=5.3.3)

## 运行
运行一个文件  
php your_file.php  

同时运行多个文件  
php your_file.php your_file2.php ...  

## 与Linux多进程版本的区别
1、单进程，也就是说count属性无效  
2、由于php在win下无法fork进程，Applications/YourApp/start.php被拆成多个子启动项，如start_web.php   start_gateway.php等，每个文件自动启动一个进程运行  
3、由于php在win下不支持信号，所以无法使用reload、status、restart、stop命令，也没有start命令 

## 手册
开发与Linux版本基本无差别，可以直接参考Linux版本手册  
http://doc3.workerman.net/

## 说明
此版本可用于windows下开发使用，不建议用在生产环境

## 移植
### windows到Linux（需要Linux的Workerman版本3.1.0及以上）
可以直接将Applications下的应用目录拷贝到Linux版本的Applications下直接运行

### Linux到windows
Linux下的应用需要将Applications/YourApp/start.php拆成多个启动项

