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

        add:
          value: 'Add Item'
          type: 'button'
          items: ""
          #func: ""

        select:
          type: 'listbox'
          items: ""
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @items = []
      properties.add.items = @items
      properties.select.items = @items

    methods:
      addItem: ->
        @items.push("New Item")


