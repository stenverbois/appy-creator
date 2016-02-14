Component = require './component'

module.exports =
class Button extends Component

  @defaultProperties =
    visibility:
      name: 'Visible'
      value: true
      type: 'checkbox'

    name:
      name: 'Value'
      value: 'Sample text'
      type: 'text'

  constructor: (@properties=Button.defaultProperties) ->
    @name = 'Test'
    @cmpName = 'cmp-button'
