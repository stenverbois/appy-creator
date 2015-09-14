<style lang="less">
@import "./../../style/variables.less";

.properties {
  position: absolute;
  right: 0;
  width: @properties-bar-width;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";

  .property-wrapper {
    margin-left: -10px;
  }
}
</style>

<template>
  <div class="properties blue-grey lighten-5 z-depth-1">
    <div class="row">
      <div class="col s12">
        <div class="input-field">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
        <div class="property-wrapper">
          <div class="row" v-repeat="propertyData in component.properties">
            <property data="{{ propertyData }}"></property>
            </div>
          </div>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['component']
  components:
    property: require './property.vue'
</script>
