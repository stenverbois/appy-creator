fs = require 'fs'
{ipcMain} = require 'electron'

module.exports = do ->
  ipcMain.on 'export:app', (event, arg) ->
    fs.writeFile('output.appy', arg)
