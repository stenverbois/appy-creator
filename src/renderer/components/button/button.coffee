Component = require './../component'

module.exports =
class Button extends Component

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

      onEvent:
        name: 'onEvent'
        primary: true
    }


  constructor: (name, properties=Button.defaultProperties()) ->
    super name, properties
    @cmpName = 'cmp-button'
    @type = "Button"
