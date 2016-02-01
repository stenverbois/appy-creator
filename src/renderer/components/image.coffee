Component = require './component'

module.exports =
class Image extends Component

    constructor: ->
      @properties =
        visibility:
          name: 'Visible'
          value: true
          type: 'checkbox'

        name:
          name: 'Image Source'
          value: 'appy.png'
          type: 'text'

  @name = 'Image'

  @cmpName = 'cmp-image'
