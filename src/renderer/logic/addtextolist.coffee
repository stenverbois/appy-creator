module.exports =
  class AddTextToList extends Function
    constructor: (name, parameters={}, triggers=[]) ->
      super name, parameters, triggers
      # @type = "AddTextToList"
      # @parameterNames = [
      #   { name: 'text', position: '' }
      #   { name: 'list', position: '' }
      # ]
      # @outputNames = ['list name']
