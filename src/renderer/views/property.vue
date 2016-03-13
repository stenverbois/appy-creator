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
    'prop-checkbox': require '../components/prop-checkbox.vue'
    'prop-text': require '../components/prop-text.vue'
    'prop-switch': require '../components/prop-switch.vue'
    'prop-range': require '../components/prop-range.vue'
    'prop-button': require '../components/prop-button.vue'
    'prop-select': require '../components/prop-select.vue'
    'prop-nested': require '../components/prop-nested.vue'

  computed:
    propComponent: ->
      "prop-#{@data.type}"

</script>
