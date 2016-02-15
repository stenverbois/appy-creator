module.exports =
class Trigger
  constructor: (@name='', @component='', @action='') ->

  export: ->
    {
      name: @name
      component: @component
      action: @action
    }
