Component = require './component'

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

      name:
        name: 'Text'
        value: 'Sample text'
        type: 'text'

    }


  constructor: (@name, @properties=Button.defaultProperties()) ->
    @cmpName = 'cmp-button'
    @type = "Button"
