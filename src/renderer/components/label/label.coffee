Component = require './../component'

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

      page:
        value: 'Page0'
        type: 'hidden'

      text:
        name: 'Text'
        value: 'Sample text'
        type: 'text'
        primary: true
    }

  constructor: (name, properties=Label.defaultProperties()) ->
    super name, properties
    @cmpName = 'cmp-label'
    @type = "Label"
