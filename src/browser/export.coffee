fs = require 'fs'
{ipcMain} = require 'electron'

module.exports = do ->
  ipcMain.on 'export:app', (event, app) ->
    fs.writeFile('output.appy', app)
