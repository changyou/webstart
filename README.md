WEBSTART
========
前端项目基础模板

有关使用说明，请查看 [WIKI](https://github.com/changyou/webstart/wiki)

## 使用步骤

1. 下载代码，包含基础的文档结构
  
	$> git clone https://github.com/dYb/webstart.git

2. 安装FED:

	$> npm install -g fed

3. 启动：

	$> cd webstart  
	$> fed server -w ./fedConfig.json

4. 访问：

	http://localhost:3000

5. 部署 （开发时无需部署，提交svn时执行一次）
	
	grunt dist

## 目录结构说明
一份完整的目录看起来是这样子的

	webstart
		- java 后端的java代码
		- frontend
			* build       部署时的中转地，不用管啦
			* src         前端的开发都在这里
				+ htmls   静态html页面
				+ image   网站图片
				+ lib     前端库，本模板包含了jquery、seajs
				+ script  前端js文件
				+ style   样式库
				+ WEB-INF 存放ftl模板
			* test 测试
		- mock             存放模拟的后台数据 
		- webapp           上线是代码在此文件夹中，目录结构跟frontend/src完全相同
		- fedConfig.json   fed配置文件
		- gruntfile.coffee grunt配置文件
		- package.json

注： 在前后端实际套接时，可将`gruntfile.coffee` 里的uglify任务注掉。
