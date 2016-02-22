Component = require './component'

module.exports =
class Label extends Component

  constructor: ->
    @properties =
      visibility:
        name: 'Visible'
        value: true
        type: 'switch'

      name:
        name: 'Text'
        value: 'Sample text'
        type: 'text'

    @name = 'Test'

    @cmpName = 'cmp-label'
