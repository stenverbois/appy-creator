fs = require 'fs'
path = require 'path'

Dialog = require 'dialog'
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
    @mainWindow = new BrowserWindow
      width: 800
      height: 600

    # Load the index.html of the app
    @mainWindow.loadUrl 'file://' + path.normalize(__dirname + '/../index.html')

    # Set the menu
    menuManager.setMainMenu()

    # Emitted when the window is closed
    @mainWindow.on 'closed', ->
      @mainWindow = null

  registerCommands: ->
    command.register 'window:reload', => @mainWindow.reload()
    command.register 'editor:show-versions', => @showVersions()
    command.register 'editor:open-specs', => @openSpecWindow()

  showVersions: ->
    Dialog.showMessageBox @mainWindow,
      type: 'warning'
      buttons: ['OK']
      title: 'Versions'
      message: """
                Node: #{process.versions['node']}
                Chrome: #{process.versions['chrome']}
                Electron: #{process.versions['electron']}
               """
      detail: ''
      # icon: null

  openSpecWindow: ->
    @specWindow = new BrowserWindow
      width: 400
      height: 400
    @specWindow.loadUrl 'file://' + path.normalize(__dirname + '/../spec.html')
    @specWindow.on 'close', ->
      @specWindow = null
