<style lang="scss">
</style>

<template>
  <div class="row">
    <div class="col s12">
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state

  methods:
    isEditableProperty: (property) ->
      property.type? and property.type isnt 'hidden'
</script>
