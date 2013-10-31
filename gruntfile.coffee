module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		cfg:
			path:
				src: "frontend/src"
				build: "frontend/build"
				dist: "webapp"
				test: "frontend/test"

		###
		# Tasks
		###

		coffee: {
			compile:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/script"
						src: ["**/*.coffee"]
						dest: "<%=cfg.path.build%>/script"
						ext: ".js"
					}
				]

				# 	# {
				# 	# 	expand: true
				# 	# 	cwd: "<%=cfg.path.src%>/lib"
				# 	# 	src: ["**/*.coffee"]
				# 	# 	dest: "<%=cfg.path.build%>/lib"
				# 	# 	ext: ".js"
				# 	# }
				# files: grunt.file.expandMapping ['<%=cfg.path.src%>/script/**/*.coffee'], '<%=cfg.path.src%>/script/', {
				# 	rename: (destBase,destPath) ->
				# 		return destBase + destPath.replace(/\.coffee$/,".js");
					
				# }
			}
		}

		less: {
			build: {
				options:
					yuicompress: true
				files:[
					{
						expand: true
						cwd: "<%=cfg.path.src%>/style"
						src: ["**/*.less", '!**/*.mixin.less'] # mixin的less文件不参与编译
						dest: '<%=cfg.path.build%>/style'
						ext: ".css"
					}
				]
			}
		}

		uglify:{
			options:
				compress: true
				dot: false
				# sourceMap: true
				report: "gzip"
				mangle: {
					except: ['jQuery', 'seajs', 'define', 'module', 'exports', 'require']
				}
				banner: """
					/**Generate at <%=grunt.template.today("yyyy-mm-dd")%>**/
				"""
			build:
				files:[
					{
						expand: true
						cwd: "<%=cfg.path.build%>/script"
						src: ["**/*.js", "!**/*.min.js"]
						dest: "<%=cfg.path.build%>/script"
						# "<%=cfg.path.build%>/script/*.js": ["<%=cfg.path.build%>/script/*.js", "<%=cfg.path.build%>/script/!*.min.js"]
					}
				]
				
		}

		copy:{
			html:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/htmls"
						src: "**/*"
						dest: "<%=cfg.path.build%>/htmls"
					}
				]
			}
			js:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/script"
						src: ["**/*.js", "**/*.json", "**/*.map"]
						dest: "<%=cfg.path.build%>/script"
					}
				]
			}
			css:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/style"
						src: ["**/*.css"]
						dest: "<%=cfg.path.build%>/style"
					}
				]
			}
			image:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/image"
						src: "**"
						dest: "<%=cfg.path.build%>/image"
					}
				]
			}
			lib:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/lib"
						src: ["**","!**/*.coffee", "!**/*.less"]
						dest: "<%=cfg.path.build%>/lib"
					}
				]
			}
			view:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.src%>/WEB-INF/view"
						src: "**"
						dest: "<%=cfg.path.build%>/WEB-INF/view"
					}
				]
			}
			build:{
				files: [
					{
						expand: true
						cwd: "<%=cfg.path.build%>"
						src: "**"
						dest: "<%=cfg.path.dist%>"
					}
				]
			}
		}

		clean:{
			build: ["<%=cfg.path.build%>"]
			dist:{
				files:[
					{
						expand: true
						cwd: "<%=cfg.path.dist%>"
						dot: true
						src: [
							"{image,lib,script,style}/**/*"
							"!WEB-INF/classes"
							"!WEB-INF/web.xml"
							"!WEB-INF/webserver-servlet.xml"
							"WEB-INF/view/*"
						]
					}
				]
			}
		}

		watch: {
			live: {
				files: "<%=cfg.path.src%>/**"
				tasts: ['dist']
				options:
					interrupt: true
					debounceDelay: 1000
			}
		}

		grunt.loadNpmTasks 'grunt-contrib-clean'
		grunt.loadNpmTasks 'grunt-contrib-less'
		grunt.loadNpmTasks 'grunt-contrib-coffee'
		grunt.loadNpmTasks 'grunt-contrib-uglify'
		grunt.loadNpmTasks 'grunt-contrib-copy'

		grunt.registerTask 'build', [
			"clean:build"
			"less:build"
			"coffee"
			"uglify" # 调试阶段可注掉此段，不压缩代码

			"copy:js"
			"copy:image"
			"copy:css"
			"copy:view"
			"copy:lib"
			"copy:html"
		]
		grunt.registerTask 'dist', ["build","copy:build"]
		grunt.registerTask 'dev', ["watch:live"]


















