var config = require('./webpack.base.conf')

config.devtool = 'eval-source-map'

config.devServer = {
  host: 'localhost',
  historyApiFallback: true,
  noInfo: true
}

config.target = 'electron'

module.exports = config
