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
  module: {
    loaders: [
      { test: /\.vue$/, loader: 'vue' },
      { test: /\.less$/, loader: "style!css!less" },
      { test: /\.css$/, loader: "style!css" },
      { test: /\.json$/, loader: 'json' },
      {
        test: /\.(png|jpg|gif|svg)$/, loader: 'url',
        query: {
          limit: 10000,
          name: '[name].[ext]?[hash]'
        }
      },
      { test: /\.coffee$/, loader: "coffee" },
      { test: /\.cson$/, loader: "cson" },
      { test: /\.html$/, loader: "html" }

    ]
  },
  vue: {
    loaders: {
      
    }
  }
}
