app = require 'app'
BrowserWindow = require 'browser-window'
fs = require 'fs'
path = require 'path'

Menu = require 'menu'

m = require '../menus/linux.json'

# Keep a global reference of the window object, if you don't, the window will
# be closed automatically when the javascript object is GCed.
mainWindow = null

# Quit when all windows are closed.
app.on 'window-all-closed', ->
  if process.platform isnt 'darwin'
    app.quit()

translateTemplate = (template) ->
  console.log template
  for item in template
    console.log item
    if item.command is 'RELOAD'
      console.log 'yup'
      item.click = -> mainWindow.reload()
    translateTemplate(item.submenu) if item.submenu
  template

# This method will be called when Electron has done everything
# initialization and ready for creating browser windows.
app.on 'ready', ->
  # Create the browser window.
  mainWindow = new BrowserWindow
    width: 800
    height: 600

  # and load the index.html of the app.
  p = path.normalize(__dirname + '/../index.html')
  console.log p
  mainWindow.loadUrl 'file://' + p

  # Open the devtools.
  mainWindow.openDevTools()

  template = Menu.buildFromTemplate translateTemplate(m.menu)


  Menu.setApplicationMenu template

  # Emitted when the window is closed.
  mainWindow.on 'closed', ->
    # Dereference the window object, usually you would store windows
    # in an array if your app supports multi windows, this is the time
    # when you should delete the corresponding element.
    mainWindow = null
