Component = require './component'

module.exports =
class Label extends Component

  constructor: ->
    @properties =
      visibility:
        name: 'Visible'
        value: true
        type: 'checkbox'

      name:
        name: 'Value'
        value: 'Sample text'
        type: 'text'
        
    @name = 'Test'

    @cmpName = 'cmp-label'
