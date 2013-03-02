module.exports = (grunt) ->
	grunt.initConfig(
		###
		# Pre-defined
		###
		pkg: grunt.file.readJSON('package.json')
		cfg: {
			path: {
				src: "src/main"
				build: "build"
				dist: "webapp"
				test: "test"
			}
		}

		###
		# Task Configure
		###
		## Compiles
		coffee: {
			compile: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/script"
					src: ["**/*.coffee"]
					dest: "<%=cfg.path.build %>/script"
					ext: ".js"
				}]
			}
		}
		less: {
			dev: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/style"
					src: ['**/*.less']
					dest: '<%=cfg.path.build %>/style'
					ext: ".css"
				}]
			}
			build: {
				options: {
					yuicompress: true
				}
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/style"
					src: ['**/*.less']
					dest: '<%=cfg.path.build %>/style'
					ext: ".css"
				}]
			}
		}
		## Hint
		jshint: {
			options: {
				# options here to override JSHint defaults
				globals: {
					"jQuery": true
					"console": true
					"module": true
					"document": true
					"exports": true
					"require": true
				}
			}
			#-----
			beforebuild: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>"
					src: ["script/**/*.js"]
				}]
			}
			afterbuild: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.build %>"
					src: ["script/**/*.js"]
				}]
			}

		}
		## Compress
		imagemin: {
			options: {
				optimizationLevel: 0
			}
			default: {
				# files: {
				# 	"src/main/image/icons/aa.jpg": "src/main/image/icons/bb.jpg"
				# }
				files: [{
					expand: true
					cwd: "<%=cfg.path.build %>/image"
					dest: "<%=cfg.path.build %>/image"
					src: "**.{jpg,png}"
					# src: ["image/**/*.jpg", "image/**/*.png"]
					# dest: "<%=cfg.path.build %>/image"
				}]
			}
		}
		uglify: {
			options: {
				compress: true,
				sourceMap: true,
				# sourceMapRoot: "",
				# sourceMappingURL:
				# sourceMapPrefix:
				banner: """
/** Generate at <%= grunt.template.today("yyyy-mm-dd") %> */
				"""
			}
			dist: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>"
					src: ["script/**/*.js", "!script/**/*.min.js"]
					dest: "<%=cfg.path.build %>/script"
				}]
			}
		}
		cssmin: {}
		htmlmin: {
			dist: {
				options: {
					removeComments: true,
					collapseWhitespace: true
				}
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>"
					src: "**/*.html"
					dest: "<%=cfg.path.dist %>"
				}]
			}
		}
		## Others
		copy: {
			js: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/script"
					src: ["**/*.js", "**/*.json", "**/*.map"]
					dest: "<%=cfg.path.build %>/script"
				}]
			}
			css: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/style"
					src: ["**/*.css"]
					dest: "<%=cfg.path.build %>/style"
				}]
			}
			image: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/image"
					src: [
						## Copy all files to %build%, then imagemin
						# "!**/*.jpg"
						# "!**/*.png"
						"**"
					]
					dest: "<%=cfg.path.build %>/image"
				}]
			}
			module: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/module"
					dest: "<%=cfg.path.build %>/module"
					src: "**"
				}]
			}
			view: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/WEB-INF/view"
					src: "**"
					dest: "<%=cfg.path.build %>/WEB-INF/view"
				}]
			}
			build: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.build %>"
					src: "**"
					dest: "<%=cfg.path.dist %>"
				}]
			}
		}
		clean: {
			build: ["<%=cfg.path.build %>"]
			dist: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.dist %>"
					src: [
						"{image,module,script,style}"
						"!WEB-INF/classes"
						"!WEB-INF/web.xml"
						"!WEB-INF/webserver-servlet.xml"
						"WEB-INF/view/*"
						"!WEB-INF/view/{account,card,common,game}"
					]
				}]
			}
		}
		watch: {}
	)

	## Load Contribs
	grunt.loadNpmTasks 'grunt-contrib'

	## Task Regist
	grunt.registerTask 'test', ['jshint']
	grunt.registerTask 'build', [
		"clean:build"
		"less:build"
		"jshint:beforebuild"
		"coffee"

		"copy:js"
		"jshint:afterbuild"

		"copy:image"
		# "imagemin" # it didn't work on my pc

		"copy:css"
		"copy:view"
		"copy:module"
	]
	grunt.registerTask 'dist', ["clean:dist", "build", "copy:build"]
