fs = require 'fs'
path = require 'path'

module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-cson')
  grunt.loadNpmTasks('grunt-lesslint')
  grunt.loadNpmTasks('grunt-coffeelint')

  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-csslint')

  buildDir = path.resolve 'build'

  coffeeConfig =
    glob_to_multiple:
      expand: true
      src: [
        'src/**/*.coffee'
      ]
      dest: buildDir
      ext: '.js'

  grunt.initConfig
    coffee: coffeeConfig

  grunt.registerTask 'test', ->
    console.log 'test called.'

  grunt.registerTask 'compile', ['coffee', 'cson', 'less']
  grunt.registerTask 'lint', ['coffeelint', 'csslint', 'lesslint']
