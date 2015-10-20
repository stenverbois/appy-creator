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
      v-draggable="button: {a: 'YES'}"
      v-dropzone="component: testFunc2()">
      TEST
    </button>
    <button class="btn"
            v-on="click: userApp.addComp('Button')">
      Button
    </button>

    <button class="btn"
            v-on="click: userApp.addComp('Label')">
        Label
      </button>

      <button class="btn"
              v-on="click: userApp.addComp('Textbox')">
          Textbox
        </button>
  </div>
</template>

<script lang="coffee">
module.exports =
  inherit: true

  data: ->
    test: 6

</script>
