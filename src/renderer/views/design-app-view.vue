<style lang="scss">
@import "./../../style/custom/variables.scss";
.content {
  position: absolute;
  left: $component-bar-width;
  width: calc(100% - #{$properties-bar-width} - #{$component-bar-width});
  height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});
}
</style>

<template>
  <main>
    <div class="contents">
      <components @add-component="addComponent($arguments)"></components>
      <div class="content">
        <design-view></design-view>
      </div>
      <properties :component="state.app.components[state.selected]"></properties>
    </div>
  </main>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state

  props: ['page', 'list']

  components:
    'components': require './components.vue'
    'properties': require './properties.vue'
    'design-view': require './app-view.vue'

  methods:
    addComponent: (args) ->
      @state.app.addComponent(args?[0])
</script>
