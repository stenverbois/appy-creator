<style lang="less">
</style>

<template>
  <component is="{{propComponent}}" data="{{data}}"></component>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
  components:
    'prop-checkbox': require('../components/prop-checkbox.vue')
    'prop-text': require('../components/prop-text.vue')

  computed:
    propComponent: ->
      "prop-#{@data.type}"

</script>
