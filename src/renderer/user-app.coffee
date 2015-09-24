{EventEmitter} = require 'events'

Button = require './components/button'

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @components = []

  init: ->
    @components = [new Button('Button1'), new Button('Button2'), new Button('Button3'), new Button('Button4')]

  removeComponent: (idx) ->
    @components.splice(idx, 1)
