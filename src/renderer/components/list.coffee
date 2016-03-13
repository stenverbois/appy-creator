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

        delete:
          value: 'Delete'
          type: 'button'
          func: ""

      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @items = []
      properties.add.func = (@addItem)
      properties.delete.func = (@removeItem)

    addItem: =>
      new_index = @items.length
      @items.push({index: new_index, message: "New Item", name: "item_" + new_index})

    removeItem: (index) =>
      @items.splice(index, 1)


