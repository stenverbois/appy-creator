fs = require 'fs'
path = require 'path'
app = require 'app'
{EventEmitter} = require 'events'

ipc = require('electron').ipcMain
Dialog = require('electron').dialog
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
    newWindow = @openWindow(options)

    @windows ?= []
    @windows.push newWindow

    # Remove app window on closed
    newWindow.on 'closed', =>
      @windows.splice(idx, 1) for w, idx in @windows when w is newWindow

  openWindow: (options) ->
    window = new BrowserWindow
      width: 800
      height: 600

    window.maximize()
    window.loadURL 'http://localhost:8080'

    # Set the menu
    @menu = new Menu()
    @menu.attach()

    # Window callbacks
    @menu.on 'window:reload', ->
      BrowserWindow.getFocusedWindow().reload()

    @menu.on 'window:toggle-dev-tools', ->
      BrowserWindow.getFocusedWindow().toggleDevTools()

    @menu.on 'editor:show-versions', ->
      # TODO: ?

    @menu.on 'editor:save', ->
      # ipc.send 'editor:save'

    @menu.on 'editor:save-as', ->


    @menu.on 'application:close', ->
      window.close()

    @menu.on 'appy:get-qrcode', ->
      getQR()

  getQR = ->
    # @QrWindow = new BrowserWindow
    #   width: 400
    #   height: 400
    #   title: "Qr code"
    # @QrWindow.loadURL 'file://' + path.normalize(__dirname + '/../renderer/views/qr.html')
    # @QrWindow.on 'close', ->
    #   @QrWindow = null
