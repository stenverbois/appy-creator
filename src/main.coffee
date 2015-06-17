app = require 'app'

Editor = require './editor'

mainEditor = null

# Quit when all windows are closed
app.on 'window-all-closed', ->
  if process.platform isnt 'darwin'
    app.quit()

# Electron ready for creating browser windows
app.on 'ready', ->
  mainEditor = new Editor
  mainEditor.ready()
