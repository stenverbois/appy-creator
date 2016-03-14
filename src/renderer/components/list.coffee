Component = require './component'
Vue = require 'vue'

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

        itemSelect:
          type: 'select'
          options: []
          selected: null

        delete:
          value: 'Delete item'
          type: 'button'
          func: null

        selectedItemProperties:
          type: 'nested'
          value: null
          emptyMsg: 'Select an item to change it.'
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @index = 0

      @properties.add.onclick = @addItem
      @properties.delete.onclick = @removeItem
      @properties.itemSelect.onchange = @onSelectionChange

    onSelectionChange: =>
      Vue.nextTick =>
        @properties.selectedItemProperties.value = @items()[@properties.itemSelect.selected]

    getItemFromArray: (array, key, value) ->
      for item in array
        if item[key] is value
          return item

    items: =>
      @properties.itemSelect.options

    addItem: =>
      @items().push
        index: @index
        name: "item_#{@index}"
        message:
          name: 'Text'
          type: 'text'
          value: 'New Item'
        visible:
          type: 'switch'
          value: true

      @properties.itemSelect.selected = @index
      @onSelectionChange()
      @index += 1

      # Update materializecss select box
      $('select').material_select()

    removeItem: =>
      # Remove item from item list
      items = @items()
      itemToRemove = @getItemFromArray(items, 'index', @properties.itemSelect.selected)
      items.splice items.indexOf(itemToRemove), 1

      # Reset selected item to none
      @properties.itemSelect.selected = null
      @properties.selectedItemProperties.value = null

      # Update materializecss select box
      $('select').material_select()
