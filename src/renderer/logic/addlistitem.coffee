Function = require './function'

module.exports =
class AddListItem extends Function
  constructor: (name, parameters={}, triggers=[]) ->
    super(name, parameters, triggers)
    @type = "AddItem"
    @parameterNames = [
    ]
    @outputNames = [
      { name: 'list', position: 'Left' }
    ]
