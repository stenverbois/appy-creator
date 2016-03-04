Component = require './component'

module.exports =
class Label extends Component

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

  constructor: (name, properties=Label.defaultProperties()) ->
    super name, properties
    @cmpName = 'cmp-label'
    @type = "Label"
