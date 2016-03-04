Component = require './component'

module.exports =
class Image extends Component

  @defaultProperties: ->
    {
      visibility:
        name: 'Visible'
        value: true
        type: 'switch'

      dim:
        value: {}
        type: 'hidden'

      file:
        name: 'Image Source'
        value: 'appy.png'
        type: 'text'
    }

  constructor: (name, properties=Image.defaultProperties()) ->
    super name, properties
    @cmpName = 'cmp-image'
    @type = "Image"
