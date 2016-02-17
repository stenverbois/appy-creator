Component = require './component'

module.exports =
class Image extends Component

  @defaultProperties =
    visibility:
      name: 'Visible'
      value: true
      type: 'checkbox'

    file:
      name: 'Image Source'
      value: 'appy.png'
      type: 'text'

  constructor: (@name, @properties=Image.defaultProperties) ->
    @cmpName = 'cmp-image'
    @type = "ImageClass"
