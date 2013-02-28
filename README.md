WEBSTART
========
前端项目基础模板

## 启动步骤

1. 下载代码

  $> git clone https://github.com/changyou/webstart.git -b withgrunt

2. 安装依赖

  $> cd webstart
  $> npm install

3. 安装FED

  $> npm install -g fed

4. 安装Grunt

  $> npm install -g grunt grunt-cli

5. 启动环境

  $> fedmon run ./fedConfig.js

6. 访问网站

  http://localhost:3000

#### 编译发布

编译主要执行的操作都定义在`./grunfile.coffee`文件里，包括：

* 编译Less文件
* 编译CoffeeScript文件
* 压缩jpg、png图片
* jshint代码检查
* 相关文件拷贝

**构建**

  $> grunt build

**发布**

  $> grunt dist

**其它**

  $> grunt --help