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
