Function = require './function'

module.exports =
class RemoveListItem extends Function
  constructor: (listName, parameters={}, triggers=[]) ->
    @listName = listName
    super(@listName + "_RemoveListItem", parameters, triggers)
    @type = "RemoveListItem"
    @parameterNames = [
    ]
    @outputNames = [
    ]

  export: ->
    outputs = @outputs.slice()
    outputs.push({'name': @listName})
    {
      @type
      @parameters
      @triggers
      outputs
    }

