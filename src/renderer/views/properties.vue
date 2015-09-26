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
        <!-- Show property info when a component is selected -->
        <div class="" v-if="isComponentSelected()">
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
          <button class="btn red"
                  v-on="click: removeComponent">
            Remove
          </button>
        </div>
        <!-- Else if no component is selected -->
        <div class="" v-if="!isComponentSelected()">
          <h5>Select a component to change its properties!</h5>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  inherit: true
  props: ['component']
  components:
    property: require './property.vue'

  methods:
    # Select the component name contenteditable text
    editComponentName: ->
      $('.property-title-text').selectText()

    # Remove the selected component and reset selection
    removeComponent: ->
      @userApp.removeComponent(@selected)
      @selected = -1

    # Is a component selected
    isComponentSelected: ->
      if @component then true else false
</script>
