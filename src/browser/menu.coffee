Menu = require 'menu'

m = require '../../menu/menu'

{EventEmitter} = require 'events'

module.exports =
class AppMenu extends EventEmitter
  # Set the menu on all windows
  attach: ->
    @template = Menu.buildFromTemplate @translateTemplate(m.menu)
    Menu.setApplicationMenu @template

  # Sets the 'click' property on all menu items with a 'command' property
  # using the command registery.
  translateTemplate: (template) ->
    for item in template
      if item.command
        item.click = => @emit(item.command)
      @translateTemplate(item.submenu) if item.submenu
    template
