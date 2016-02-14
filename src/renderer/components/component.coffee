{EventEmitter} = require 'events'

module.exports =
class Component extends EventEmitter
  constructor: () ->
    @name = "Undefined"
