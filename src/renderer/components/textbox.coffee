Component = require './component'

module.exports =
class Textbox extends Component

  @defaultProperties =
    visibility:
      name: 'Visible'
      value: true
      type: 'checkbox'

    name:
      name: 'Value'
      value: 'Sample text'
      type: 'text'

  constructor: (@properties=Textbox.defaultProperties) ->
    @name = 'Test'
    @cmpName = 'cmp-textbox'
