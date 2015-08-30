fs = require 'fs'
path = require 'path'
electron = require 'electron-prebuilt'

webpack = require 'webpack'

module.exports = (grunt) ->

  # Linting
  grunt.loadNpmTasks 'grunt-lesslint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-csslint'

  # Compiling
  grunt.loadNpmTasks 'grunt-cson'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # General building
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-webpack'

  buildDir = path.resolve 'build'

  coffeeConfig =
    glob_to_multiple:
      expand: true
      src: [
        'src/**/*.coffee'
        'spec/**/*.coffee'
      ]
      dest: buildDir
      ext: '.js'

  csonConfig =
    options:
      rootObject: true

    glob_to_multiple:
      expand: true
      src: [
        'menu/*.cson'
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
        'style/main.less'
        # '!style/kube/*.less'
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
      'spec/**/*.coffee'
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
    index:
      src: 'index.html'
      dest: buildDir + '/index.html'
    spec:
      src: 'spec.html'
      dest: buildDir + '/spec.html'
    vue:
      expand: true
      src: [
        'src/renderer/**/*'
        'src/style/**/*.less'
        '!src/**/*.coffee'
      ]
      dest: buildDir

  webpackConfig =
    development:
      # webpack options
      entry: "./build/src/renderer/main.js"
      output:
        path: "./build"
        filename: "src/renderer/build.js"

      module:
        loaders: [
          { test: /\.vue$/, loader: "vue" }
          { test: /\.html$/, loader: "html" }
          { test: /\.less$/, loader: "style!css!less" }
          { test: /\.css$/, loader: "style!css" }
          {
            test: /\.(jpe?g|png|gif|svg)$/i
            loaders: [
              'file?hash=sha512&digest=hex&name=[hash].[ext]'
              'image-webpack?bypassOnDebug&optimizationLevel=7&interlaced=false'
            ]
          }

        ]

      plugins: [
        new webpack.ProvidePlugin
          $: "jquery"
          jQuery: "jquery"
      ]

      resolve: {
        alias: {
          'gridster': './../../../lib/gridster/jquery.gridster.js'
          'gridster-css': './../../../lib/gridster/jquery.gridster.min.css'
        }
      }

      storeStatsTo: "webpackStats" # Stats for later use i.e. <%= xyz.hash %>
      watch: false
      keepalive: false
      devtool: 'source-map'

  watchConfig =
    src:
      files: [
        'src/**/*.*'
        'lib/**/*.*'
      ]
      tasks: [
        'build'
      ]
    spec:
      files: [
        'spec/**/*.coffee'
      ]
      tasks: [
        'coffee'
      ]
    style:
      files: [
        'style/**/*.less'
        'style/**/*.variables'
      ]
      tasks: [
        'less'
      ]
    menu:
      files: [
        'menu/**/*.cson'
      ]
      tasks: [
        'cson'
      ]
    copy:
      files: [
        'spec.html'
        'index.html'
      ]
      tasks: [
        'copy'
      ]
    grunt:
      files: [
        'Gruntfile.coffee'
      ]
      tasks: [
        'dev'
      ]

  grunt.initConfig
    coffee: coffeeConfig
    cson: csonConfig
    less: lessConfig

    coffeelint: coffeelintConfig
    lesslint: lesslintConfig
    csslint: csslintConfig

    copy: copyConfig
    watch: watchConfig
    webpack: webpackConfig

  grunt.registerTask 'test', ->
    console.log 'Working...'

  grunt.registerTask 'compile', ['coffee', 'cson', 'less']
  grunt.registerTask 'lint', ['coffeelint', 'csslint', 'lesslint']

  grunt.registerTask 'build', ['compile', 'copy', 'webpack']
  grunt.registerTask 'dev', ['build', 'watch']
