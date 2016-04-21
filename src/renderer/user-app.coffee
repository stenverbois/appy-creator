{EventEmitter} = require 'events'

componentClasses = require('./components/components').classes
functionClasses = require('./logic/function.coffee')
trigger = require('./logic/trigger.coffee')
functionClasses = require('./logic/functions.coffee').classes

module.exports =
class UserApp extends EventEmitter
  constructor: ->
    @id = 0
    @info =
      author: "John Doe"
      appName: "MyAwesomeApp"
      width: 10
      height: 20
      pageNames: ["Page0"]
    @components = []
    @generic_items = []
    @functions = []
    @triggers = []

  init: ->
    @info = {}
    @components = []
    @generic_items = []
    @functions = []
    @triggers = []

  addComponent: (name, list) ->
    while true
      @id += 1
      nameAlreadyUsed = @components.some (component) => component.name is name + @id
      break unless nameAlreadyUsed

    if list?
      list.push new componentClasses[name](name + @id)
    else
      @components.push new componentClasses[name](name + @id)

  removeComponent: (index) ->
    @components.splice index, 1

  addTriggers: =>
    @triggers.push new trigger("Trigger" + @id)
    @id += 1

  addFunction: (name) ->
    f =  new functionClasses[name](name + @id)
    @functions.push f
    @id += 1
    f

  removeFunction: (index) ->
    @functions.splice index, 1

  export: ->

    unless @isValidApp()
      return

    app =
      info: @info
      components: {}
      logic:
        functions: {}
        triggers: {}

    for component in @components
      app.components[component.name] = component.export()

    for func in @functions
      app.logic.functions[func.name] = func.export()

    for trigger in @triggers
      app.logic.triggers[trigger.name] = trigger.export()

    app

  load: (app) ->
    @init()

    @info = app.info

    for name, obj of app.components
      @components.push new componentClasses[obj.type](name, obj.properties)

    for name, obj of app.logic.functions
      @functions.push new functionClasses[obj.type](name, obj.parameters, obj.triggers)

    for name, obj of app.logic.triggers
      @triggers.push new Trigger(name, obj.component, obj.action)

    store.broadcast('app:reload')

  isValidApp: ->
    # Future checks
    true
