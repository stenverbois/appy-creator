{EventEmitter} = require 'events'

componentClasses = require('./components/components').classes

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @id = 0
    @info = {}
    @components = []
    @logic = []

  init: ->

  removeComponent: (idx) ->
    @components.splice idx, 1

  addComponent: (name) ->
    @components.push new componentClasses[name](name+ @id)
    @id += 1

  export: ->
    {
      info: @info
      components: @components
      logic: @logic
    }
