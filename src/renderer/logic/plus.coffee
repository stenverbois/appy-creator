module.exports =
  class Plus extends Function
    constructor: (name, parameters={}, triggers=[]) ->
      super name, parameters, triggers
      @type = "Plus"
      @parameterNames = ['left', 'right']
      @outputNames = ['result']
