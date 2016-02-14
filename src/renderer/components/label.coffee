Component = require './component'

module.exports =
class Label extends Component

  @defaultProperties =
    visibility:
      name: 'Visible'
      value: true
      type: 'checkbox'

    name:
      name: 'Value'
      value: 'Sample text'
      type: 'text'

  constructor: (@properties=Label.defaultProperties) ->
    @name = 'Test'
    @cmpName = 'cmp-label'
