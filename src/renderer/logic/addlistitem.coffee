Function = require './function'

module.exports =
class AddListItem extends Function
  constructor: (name, genItems, parameters={}, triggers=[]) ->
    super(name, parameters, triggers)
    @type = "AddItem"
    @parameterNames = ({name: comp.name} for comp in genItems)

    @outputNames = [
    ]
