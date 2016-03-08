<style lang="scss">
@import "./../../style/custom/variables.scss";

.properties {
  position: absolute;
  right: 0;
  width: $properties-bar-width;
  height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});

  .collection {
    margin-top: 0px;
    border: 0px;

    .collection-item {
      margin-top: 5px;
    }
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
      <div class="view header indigo-text text-lighten-1">
        Properties
      </div>
      <!-- Show property info when a component is selected -->
      <div v-if="isComponentSelected()">
        <ul class="collection">
          <li class="collection-item" v-for="propertyData in component.properties" v-if="propertyData.type != 'hidden'">
            <property :data="propertyData"></property>
          </li>
          <li class="collection-item center-align">
            <a class="btn-flat red-text btn-remove" @click="removeComponent">
              Remove
            </a>
          </li>
        </ul>
        <!-- </div> -->
      </div>
      <!-- Else if no component is selected -->
      <div class="view text" v-else>
        <p>Select a component to change its properties!</p>
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
