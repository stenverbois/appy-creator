Component = require './component'

module.exports =
  class List extends Component

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

        name:
          name: 'Text'
          value: 'Sample text'
          type: 'text'
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
