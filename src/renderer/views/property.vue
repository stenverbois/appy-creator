<style lang="sass">
</style>

<template>
  <div>
    <component :is="propComponent" :data.sync="data"></component>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
  components:
    'prop-checkbox': require '../properties/prop-checkbox.vue'
    'prop-text': require '../properties/prop-text.vue'
    'prop-switch': require '../properties/prop-switch.vue'
    'prop-range': require '../properties/prop-range.vue'
    'prop-button': require '../properties/prop-button.vue'
    'prop-select': require '../properties/prop-select.vue'
    'prop-nested': require '../properties/prop-nested.vue'

  computed:
    propComponent: ->
      "prop-#{@data.type}"

</script>
