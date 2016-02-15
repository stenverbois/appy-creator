module.exports =
  Function: class Function
    constructor: (@name, @parameters={}) ->

    connectParameter: (name, component, output) ->
      if name in @parameterNames
        @parameters[name] =
          component: component
          output: output
      else
        console.error "'#{name}' is not a valid parameter of #{@name}."

    export: ->
      {
        name: @name
        parameters: @parameters
      }

  Plus: class Plus extends Function
    constructor: (@name, @parameters={}) ->
      @parameterNames = ['left', 'right']
      @outputNames = ['result']

  Action: class Action extends Function
    constructor: (@name, @parameters={}, @trigger='') ->

    connectTrigger: (name) ->
      @trigger = name

    export: ->
      {
        name: @name
        parameters: @parameters
      }

  Set: class Set extends Action
    constructor: (@name, @parameters={}, @trigger='') ->
      @parameterNames = ['input']
      @outputNames = ['output']
