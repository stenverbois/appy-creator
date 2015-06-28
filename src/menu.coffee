Menu = require 'menu'

m = require '../menu/menu'

module.exports =
class MenuManager
  setMainMenu: () ->
    template = Menu.buildFromTemplate @translateTemplate(m.menu)
    Menu.setApplicationMenu template
    console.log 'LELLELELELE'

  translateTemplate: (template) ->
    for item in template
      if item.command is 'window:reload'
        item.click = -> mainWindow.reload()
      @translateTemplate(item.submenu) if item.submenu
    template
