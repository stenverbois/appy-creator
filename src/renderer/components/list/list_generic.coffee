Vue = require 'vue'

module.exports =
  class ItemList
    constructor: (name) ->
      @parentListName = name
      @gnrcName = "itemlist"
