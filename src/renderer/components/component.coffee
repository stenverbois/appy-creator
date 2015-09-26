{EventEmitter} = require 'events'

module.exports =
class Component extends EventEmitter
  @visible = true
  @name = "Undefined" 
