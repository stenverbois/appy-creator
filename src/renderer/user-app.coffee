{EventEmitter} = require 'events'

Button = require './components/button'
Label = require './components/label'
Textbox = require './components/textbox'
Image = require './components/image'
componensClasses = {Button: Button, Label: Label, Textbox: Textbox, Image: Image }

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @components = []

  init: ->

  removeComponent: (idx) ->
    @components.splice idx, 1

  addComponent: (name) ->
    @components.push new componensClasses[name]
