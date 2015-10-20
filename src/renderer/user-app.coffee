{EventEmitter} = require 'events'

Button = require './components/button'
Label = require './components/label'
Textbox = require './components/textbox'

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @components = []

  init: ->
    @addButton()

  removeComponent: (idx) ->
    @components.splice idx, 1

  #TODO: Needs to be more general
  addButton: ->
    @components.push new Button('')

  addLabel: ->
    @components.push new Label('')

  addTextbox: ->
    @components.push new Textbox('')  
