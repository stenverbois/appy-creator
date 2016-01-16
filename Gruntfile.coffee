fs = require 'fs'
path = require 'path'
electron = require 'electron-prebuilt'

module.exports = (grunt) ->

  # Compiling
  grunt.loadNpmTasks 'grunt-cson'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  buildDir = path.resolve 'dist'

  coffeeConfig =
    glob_to_multiple:
      expand: true
      flatten: true
      src: [
        'src/browser/**/*.coffee'
      ]
      dest: buildDir
      ext: '.js'

  csonConfig =
    options:
      rootObject: true

    glob_to_multiple:
      expand: true
      flatten: true
      src: [
        'menu/**/*.cson'
      ]
      dest: buildDir
      ext: '.json'

  grunt.initConfig
    coffee: coffeeConfig
    cson: csonConfig

  grunt.registerTask 'compile', ['coffee', 'cson']

  grunt.registerTask 'build', ['compile']
