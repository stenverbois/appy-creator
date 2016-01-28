<style lang="less">
@import "./../../style/variables.less";

.components {
  position: absolute;
  left: 0;
  width: @component-bar-width;
  overflow: hidden;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";
}
</style>

<template>
  <div class="components blue-grey lighten-5 z-depth-1">Components
    <button class="btn"
            @click="state.app.addComponent('Button')">
      Button
    </button>

    <button class="btn"
            @click="state.app.addComponent('Label')">
      Label
    </button>

    <button class="btn"
            @click="state.app.addComponent('Textbox')">
      Textbox
    </button>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state
</script>
