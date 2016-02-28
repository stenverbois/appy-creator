Component = require './component'

module.exports =
class Textbox extends Component

  @defaultProperties: ->
    {
      visibility:
        name: 'Visible'
        value: true
        type: 'switch'

      name:
        name: 'Text'
        value: 'Sample text'
        type: 'text'
    }

  constructor: (@name, @properties=Textbox.defaultProperties()) ->
    @cmpName = 'cmp-textbox'
    @type = "Textbox"
