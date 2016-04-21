{EventEmitter} = require 'events'

module.exports =
class Component extends EventEmitter
  constructor: (@name='NoName', @properties) ->

  getDefaultOutput: ->
    return 'text'

  export: ->
    exportObj =
      type: @type
      properties: jQuery.extend true, {}, @properties

    #TODO: crash wtf?
     for propName, prop of exportObj.properties
       if 'value' of prop
         exportObj.properties[propName] = prop.value

    exportObj
