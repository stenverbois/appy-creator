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

        editNewItem:
          value: 'Edit items'
          type: 'button'
          onclick: null

        genitems: []

        newItemComponents: []

        newItemProperties: (index) ->
          index: index
          name: name + "item_#{index}"
          data: {}
      }

    constructor: (name, properties=List.defaultProperties()) ->
      super name, properties
      @cmpName = 'cmp-list'
      @type = "List"
      @index = 0

      @properties.editNewItem.onclick = @OpenEditNewItem

    onSelectionChange: =>
      Vue.nextTick =>
        @properties.selectedItemProperties.value = @getItemFromArray(@properties.genitems, 'index', @properties.itemSelect.selected).data

    getItemFromArray: (array, key, value) ->
      for item in array
        if item[key] is value
          return item


    createNewItem: =>
      item = @properties.newItemProperties(@index)
      for newComponent in @properties.newItemComponents
        item.data[newComponent.name] = jQuery.extend(true, {}, newComponent.properties)
        for propName, prop of item.data[newComponent.name]
          if 'value' of prop
            item.data[newComponent.name][propName] = prop.value

      return item

    addItem: =>
      @properties.genitems.push @createNewItem()

      @properties.itemSelect.selected = @index
      @onSelectionChange()
      @index += 1

      # Update materializecss select box
      $('select').material_select()

    removeItem: =>
      # Remove item from item list
      itemToRemove = @getItemFromArray(@properties.genitems, 'index', @properties.itemSelect.selected)
      @properties.genitems.splice @properties.genitems.indexOf(itemToRemove), 1

      # Reset selected item to none
      @properties.itemSelect.selected = null
      @properties.selectedItemProperties.value = null

      # Update materializecss select box
      $('select').material_select()

    OpenEditNewItem: =>
      store.broadcast('nav-listitem', this)


    export: ->
      json = super()

      #remove clutter
      delete json.properties.itemSelect
      delete json.properties.delete
      delete json.properties.add
      delete json.properties.editNewItem
      delete json.properties.itemSelect
      delete json.properties.selectedItemProperties

      json

    dataFields: ->
      ['visibility', 'dim', 'page', 'genitems']
