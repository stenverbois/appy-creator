module.exports =
  Function: class Function
    constructor: (@name, @parameters={}, @triggers=[]) ->
      @triggers = ["Trigger1"]

    connectParameter: (name, component, output) ->
      if name in @parameterNames
        @parameters[name] = "#{component}.#{output}"
      else
        console.error "'#{name}' is not a valid parameter of #{@name}."

    connectTrigger: (name) ->
      @triggers.push name

    export: ->
      {
        @type
        @parameters
        @triggers
      }

  Plus: class Plus extends Function
    constructor: (name, parameters={}, triggers=[]) ->
      super name, parameters, triggers
      @type = "Plus"
      @parameterNames = ['left', 'right']
      @outputNames = ['result']

