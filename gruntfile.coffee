module.exports = (grunt) ->
	grunt.initConfig(
		pkg: grunt.file.readJSON('package.json')
		cfg: {
			path: {
				src: "src/main"
				build: "build"
				dist: "webapp"
				test: "test"
			}
		}
		## Compiles
		coffee: {
			compile: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/js"
					src: ["**/*.coffee"]
					dest: "<%=cfg.path.build %>/js"
					ext: ".js"
				}]
			}
		}
		less: {
			dev: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/css"
					# src: ['**/*.less', '!base/bundles/**/*.less']
					src: ['**/*.less']
					dest: '<%=cfg.path.build %>/css'
					ext: ".css"
				}]
			}
			build: {
				options: {
					yuicompress: true
				}
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/css"
					src: ['**/*.less']
					dest: '<%=cfg.path.build %>/css'
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
					src: ["js/**/*.js", "!js/modules/**/*.js"]
				}]
			}
			afterbuild: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.build %>"
					src: ["js/**/*.js", "!js/modules/**/*.js"]
				}]
			}

		}
		## Compress
		imagemin: {
			options: {
				optimizationLevel: 3
			}
			default: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>"
					src: ["img/**/*.jpg", "img/**/*.png"]
					dest: "<%=cfg.path.build %>/img"
				}]
			}
		}
		uglify: {}
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
					dest: "<%=cfg.path.dist"
				}]
			}
		}
		## Others
		copy: {
			js: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/js"
					src: ["**/*.js", "**/*.json", "**/*.map"]
					dest: "<%=cfg.path.build %>/js"
				}]
			}
			css: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/css"
					src: ["**/*.css"]
					dest: "<%=cfg.path.build %>/css"
				}]
			}
			image: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/img"
					src: [
						"!**/*.jpg"
						"!**/*.png"
					]
					dest: "<%=cfg.path.build %>/img"
				}]
			}
			view: {
				files: [{
					expand: true
					cwd: "<%=cfg.path.src %>/view"
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
			dist: ["webapp"]
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
		"imagemin"
		"copy:css"
		"copy:image"
		"copy:view"
	]
	grunt.registerTask 'dist', ["clean:dist", "build", "copy:build"]
