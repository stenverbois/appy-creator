module.exports =
  class Function
    constructor: (@name, @parameters={}, @triggers=[]) ->
      @triggers = []
      @triggerIndex = 1
    connectParameter: (name, component, output) ->
      if name in @parameterNames
        @parameters[name] = "#{component}.#{output}"
      else
        console.error "'#{name}' is not a valid parameter of #{@name}."

    connectTrigger: (name) ->
      @triggers.push name

    addTrigger: =>
      @triggers.push({index: @triggerIndex, name: ""})
      @triggerIndex += 1

    export: ->
      {
        @type
        @parameters
        @triggers
      }
