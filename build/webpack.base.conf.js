var path = require('path')
var webpack = require("webpack")

config = {
  entry: {
    app: './src/renderer/main.coffee'
  },
  output: {
    path: path.resolve(__dirname, '../dist/static'),
    publicPath: '/static/',
    filename: '[name].js'
  },
  resolve: {
    extensions: ['', '.js', '.coffee', '.json', '.cson', '.vue'],
    alias: {
      'src': path.resolve(__dirname, '../src'),
      'gridster': './../../lib/gridster/jquery.gridster.js',
      'gridster-css': './../../lib/gridster/jquery.gridster.min.css'
    }
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee" },
      { test: /\.cson$/, loader: "cson" },
      { test: /\.css$/, loader: "style!css" },
      { test: /\.html$/, loader: "html" },
      { test: /\.js$/, loader: 'babel', exclude: [/node_modules/, /lib/] },
      { test: /\.json$/, loader: 'json' },
      { test: /\.less$/, loader: "style!css!less" },
      { test: /\.vue$/, loader: 'vue' },
      {
        test: /\.(png|jpg|gif|svg)$/, loader: 'url',
        query: {
          limit: 10000,
          name: '[name].[ext]?[hash]'
        }
      }
    ]
  },
  vue: {
    loaders: {
      js: 'babel'
    }
  },
  // plugins: [
  //   new webpack.IgnorePlugin(new RegExp('electron'))
  //   // new webpack.ExternalsPlugin("commonjs", [
  //   //   "app",
  //   //   "auto-updater",
  //   //   "browser-window",
  //   //   "content-tracing",
  //   //   "dialog",
  //   //   "global-shortcut",
  //   //   "ipc",
  //   //   "ipc-main",
  //   //   "menu",
  //   //   "menu-item",
  //   //   "power-monitor",
  //   //   "protocol",
  //   //   "tray",
  //   //   "remote",
  //   //   "web-view",
  //   //   "web-frame",
  //   //   "clipboard",
  //   //   "crash-reporter",
  //   //   "screen",
  //   //   "shell",
  //   //   "native-image"
  //   // ]),
  // ]
  externals: [
    function(context, request, callback) {
      // Every module prefixed with "global-" becomes external
      // "global-abc" -> abc
      if(/^electron/.test(request))
          return callback(null, "require('electron')")
      callback()
    }
  ]
}

// config.target = 'electron-renderer'

module.exports = config
