module.exports =
  class AddTextToList extends Function
    constructor:  (name, parameters={}, triggers=[]) ->
      super name, parameters, triggers
      @type = "AddTextToList"
      @parameterNames = ['text', 'list']
      @outputNames = ['list name']
