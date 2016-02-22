Component = require './component'

module.exports =
class Image extends Component

  constructor: ->
    @properties =
      visibility:
        name: 'Visible'
        value: true
        type: 'switch'

      file:
        name: 'Image Source'
        value: 'appy.png'
        type: 'text'

    @name = 'Test'

    @cmpName = 'cmp-image'
