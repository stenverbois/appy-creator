fs = require 'fs'
path = require 'path'
electron = require 'electron-prebuilt'

webpack = require 'webpack'

module.exports = (grunt) ->

  # Compiling
  grunt.loadNpmTasks 'grunt-cson'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # General building
  grunt.loadNpmTasks 'grunt-webpack'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  buildDir = path.resolve 'build'

  coffeeConfig =
    glob_to_multiple:
      expand: true
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
      src: [
        'menu/**/*.cson'
      ]
      dest: buildDir
      ext: '.json'

  copyConfig =
    index:
      src: 'index.html'
      dest: buildDir + '/index.html'
    spec:
      src: 'spec.html'
      dest: buildDir + '/spec.html'

  webpackConfig =
    development:
      # webpack options
      entry:
        main: "./src/renderer/main"
        # qr: "./build/src/renderer/views/qr.js"

      output:
        path: "./build"
        filename: "src/[name].entry.js"

      target: 'electron'

      module:
        loaders: [
          { test: /\.vue$/, loader: "vue" }
          { test: /\.html$/, loader: "html" }
          { test: /\.less$/, loader: "style!css!less" }
          { test: /\.css$/, loader: "style!css" }
          { test: /\.coffee$/, loader: "coffee" }
          { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" }
          { test: /\.cson$/, loader: "cson" }
          { test: /\.(woff|woff2|eot|ttf)$/, loader: "url?prefix=font/&limit=5000" }
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

      resolve:
        alias:
          'gridster': './../../lib/gridster/jquery.gridster.js'
          'gridster-css': './../../lib/gridster/jquery.gridster.min.css'
          'jquery-qrcode': './../../../lib/qr-code/jquery.qrcode-0.12.0.min.js'

        extensions: ['', '.js', '.coffee', '.json', '.cson']


      storeStatsTo: "webpackStats" # Stats for later use i.e. <%= xyz.hash %>
      watch: false
      keepalive: false
      devtool: 'source-map'

  grunt.initConfig
    coffee: coffeeConfig
    cson: csonConfig

    copy: copyConfig
    webpack: webpackConfig

  grunt.registerTask 'compile', ['coffee', 'cson']

  grunt.registerTask 'build', ['compile', 'copy', 'webpack']
