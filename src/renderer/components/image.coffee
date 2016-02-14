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

  constructor: (@properties=Image.defaultProperties) ->
    @name = 'Test'
    @cmpName = 'cmp-image'
