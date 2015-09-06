Component = require './component'

module.exports =
class Button extends Component

  constructor: ->
    @properties =
      name:
        value: 'Sample text'
        type: 'text'

    @cmpName = 'cmp-button'

    @html = 'app html TODO'
