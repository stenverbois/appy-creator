<template>
  <div>
    <li v-for="propertyData in data.value" v-if="propertyData.type != 'hidden'">
      <!-- Cleaner: <property :data="propertyData"></property> -->
      <component :is="'prop-' + propertyData.type" :data.sync="propertyData"></component>
    </li>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
  components:
    property: require '../views/property.vue'
    'prop-checkbox': require '../components/prop-checkbox.vue'
    'prop-text': require '../components/prop-text.vue'
    'prop-switch': require '../components/prop-switch.vue'
    'prop-range': require '../components/prop-range.vue'
    'prop-button': require '../components/prop-button.vue'
    'prop-select': require '../components/prop-select.vue'
    'prop-nested': require '../components/prop-nested.vue'
</script>
