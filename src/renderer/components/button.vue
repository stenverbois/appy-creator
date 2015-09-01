<template>
  <pre>{{ $data | json }}</pre>
</template>

<script lang="coffee">
class Button
  constructor: (@name) ->
    @visible = true

module.exports =
  data: ->
    obj: new Button("NAAM")
</script>
