<style lang="less">
@import "./../../style/variables.less";

.properties {
  background-color: lightgray;
  position: absolute;
  right: 0;
  width: @properties-bar-width;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";
}

.property {
  margin: 5px 0px 8px 0px
}
</style>

<template>
  <div class="properties">
    <div class="row">
      <div class="col s12">
        <h4>Properties</h4>
        <div class="row" v-repeat="propertyData in component.properties">
          <property data="{{ propertyData }}"></property>
        </div>
      </div
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['component']
  components:
    property: require './property.vue'
</script>
