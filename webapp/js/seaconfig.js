seajs.config({
	alias: {
		'es5-safe': 'gallery/es5-safe/0.9.3/es5-safe',
		'json': 'gallery/json/1.0.2/json',
		'$': "jquery/jquery-1.9.1.min.js"
	},

	// 变量配置
	vars: {
		'locale': 'zh-cn',
		'APP_URL': '32342'
	},
	// 映射配置
	// map: [
	//	['http://example.com/js/app/', 'http://localhost/js/app/']
	// ],
	// 指定需要使用的插件
	plugins: ['text', 'shim'],

	// 配置 shim 信息，这样我们就可以通过 require('jquery') 来获取 jQuery
	shim: {
		'$': {
			exports: 'jQuery'
		}
	},

	// 预加载项
	preload: [
	Function.prototype.bind ? '' : 'es5-safe', this.JSON ? '' : 'json'],

	// 调试模式
	// debug: true,

	// SeaJS 的基础路径
	// base: 'http://example.com/path/to/base/',
	// 文件编码
	charset: 'utf-8'
});