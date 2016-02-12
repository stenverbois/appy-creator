class ButtonClass

  constructor: ->
    @properties =
      visibility:
        name: 'Visible'
        value: true
        type: 'checkbox'

      name:
        name: 'Value'
        value: 'Sample text'
        type: 'text'
    @name = 'Test'

    @cmpName = 'cmp-button'

window.ButtonClass = ButtonClass
