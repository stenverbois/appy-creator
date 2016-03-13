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

        test:
          type: 'nested'
          value:
            name:
              name:'test'
              type: 'text'
              value: 'boe'
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @index = 0
      @properties.add.func = @addItem
      @properties.delete.func = @removeItem
      @properties.items.func = @setText
      @selected = 0


    getItemFromArray: (array, key, value) ->
      for item in array
        if item[key] is value
          return item

    setText: =>
      @selected = parseInt($('select').val())
      @properties.item_value.value = @getItemFromArray(@properties.items.items, "index", @selected).message

    addItem: =>
      @properties.items.items.push {index: @index, message: "New Item", name: "item_" + @index}
      @index += 1

      # Update materializecss select box
      $('select').material_select()

    removeItem: =>
      item = @getItemFromArray(@properties.items.items, "index", @selected)
      items = @properties.items.items
      items.splice items.indexOf(item), 1

      # Update materializecss select box
      $('select').material_select()
