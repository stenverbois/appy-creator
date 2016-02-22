<style lang="less">
@import "./../../style/main.less";

.properties {
  position: absolute;
  right: 0;
  width: @properties-bar-width;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";

  .header {
    font-size: 1.8rem;
    margin: 10px 0px 0px 15px;
    color: #ee6e73;
  }

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

  .collection {
    margin-top: 0px;
    border: 0px;
  }

  .input-field label {
    left: 0px;
  }

  .btn-remove {
    font-weight: bold;
    letter-spacing: .5px;
  }
}
</style>

<template>
  <div class="properties z-depth-1">
    <div class="row">
      <div class="">
        <!-- Show property info when a component is selected -->
        <div class="" v-if="isComponentSelected()">
          <div class="property-title valign-wrapper">
            <!-- <h4 class="property-title-text left" contenteditable="true">{{component.name}}</h4>
            <i class="property-title-icon material-icons right"
               @click="editComponentName()">
              mode_edit
            </i> -->
            <div class="header">
              Properties
            </div>
          </div>
          <!-- <div class="property-wrapper"> -->
          <ul class="collection">
            <li class="collection-item" v-for="propertyData in component.properties">
              <property :data="propertyData"></property>
            </li>
            <li class="collection-item center-align">
              <a class="btn-flat red btn-remove" @click="removeComponent">
                Remove
              </a>
            </li>

          </ul>
          <!-- </div> -->
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
  data: ->
    state: store.state

  props: ['component']
  components:
    property: require './property.vue'

  methods:
    # Select the component name contenteditable text
    editComponentName: ->
      $('.property-title-text').selectText()

    # Remove the selected component and reset selection
    removeComponent: ->
      @state.app.removeComponent(@state.selected)
      @state.selected = -1

    # Is a component selected
    isComponentSelected: ->
      if @component then true else false
</script>
