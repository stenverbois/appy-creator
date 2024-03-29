app = require 'app'

Application = require './application'
require './export'

mainEditor = null

# Quit when all windows are closed
app.on 'window-all-closed', ->
  if process.platform isnt 'darwin'
    app.quit()

# Electron ready for creating browser windows
app.on 'ready', ->
  # command line options someday
  options = {}
  global.mainEditor = new Application(options)
