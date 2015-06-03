module.exports = function(grunt){

	grunt.initConfig({
		cssmin: {
			css: {
				files: {
					'Fursuiter/static/build/fursuiter.min.css': ['Fursuiter/static/style/**/*.css']
				}
			}
		},
		uglify: {
			js: {
				files: {
					'Fursuiter/static/build/fursuiter.loggedin.min.js': ['Fursuiter/static/app/init.js','Fursuiter/static/app/**/*.js'],
					'Fursuiter/static/build/fursuiter.public.min.js': ['Fursuiter/static/publicapp/init.js','Fursuiter/static/publicapp/**/*.js']
				}
			}
		},
		clean: ['Fursuiter/static/build/*.cleanme'],
		concat: {
			js: {
				src: ['Fursuiter/static/app/init.js','Fursuiter/static/app/**/*.js'],
				dest: 'Fursuiter/static/build/fursuiter.min.js' // <-- For development only, not actually minified
			}
		},
		wiredep: {
			base: {
				bowerJson: require('./bower.json'),
				src: ['Fursuiter/templates/base.loggedin.mako','Fursuiter/templates/public/base.mako']
			}
		},
		watch: {
			watchJS: {
				files: ['Fursuiter/static/app/**/*.js','bower_components/**/*.js'],
				tasks: ['uglify']
			},
			watchCSS: {
				files: ['Fursuiter/static/style/**/*.css'],
				tasks: ['cssmin']
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-cssmin')
	grunt.loadNpmTasks('grunt-contrib-uglify')
	grunt.loadNpmTasks('grunt-contrib-concat')
	grunt.loadNpmTasks('grunt-contrib-clean')
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-wiredep')

	grunt.registerTask('prod', ['cssmin', 'uglify', 'wiredep', 'clean', 'watch'])
	grunt.registerTask('dev', ['cssmin', 'concat', 'wiredep', 'clean', 'watch'])
	grunt.registerTask('default', ['prod'])

}