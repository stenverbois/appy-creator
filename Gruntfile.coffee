fs = require 'fs'
path = require 'path'
electron = require 'electron-prebuilt'

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-cson'
  grunt.loadNpmTasks 'grunt-lesslint'
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-csslint'

  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.loadNpmTasks 'grunt-shell'

  buildDir = path.resolve 'build'

  coffeeConfig =
    glob_to_multiple:
      expand: true
      src: [
        'src/**/*.coffee'
      ]
      dest: buildDir
      ext: '.js'

  csonConfig =
    options:
      rootObject: true

    glob_to_multiple:
      expand: true
      src: [
        'menus/*.cson'
      ]
      dest: buildDir
      ext: '.json'

  lessConfig =
    options:
      paths: [
        'style'
      ]
    glob_to_multiple:
      expand: true
      src: [
        'style/**/*.less'
      ]
      dest: buildDir
      ext: '.css'

  coffeelintConfig =
    options:
      configFile: 'coffeelint.json'
    src: [
      'src/**/*.coffee'
    ]
    build: [
      'Gruntfile.coffee'
    ]
    test: [
      'spec/*.coffee'
    ]

  csslintConfig =
    options:
      'adjoining-classes': false
      'duplicate-background-images': false
      'box-model': false
      'box-sizing': false
      'bulletproof-font-face': false
      'compatible-vendor-prefixes': false
      'display-property-grouping': false
      'fallback-colors': false
      'font-sizes': false
      'gradients': false
      'ids': false
      'important': false
      'known-properties': false
      'outline-none': false
      'overqualified-elements': false
      'qualified-headings': false
      'unique-headings': false
      'universal-selector': false
      'vendor-prefix': false
    src: [
      'style/**/*.css'
    ]

  lesslintConfig =
    src: [
      'style/**/*.less'
    ]

  copyConfig =
    testhtml:
      src: 'index.html'
      dest: buildDir + '/index.html'

  watchConfig =
    src:
      options:
        livereload: true
      files: [
        'src/**/*.coffee'
      ]
      tasks: [
        'coffee'
      ]

  shellConfig =
    electron:
      command: electron + ' .'
      option:
        stdout: true
        stderr: true

  grunt.initConfig
    coffee: coffeeConfig
    cson: csonConfig
    less: lessConfig

    coffeelint: coffeelintConfig
    lesslint: lesslintConfig
    csslint: csslintConfig

    copy: copyConfig

    watch: watchConfig

    shell: shellConfig

  grunt.registerTask 'test', ->
    console.log electron

  grunt.registerTask 'compile', ['coffee', 'cson', 'less']
  grunt.registerTask 'lint', ['coffeelint', 'csslint', 'lesslint']
  grunt.registerTask 'run', ['watch', 'shell']
