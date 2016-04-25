Function = require './function'

module.exports =
class AddItem extends Function
    constructor: (name, parameters={}, triggers=[]) ->
      super(name, parameters, triggers)
      @type = "AddItem"
      @parameterNames = [
        { name: 'left', position: 'TopLeft' }
        { name: 'right', position: 'BottomLeft' }
      ]
      @outputNames = [
        { name: 'result', position: 'Right' }
      ]
