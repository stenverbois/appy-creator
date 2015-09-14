<style lang="less">
@import "./../../style/variables.less";

.properties {
  position: absolute;
  right: 0;
  width: @properties-bar-width;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";

  .property-title {
    .property-title-text {
      text-overflow: ellipsis;
      &:focus {
        outline: none;
      }
    }
    .property-title-icon {
      margin-left: auto;
    }
  }

  .property-wrapper {
    margin-left: -10px;
  }

}
</style>

<template>
  <div class="properties blue-grey lighten-5 z-depth-1">
    <div class="row">
      <div class="col s12">
        <div class="property-title valign-wrapper">
          <h4 class="property-title-text left" contenteditable="true">{{component.name}}</h4>
          <i class="property-title-icon material-icons right"
             v-on="click: editComponentName()">
             mode_edit
          </i>
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

  methods:
    editComponentName: ->
      $('.property-title-text').selectText()
</script>
