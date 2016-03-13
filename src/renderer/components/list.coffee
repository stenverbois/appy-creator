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

        add:
          value: 'Add Item'
          type: 'button'
          func: null

        items:
          type: 'select'
          items: []
          selected: null

        item_value:
          name: 'Item value'
          value: ''
          type: 'text'

        delete:
          value: 'Delete item'
          type: 'button'
          func: null
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @index = 0
      @properties.add.func = @addItem
      @properties.delete.func = @removeItem
      @properties.items.func = @setText


    getItemFromArray: (array, key, value) ->
      for item in array
        if item[key] is value
          return item


    setText: (selected) =>
      val = @getItemFromArray(@properties.items.items, "index", selected)
      console.log val
      @properties.item_value.value = val.message

    addItem: =>
      @properties.items.items.push {index: @index, message: "New Item", name: "item_" + @index}
      @index += 1

      # Update materializecss select box
      $('select').material_select()

    removeItem: (index) =>
      @properties.items.items.splice index, 1

      # Update materializecss select box
      $('select').material_select()
