Component = require './component'
Vue = require 'vue'

# TODO: Remove when we have a better way of assigning the components for each
# list element
Button = require './button'
Label = require './label'
Textbox = require './textbox'
Image = require './image'

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

        items: []

        newItemProperties: (index) ->
          index: index
          name: "item_#{index}"
          components: [new Button(), new Label()]
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @index = 0

      @properties.itemSelect.options = @properties.items

      @properties.add.onclick = @addItem
      @properties.delete.onclick = @removeItem
      @properties.itemSelect.onchange = @onSelectionChange

    onSelectionChange: =>
      Vue.nextTick =>
        @properties.selectedItemProperties.value = @getItemFromArray(@properties.items, 'index', @properties.itemSelect.selected).components

    getItemFromArray: (array, key, value) ->
      for item in array
        if item[key] is value
          return item

    addItem: =>
      @properties.items.push @properties.newItemProperties(@index)

      @properties.itemSelect.selected = @index
      @onSelectionChange()
      @index += 1

      # Update materializecss select box
      $('select').material_select()

    removeItem: =>
      # Remove item from item list
      itemToRemove = @getItemFromArray(@properties.items, 'index', @properties.itemSelect.selected)
      @properties.items.splice @properties.items.indexOf(itemToRemove), 1

      # Reset selected item to none
      @properties.itemSelect.selected = null
      @properties.selectedItemProperties.value = null

      # Update materializecss select box
      $('select').material_select()
