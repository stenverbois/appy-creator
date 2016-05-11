Array::remove = (e) -> @[t..t] = [] if (t = @indexOf(e)) > -1

module.exports =
class Function
  @isForList : false

  constructor: (@name, @parameters={}, @triggers=[], @outputs=[]) ->
    @visibleInLogic = false


  connectParameter: (name, component, output) ->
    if name in (@parameterNames.map (e) -> e.name)
      @parameters[name] = "#{component}.#{output}"
    else
      console.error "'#{name}' is not a valid parameter of #{@name}."

  disconnectParameter: (name) ->
      if name in (@parameterNames.map (e) -> e.name)
        delete @parameters[name]

  disconnectTrigger: (name) ->
    @triggers.remove name

  connectTrigger: (name) ->
    @triggers.push name

  disconnectOutput: (name, component) ->
    newOutput = []
    for output in @outputs
      if output != "#{component}.#{name}"
        newOutput.push output
    @outputs = newOutput    

  connectOutput: (name, component) ->
    @outputs.push "#{component}.#{name}"

  export: ->
    {
      @type
      @parameters
      @triggers
      @outputs
    }
