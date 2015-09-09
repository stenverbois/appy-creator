<style lang="less">
@import "./../../style/variables.less";

.components {
  background-color: lightgray;
  position: absolute;
  left: 0;
  width: @component-bar-width;
  overflow: auto;
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";
}
</style>

<template>
  <div class="components">Components
    <button class="btn"
      v-draggable="button: {a: 'YES'}"
      v-dropzone="component: testFunc2()">
      TEST
    </button>
  </div>
</template>

<script lang="coffee">
module.exports =
  inherit: true

  data: ->
    test: 6

  methods:
    testfunc2: ->
      alert("sadface :(")
</script>
