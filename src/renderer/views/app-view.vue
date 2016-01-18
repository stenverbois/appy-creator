<style lang="less">
@import "./../../style/variables.less";

.app-window {
  position: absolute;
  left: @component-bar-width;
  width: ~"calc(100% - @{properties-bar-width} - @{component-bar-width})";
  height: ~"calc(100% - @{top-bar-height} - @{footer-bar-height})";

  .app-components {

  }
}

.gridster {
  ul {
    list-style: none;
    position: absolute;
    margin: auto;
  }

  li {
    //Remove background color
    background-color: rgba(255, 0, 0, 0.0);;
    &.selected {
      background-color: #ff2222;
    }
  }

  button {
    padding: 0px;
  }

  li > div {
    width: 100%;
    height: 100%;
    padding: 2px;
  }

}

</style>

<template>
  <div class="app-window">
    <div class="row">
      <div class="col s12">
        <div class="gridster">
          <ul class="blue-grey lighten-2">
            <li data-row="1" data-col="1" data-sizex="1" data-sizey="1" v-for="component in state.app.components" :class:selected="selected == $index">

              <div @click="$parent.$parent.selected = $index">
                <component :is="component.cmpName" :cmp="component"></component>
              </div>
            </li>

            <!-- <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
              <button style="width:100%; height:100%;">test</button>
            </li>
            <li data-row="2" data-col="1" data-sizex="1" data-sizey="1">
              <img src="../../../appy.png" style="width:100%; height:100%;" draggable="false" alt="APPY" />
            </li>
            <li data-row="3" data-col="1" data-sizex="1" data-sizey="1"></li> -->
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state

  components:
    'cmp-button': require '../components/cmp-button.vue'
    'cmp-label': require '../components/cmp-label.vue'
    'cmp-textbox': require '../components/cmp-textbox.vue'

  attached: ->
    @gridster = $(".gridster ul").gridster(
      widget_margins: [10, 10]
      widget_base_dimensions: [40, 40]
      resize:
        enabled: true
      shift_widgets_up: false
      max_cols: 4
      min_cols: 4
      min_rows: 4
      max_rows: 6
    ).data 'gridster'

  methods:
    addToGrid: ->
      @gridster.addVueComp()

</script>
