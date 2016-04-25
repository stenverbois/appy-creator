Function = require './function'

module.exports =
class RemoveItem extends Function
  constructor: (name, parameters={}, triggers=[]) ->
    super(name, parameters, triggers)
    @type = "RemoveItem"
    @parameterNames = [
    ]
    @outputNames = [
    ]
