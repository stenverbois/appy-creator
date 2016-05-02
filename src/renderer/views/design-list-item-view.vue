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
      <components :data.once="components" @add-component="addComponent($arguments)"></components>
      <div class="content">
        <list-item-view :list.sync="list" :selected.sync="selected"></list-item-view>
      </div>
      <properties :component="selectedComponent"></properties>
    </div>
  </main>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state
    selected: -1
    components: [
      {
        title: "Main"
        icon: "language"
        objects: Object.keys require('../components/components.coffee').classes
      }
    ]

  props: ['list']

  computed:
    selectedComponent: ->
      @list.properties.newItemComponents[@selected]

  components:
    'components': require './components.vue'
    'properties': require './properties.vue'
    'list-item-view': require './list-item-view.vue'

  methods:
    addComponent: (args) ->
      @state.app.addComponent(args?[1], @list.properties.newItemComponents)
</script>
