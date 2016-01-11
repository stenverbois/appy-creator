{EventEmitter} = require 'events'

Button = require './components/button'
Label = require './components/label'
Textbox = require './components/textbox'

componensClasses = {Button: Button, Label: Label, Textbox: Textbox }

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @components = []

  init: ->

  removeComponent: (idx) ->
    @components.splice idx, 1

  addComp: (name) ->
    @components.push new componensClasses[name]
