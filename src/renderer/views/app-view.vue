<style lang="scss">
@import "./../../style/custom/variables.scss";
@import "./../../style/materializecss/components/color.scss";

.app-view {
  position: absolute;
  left: $component-bar-width;
  width: calc(100% - #{$properties-bar-width} - #{$component-bar-width});
  height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});

  // .tabs-row {
  //   margin-bottom: 0;
  // }
  //
  // .tabs {
  //   background-color: rgba(0, 0, 0, 0);
  //   overflow-x: hidden; //TODO: Remove this when Materializecss fixes the overflow issue
  //   .tab {
  //     a {
  //       @extend .white-text;
  //     }
  //   }
  // }

  .app-preview {
    height: calc(100% - #{$tab-bar-height});
    position: relative;
    margin-bottom: 0;
    .valign-wrapper {
      height: 100%;

      .valign {
        width: 100%;
        vertical-align: middle;

        ul {
          // border-radius: 10px;
        }
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
  <div class="app-view">
    <div class="row app-preview">
      <div class="valign-wrapper">
        <div class="valign center">
          <div class="gridster">
            <ul class="blue-grey lighten-2 card">
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
      widget_margins: [0, 0]
      widget_base_dimensions: [20, 20]
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
