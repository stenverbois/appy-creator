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

  connectTrigger: (name) ->
    @triggers.push name

  connectOutput: (name, component) ->
    @outputs.push "#{component}.#{name}"

  export: ->
    {
      @type
      @parameters
      @triggers
      @outputs
    }
