fs = require 'fs'
path = require 'path'
{EventEmitter} = require 'events'

ipc = require 'ipc'
Dialog = require 'dialog'
BrowserWindow = require 'browser-window'

Menu = require './menu'

module.exports =
class Application extends EventEmitter


  constructor: (options) ->
    @openWithOptions(options)
    # # Create the browser window
    # @mainWindow = new BrowserWindow
    #   width: 800
    #   height: 600

    @windows = []
    # Load the index.html of the app
    # @mainWindow.loadUrl 'file://' + path.normalize(__dirname + '/../index.html')

  openWithOptions: (options) ->
    {test} = options

    if test
      newWindow = @openSpecsWindow(options)
    else
      newWindow = @openWindow(options)

    @windows ?= []
    @windows.push newWindow
    newWindow.on 'closed', =>
      # Remove app window
      @windows.splice(idx, 1) for w, idx in @windows when w is appWindow

  openWindow: (options) ->
    window = new BrowserWindow
      width: 800
      height: 600

    window.maximize()
    window.loadUrl 'file://' + path.normalize(__dirname + '/../../index.html')

    # Set the menu
    @menu = new Menu()
    @menu.attach()

    @menu.on 'window:reload', ->
      BrowserWindow.getFocusedWindow().reload()

    @menu.on 'application:show-versions', ->
      window.showVersions()

    @menu.on 'application:run-specs', ->
      @openWithOptions(test: true)

    @menu.on 'window:toggle-dev-tools', ->
      BrowserWindow.getFocusedWindow().toggleDevTools()

    @menu.on 'get-qrcode', ->
      console.log("Not implemented yet")

  # registerCommands: ->
  #   command.register 'window:reload', => @mainWindow.reload()
  #   command.register 'editor:show-versions', => @showVersions()
  #   command.register 'editor:open-specs', => @openSpecWindow()
  #   command.register 'window:open-dev-tools', => @mainWindow.openDevTools()
  #   # command.get('editor:show-versions')()



  openSpecsWindow: (options) ->
    @specWindow = new BrowserWindow
      width: 400
      height: 400
    @specWindow.loadUrl 'file://' + path.normalize(__dirname + '/../../spec.html')
    @specWindow.on 'close', ->
      @specWindow = null
