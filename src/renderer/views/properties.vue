<style lang="less">
@import "./../../style/variables.less";

.properties {
  background-color: lightgray;
  position: absolute;
  right: 0;
  width: @properties-bar-width;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";
}
</style>

<template>
  <div class="properties">
    <h3>Properties</h3>
    <ul>
      <li v-repeat="propertyData in component.properties">
        <property data="{{ propertyData }}"></property>
      </li>
    </ul>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['component']
  components:
    property: require './property.vue'
</script>
