Component = require './component'

module.exports =
class Textbox extends Component

  @defaultProperties: ->
    {
      visibility:
        name: 'Visible'
        value: true
        type: 'switch'

      dim:
        value: {}
        type: 'hidden'

      height:
        value: 100
        type: 'hidden'

      name:
        name: 'Text'
        value: 'Sample text'
        type: 'text'
    }

  constructor: (name, properties=Textbox.defaultProperties()) ->
    super name, properties
    @cmpName = 'cmp-textbox'
    @type = "Textbox"
