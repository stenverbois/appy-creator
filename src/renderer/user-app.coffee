{EventEmitter} = require 'events'

componentClasses = require('./components/components').classes

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @id = 0
    @info =
      width: 4
      height: 6
      pageNames: ["Page0"]
    @components = []
    @functions = []
    @triggers = []

  init: ->

  removeComponent: (idx) ->
    @components.splice idx, 1

  addComponent: (name) ->
    @components.push new componentClasses[name](name+ @id)
    @id += 1

  export: ->
    returnObject =
      info: @info
      components: {}
      logic: {}

    for component in @components
      returnObject.components[component.name] = component.export()

    for func in @functions
      returnObject.logic.functions[func.name] = func.export()

    for trigger in @triggers
      returnObject.logic.triggers[trigger.name] = trigger.export()

    returnObject
