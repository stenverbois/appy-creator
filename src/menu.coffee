Menu = require 'menu'

command = require './command'

m = require '../menu/menu'

module.exports =
class MenuManager
  # Set the menu on all windows
  setMainMenu: () ->
    template = Menu.buildFromTemplate @translateTemplate(m.menu)
    Menu.setApplicationMenu template

  # Sets the 'click' property on all menu items with a 'command' property
  # using the command registery.
  translateTemplate: (template) ->
    for item in template
      if item.command
        item.click = -> command.get(item.command)?()
      @translateTemplate(item.submenu) if item.submenu
    template
