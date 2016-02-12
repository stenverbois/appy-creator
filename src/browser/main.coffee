app = require 'app'

Application = require './application'

mainEditor = null

# ipcMain = require('electron').ipcMain

# Quit when all windows are closed
app.on 'window-all-closed', ->
  if process.platform isnt 'darwin'
    app.quit()

# Electron ready for creating browser windows
app.on 'ready', ->
  # command line options someday
  options = {}
  global.mainEditor = new Application(options)
