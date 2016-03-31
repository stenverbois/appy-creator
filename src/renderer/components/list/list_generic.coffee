Vue = require 'vue'

module.exports =
  class ListItem
    constructor: (name) ->
      @parentListName = name
      @gnrcName = "itemlist"
