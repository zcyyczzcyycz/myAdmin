这是一个关于师生管理与交互的管理系统。
该系统完全由本人个人构思实现。
基本功能分别包括登录，注册，用户的导入导出，批量的增删改查及任务模块和主题设置等。
前端采用vue+element实现
后端采用node搭配mysql数据库实现
前端后端代码一并上传到了仓库中（node文件夹包含node代码，mysql文件夹包含mysql表，其余为前端代码）

-----
运行条件：mysql服务，node环境
---------
因为本项目服务端和数据库均未部署到服务器，所有请自行运行下node文件夹即mysql文件夹代码
1，使用mysql客户端工具运行mysql文件夹--school.sql文件
2，请使用node运行node文件夹代--index.js，同时注意根据本机mysql数据库，自行修改下node文件夹--mysql文件夹--mysql.js文件关于连接数据库的配置（用户名，密码，端口号即连接的数据库）
3，双击index.html运行项目
------------
登录时请使用（用户名：zcyycz; 密码：qwe123456; 身份码：1）进行登录
如果自行注册可能无法注册成功，因为本系统仅限数据库表单已登记用户进行注册
确保网络良好，否则可能无法正常登录，如果遇到图片加载不出来的情况可以尝试刷新

项目截图
-----------

![image](https://github.com/zcyyczzcyycz/myAdmin/blob/master/images/1.png)
![image](https://github.com/zcyyczzcyycz/myAdmin/blob/master/images/2.png)
![image](https://github.com/zcyyczzcyycz/myAdmin/blob/master/images/3.png)
![image](https://github.com/zcyyczzcyycz/myAdmin/blob/master/images/4.png)
![image](https://github.com/zcyyczzcyycz/myAdmin/blob/master/images/5.png)




