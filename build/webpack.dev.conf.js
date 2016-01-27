var config = require('./webpack.base.conf')

config.devtool = 'eval-source-map'

config.devServer = {
  host: 'localhost',
  historyApiFallback: true,
  noInfo: true
}

module.exports = config
