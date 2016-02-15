module.exports =
  Function: class Function
    constructor: (@name, @parameters={}, @output={}) ->

    connectParameter: (name, component, output) ->
      if name in @parameterNames
        @parameters[name] =
          component: component
          output: output
      else
        console.error "'#{name}' is not a valid parameter of #{@name}."

  Plus: class Plus extends Function
    constructor: (@name, @parameters={}, @output={}) ->
      @parameterNames = ['left', 'right']
      @outputNames = ['result']
