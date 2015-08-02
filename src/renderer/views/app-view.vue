<style lang="less">
@import "./../../style/variables.less";

.app-window {
  /*background-color: red;*/
  position: absolute;
  left: @component-bar-width;
  width: ~"calc(100% - @{properties-bar-width} - @{component-bar-width})";
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";
}

.gridster {
  ul {
    list-style: none;
    position: absolute;
    left: 0;
  }
  li {
    background-color: #fe2;
  }
}
</style>

<template>
  <div class="app-window">
    <div class="gridster">
        <ul>
            <li data-row="1" data-col="1" data-sizex="1" data-sizey="1"></li>
            <li data-row="2" data-col="1" data-sizex="1" data-sizey="1"></li>
            <li data-row="3" data-col="1" data-sizex="1" data-sizey="1"></li>
        </ul>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  attached: ->
    $(".gridster ul").gridster
      widget_margins: [10, 10]
      widget_base_dimensions: [40, 40]
      resize:
        enabled: true
      shift_widgets_up: false
</script>
