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
      <components></components>
      <div class="content">
        <component :is="page" :list="list" keep-alive></component>
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
    components: require './components.vue'
    properties: require './properties.vue'
    designView: require './app-view.vue'
    logicView: require './logic-view.vue'
    infoView: require './info-view.vue'
    listItemView: require './list-item-view.vue'

</script>
