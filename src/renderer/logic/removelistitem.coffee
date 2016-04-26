Function = require './function'

module.exports =
class RemoveListItem extends Function
  constructor: (name, parameters={}, triggers=[]) ->
    super(name, parameters, triggers)
    @type = "RemoveListItem"
    @parameterNames = [
    ]
    @outputNames = [
    ]
