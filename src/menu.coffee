Menu = require 'menu'

command = require './command'

m = require '../menu/menu'

module.exports =
class MenuManager
  setMainMenu: () ->
    template = Menu.buildFromTemplate @translateTemplate(m.menu)
    Menu.setApplicationMenu template

  translateTemplate: (template) ->
    for item in template
      if item.command
        item.click = -> command.get(item.command)()
      @translateTemplate(item.submenu) if item.submenu
    template
