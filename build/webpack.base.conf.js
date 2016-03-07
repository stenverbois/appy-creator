var path = require('path')

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
      'gridster': './../../lib/gridster/src/jquery.gridster.js',
      'gridster-css': './../../lib/gridster/dist/jquery.gridster.min.css',
      'qrcode': './../../../lib/qrcode/jquery.qrcode-0.12.0.min.js'
    }
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' },
      { test: /\.cson$/, loader: 'cson' },
      { test: /\.css$/, loader: 'style!css' },
      { test: /\.html$/, loader: 'html' },
      { test: /\.js$/, loader: 'babel', exclude: [/node_modules/, /lib/] },
      { test: /\.json$/, loader: 'json' },
      { test: /\.less$/, loader: 'style!css!less' },
      { test: /\.scss$/, loader: 'style!css!sass?sourceMap' },
      { test: /\.vue$/, loader: 'vue' },
      {
        test: /\.(png|jpg|gif|svg|woff2?|eot|ttf)$/, loader: 'url',
        query: {
          limit: 10000,
          name: '[name].[ext]?[hash]'
        }
      }
    ]
  },
  vue: {
    loaders: {
      js: 'babel',
      scss: 'style!css!sass?sourceMap'
    }
  }
}

// config.target = 'electron-renderer'

module.exports = config
