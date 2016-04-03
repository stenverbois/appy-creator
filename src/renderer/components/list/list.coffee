Component = require './../component'
Vue = require 'vue'

# TODO: Remove when we have a better way of assigning the components for each
# list element
Button = require './../button/button'
Label = require './../label/label'
Textbox = require './../textbox/textbox'
Image = require './../image/image'

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
          onclick: null

        itemSelect:
          type: 'select'
          options: []
          selected: null

        delete:
          value: 'Delete item'
          type: 'button'
          onclick: null

        selectedItemProperties:
          type: 'nested'
          value: null
          emptyMsg: 'Select an item to change it.'

        editNewItem:
          value: 'Edit items'
          type: 'button'
          onclick: null

        items: []

        newItemComponents: []

        newItemProperties: (index) ->
          index: index
          name: "item_#{index}"
          components: @newItemComponents
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @index = 0

      @properties.itemSelect.options = @properties.items

      @properties.add.onclick = @addItem
      @properties.delete.onclick = @removeItem
      @properties.editNewItem.onclick = @OpenEditNewItem
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

    OpenEditNewItem: =>
      store.broadcast('nav-listitem', this)
