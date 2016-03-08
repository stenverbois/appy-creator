<style lang="scss">
@import "./../../style/custom/variables.scss";
@import "./../../style/materializecss/components/color.scss";

.app-window {
  position: absolute;
  left: $component-bar-width;
  width: calc(100% - #{$properties-bar-width} - #{$component-bar-width});
  height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});

  .tabs {
    background-color: rgba(0, 0, 0, 0);
    overflow-x: hidden; //TODO: Remove this when Materializecss fixes the overflow issue
    .tab {
      a {
        @extend .white-text;
      }
    }
  }
}

.gridster {
  ul {
    list-style: none;
    position: relative;
    margin: auto;
  }

  li {
    //Remove background color
    background-color: rgba(0, 0, 0, 0.0);
    &.selected {
      background-color: rgba(255, 0, 0, 1.0);
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
    <div class="row indigo">
      <div class="col s12">
        <ul class="tabs">
          <li class="tab col s3"><a href="#test1" class="active">Design</a></li>
          <li class="tab col s3"><a href="#test2">Logic</a></li>
          <li class="tab col s3"><a href="#test3">Info</a></li>
        </ul>
      </div>
    </div>
    <div class="row">
      <div class="col s12">
        <div class="gridster">
          <ul class="blue-grey lighten-2">
            <li data-row="1" data-col="1" data-sizex="1" data-sizey="1"
                :class="{selected: state.selected == $index}"
                v-for="component in state.app.components"
                @mousedown="state.selected = $index">

              <div>
                <component :is="component.cmpName" :cmp="component"></component>
              </div>

            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
Vue = require 'vue'
module.exports =
  data: ->
    state: store.state

  components: require('../components/components.coffee').components

  computed:
    selectedComponent: ->
      @state.app.components[@state.selected]

  attached: ->
    @gridster = $(".gridster ul").gridster(
      widget_margins: [10, 10]
      widget_base_dimensions: [40, 40]
      shift_widgets_up: false
      max_cols: @state.app.info.width
      min_cols: @state.app.info.width
      min_rows: @state.app.info.height
      max_rows: @state.app.info.height
      draggable:
        stop: =>
          @updateSelectedWidgetProperties()
      resize:
        enabled: true
        stop: =>
          @updateSelectedWidgetProperties()
    ).data 'gridster'

  methods:
    addToGrid: ->
      @gridster.addVueComp()

    updateSelectedWidgetProperties: ->
      widget = $('.gridster li.selected').first()
      Vue.nextTick =>
        @selectedComponent.properties.dim.value =
          row: parseInt(widget.attr("data-row")) - 1
          col: parseInt(widget.attr("data-col")) - 1
          width: parseInt widget.attr("data-sizex")
          height: parseInt widget.attr("data-sizey")
</script>
