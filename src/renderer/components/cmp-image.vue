<template>
  <img src="appy.png" style="width: 100%; height: 100%; overflow: hidden; pointer-events: none;"
    v-show="cmp.properties.visibility.value">
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
