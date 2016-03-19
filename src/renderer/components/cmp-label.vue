<template>
  <div class="label"
    v-text="cmp.properties.text.value"
    v-show="cmp.properties.visibility.value">
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
