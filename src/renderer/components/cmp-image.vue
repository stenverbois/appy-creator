<template>
  <div class="image">
    <img src="cmp.properties.file.value"
         v-show="cmp.properties.visibility.value">
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
