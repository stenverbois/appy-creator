fs = require 'fs'
path = require 'path'

BrowserWindow = require 'browser-window'

MenuManager = require './menu'
command = require './command'

module.exports =
class Editor

  mainWindow = null
  specWindow = null

  menuManager = null

  constructor: () ->
    menuManager = new MenuManager

    @registerCommands()

  ready: ->
    # Create the browser window
    mainWindow = new BrowserWindow
      width: 800
      height: 600

    # Load the index.html of the app
    mainWindow.loadUrl 'file://' + path.normalize(__dirname + '/../index.html')

    # Set the menu
    menuManager.setMainMenu()

    # Emitted when the window is closed
    mainWindow.on 'closed', ->
      mainWindow = null

    specWindow = new BrowserWindow
      width: 400
      height: 400
    specWindow.loadUrl 'file://' + path.normalize(__dirname + '/../spec.html')
    specWindow.on 'close', ->
      specWindow = null

  registerCommands: ->
    command.register 'window:reload', -> mainWindow.reload()
