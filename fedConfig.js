module.exports = {
	"host": "app.changyou.com",
	"port": "3000",
	"path": {
		"views": "./webapp/WEB-INF/view",
		"backend": "./mock",
		"public": "./webapp"
	},
	"globals": {
		"DEBUG": true,
		"baseUrl": "",
		"basePath": "http://www.ijser.cn/"
	},

	"proxy": {
		"enable": false,
		"port": 80,

		"router": {
			"cy4749.cyou-inc.com": "localhost:81",
			"app.changyou.com": "localhost:3000"
		},

		"remote": {
			"host": "123.126.70.39",
			"port": 80
		}
	}
};