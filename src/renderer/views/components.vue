<style lang="less">
@import "./../../style/variables.less";

.components {
  position: absolute;
  left: 0;
  width: @component-bar-width;
  overflow: hidden;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";

  .collapsible-header {
    background-color: lightgray;
  }
}


</style>

<template>
  <div class="components blue-grey lighten-5 z-depth-1">
    <ul class="collapsible" data-collapsible="accordion">
      <li>
        <div class="collapsible-header"><i class="material-icons">view_module</i>Standard</div>
        <div class="collapsible-body">
          <ul class="collection">
            <li class="collection-item" @click="state.app.addComponent('Button')">Button</li>
            <li class="collection-item" @click="state.app.addComponent('Label')">Label</li>
            <li class="collection-item" @click="state.app.addComponent('Textbox')">Textbox</li>
            <li class="collection-item" @click="state.app.addComponent('Image')">Image</li>
          </ul>
        </div>
      </li>
      <li>
        <div class="collapsible-header"><i class="material-icons">settings</i>Other</div>
        <div class="collapsible-body">
          <p>Stuff</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state
</script>
