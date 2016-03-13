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
          func: null

        items:
          type: 'select'
          items: []
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"

      @properties.add.func = @addItem
      @properties.delete.func = @removeItem

    addItem: =>
      newIndex = @properties.items.items.length
      @properties.items.items.push {index: newIndex, message: "New Item", name: "item_" + newIndex}

      # Update materializecss select box
      $('select').material_select()

    removeItem: (index) =>
      @properties.items.items.splice index, 1

      # Update materializecss select box
      $('select').material_select()
