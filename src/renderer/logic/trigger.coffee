module.exports =
class Trigger
  constructor: (@name='', @component='', @action='') ->

  export: ->
    {
      component: @component
      action: @action
    }
