fs = require 'fs'
{ipcMain} = require 'electron'

module.exports = do ->
  ipc.on 'export:class', (event, arg) ->
    console.log arg
