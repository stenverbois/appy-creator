<style lang="scss">
@import "./../../style/custom/variables.scss";

.components {
  position: absolute;
  left: 0;
  width: $component-bar-width;
  overflow: hidden;
  height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});

  .collapsible {
    box-shadow: none;
    border-right: none;
    border-left: none;
  }

  .collection-item {
    a.btn-flat {
      width: 100%;
    }
  }
}
</style>

<template>
  <div class="components z-depth-1">
    <div class="view header indigo-text text-lighten-1">
      Components
    </div>
    <ul class="collapsible" data-collapsible="accordion">
      <li>
        <div class="collapsible-header"><i class="material-icons">view_module</i>Standard</div>
        <div class="collapsible-body">
          <ul class="collection">
            <li class="collection-item">
              <a class="btn-flat" @click="state.app.addComponent('Button')">Button</a>
            </li>
            <li class="collection-item">
              <a class="btn-flat" @click="state.app.addComponent('Label')">Label</a>
            </li>
            <li class="collection-item">
              <a class="btn-flat" @click="state.app.addComponent('Textbox')">Textbox</a>
            </li>
            <li class="collection-item">
              <a class="btn-flat" @click="state.app.addComponent('Image')">Image</a>
            </li>
            <li class="collection-item">
              <a class="btn-flat" @click="state.app.addComponent('List')">List</a>
            </li>
          </ul>
        </div>
      </li>
      <li>
        <div class="collapsible-header"><i class="material-icons">language</i>Other</div>
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
