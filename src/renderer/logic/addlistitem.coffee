Function = require './function'

module.exports =
class AddListItem extends Function
  constructor: (listName, genItems, parameters={}, triggers=[]) ->
    super(listName + "_AddListItem", parameters, triggers)
    @type = "AddListItem"
    @parameterNames = ({name: comp.name} for comp in genItems)
    @listName = listName
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
