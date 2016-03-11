{EventEmitter} = require 'events'

componentClasses = require('./components/components').classes
functionClasses = require('./logic/function.coffee')
trigger = require('./logic/trigger.coffee')

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @id = 0
    @info =
      width: 20
      height: 30
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
    app =
      info: @info
      components: {}
      logic: {}

    for component in @components
      app.components[component.name] = component.export()

    for func in @functions
      app.logic.functions[func.name] = func.export()

    for trigger in @triggers
      app.logic.triggers[trigger.name] = trigger.export()

    app

  load: (app) ->
    @info = app.info

    for name, obj in app.components
      @components.push new componentClasses[obj.type](name, obj.properties)

    for name, obj in app.functions
      @functions.push new functionClasses[obj.type](name, obj.parameters, obj.triggers)

    for name, obj in app.triggers
      @triggers.push new Trigger(name, obj.component, obj.action)
