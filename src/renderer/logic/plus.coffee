Function = require './function'

module.exports =
class Plus extends Function
  constructor: (name, parameters={}, triggers=[]) ->
    super(name, parameters, triggers)
    @type = "Plus"
    @parameterNames = [
      { name: 'left', position: 'TopLeft' }
      { name: 'right', position: 'BottomLeft' }
    ]
    @outputNames = [
      { name: 'result', position: 'Right' }
    ]
