<style lang="scss" scoped>
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
      <components :data.once="components" :title.once="'Components'" @add-component="addComponent($arguments)"></components>
      <div class="content">
        <app-view></app-view>
      </div>
      <properties :component="selectedComponent"></properties>
    </div>
  </main>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state
    components: [
      {
        title: "Main"
        icon: "dashboard"
        objects: Object.keys require('../components/components.coffee').classes
      }
    ]
  computed:
    selectedComponent: ->
      @state.app.components[@state.selected]

  components:
    'components': require './components.vue'
    'properties': require './properties.vue'
    'app-view': require './app-view.vue'

  methods:
    addComponent: (args) ->
      @state.app.addComponent(args?[1])
</script>
