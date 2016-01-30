Vue = require 'vue'

module.exports =
  nextTick: ->
    Vue.nextTick(->)
    # Return empty array to use with the yield keyword
    []
