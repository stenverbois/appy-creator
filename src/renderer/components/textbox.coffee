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

      page:
        value: 'Page0'
        type: 'hidden'

      text:
        name: 'Text'
        value: 'Sample text'
        type: 'text'
        primary: true
    }

  constructor: (name, properties=Textbox.defaultProperties()) ->
    super name, properties
    @cmpName = 'cmp-textbox'
    @type = "Textbox"
