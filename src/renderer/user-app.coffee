{EventEmitter} = require 'events'

componentClasses = require('./components/components').classes

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @id = 0
    @components = []

  init: ->

  removeComponent: (idx) ->
    @components.splice idx, 1

  addComponent: (name) ->
    @components.push new componentClasses[name](name+ @id)
    @id += 1
