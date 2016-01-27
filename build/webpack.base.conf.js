var path = require('path')

module.exports = {
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
  target: 'electron',
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee" },
      { test: /\.cson$/, loader: "cson" },
      { test: /\.css$/, loader: "style!css" },
      { test: /\.html$/, loader: "html" },
      { test: /\.js$/, loader: 'babel', exclude: /node_modules/ },
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
  }
}
