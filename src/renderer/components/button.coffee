Component = require './component'

module.exports =
class Button extends Component

  constructor: (@name) ->
    @visible = true
    @properties =
      prop1:
        value: 1
        type: 'number'
      prop2:
        value: 2
        type: 'number'
      prop3:
        value: 'hehe'
        type: 'text'

    @html = '<button>Name: {{selectedComp}}</button>'
    @cmpName = 'cmp-button'
