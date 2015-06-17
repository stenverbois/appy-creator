fs = require 'fs'
path = require 'path'

BrowserWindow = require 'browser-window'
Menu = require 'menu'

m = require '../menus/menu'

module.exports =
class Editor

  mainWindow = null

  constructor: () ->

  ready: ->
    # Create the browser window
    mainWindow = new BrowserWindow
      width: 800
      height: 600

    # Load the index.html of the app
    mainWindow.loadUrl 'file://' + path.normalize(__dirname + '/../index.html')

    template = Menu.buildFromTemplate @translateTemplate(m.menu)

    Menu.setApplicationMenu template

    # Emitted when the window is closed
    mainWindow.on 'closed', ->
      # Dereference the window object, usually you would store windows
      # in an array if your app supports multi windows, this is the time
      # when you should delete the corresponding element
      mainWindow = null

  #TODO: Move to its own 'menu' module
  translateTemplate: (template) ->
    for item in template
      if item.command is 'window:reload'
        item.click = -> mainWindow.reload()
      @translateTemplate(item.submenu) if item.submenu
    template
