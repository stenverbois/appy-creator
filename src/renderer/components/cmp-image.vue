<template>
    <img :src="cmp.properties.file.value" style="width: 100%; height: 100%; pointer-events: none;"
         v-show="cmp.properties.visibility.value">
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
