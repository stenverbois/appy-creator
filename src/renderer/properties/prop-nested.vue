<template>
  <div>
    <div v-show="data.value != null">
      <!-- <pre>{{data | json}}</pre> -->
      <div v-for="comp in data.value">
        <li v-for="propertyData in comp.properties" v-if="isEditableProperty(propertyData)">
          <!-- Cleaner:  -->
          <!-- <property :data="propertyData"></property> -->
          <component :is="'prop-' + propertyData.type" :data.sync="propertyData"></component>
          <!-- <component :is="''" :data.sync="comp.properties[0]"></component> -->
        </li>
      </div>
    </div>
    <div v-else>
      <p v-text="data.emptyMsg"></p>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']

  components:
    property: require '../views/property.vue'
    'prop-checkbox': require './prop-checkbox.vue'
    'prop-text': require './prop-text.vue'
    'prop-switch': require './prop-switch.vue'
    'prop-range': require './prop-range.vue'
    'prop-button': require './prop-button.vue'
    'prop-select': require './prop-select.vue'
    'prop-nested': require './prop-nested.vue'

  methods:
    isEditableProperty: (property) ->
      property.type? and property.type isnt 'hidden'
</script>
