<style lang="scss">
@import "./../../style/custom/variables.scss";
@import "./../../style/materializecss/components/color.scss";

.list-item-view {
  height: calc(100%);
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

  .back {
    margin: 2rem;
    position: absolute;
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
      border-color: red;
      border-width: medium;
      border-style: solid;
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
  <div class="row list-item-view">
    <a class="btn-floating btn-large waves-effect waves-light back"
       @click="navBack"><i class="material-icons">arrow_back</i></a>
    <div class="valign-wrapper">
      <div class="valign center">
        <div class="gridster">
          <ul class="blue-grey lighten-2 card">
            <li data-row="1" data-col="1" data-sizex="1" data-sizey="1"
            :class="{selected: selected == $index}"
            v-for="component in list.properties.newItemComponents"
            @mousedown="selected = $index">

            <div>
              <component :is="component.cmpName" :cmp="component"></component>
            </div>

          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
Vue = require 'vue'
module.exports =
  data: ->
    state: store.state

  props: ['list', 'selected']

  components: require('../components/components.coffee').components

  computed:
    selectedComponent: ->
      @list.properties.newItemComponents[@selected]

  attached: ->
    @gridster = $(".gridster ul").gridster(
      widget_margins: [0, 0]
      widget_base_dimensions: [20, 20]
      shift_widgets_up: false
      max_cols: @list.properties.dim.value.width
      min_cols: @list.properties.dim.value.width
      min_rows: @list.properties.dim.value.height
      max_rows: @list.properties.dim.value.height
      auto_move_widgets: false
      draggable:
        stop: =>
          @updateSelectedWidgetProperties()
      resize:
        enabled: true
        stop: =>
          @updateSelectedWidgetProperties()
    ).data 'gridster'

    @restoreFromList()

  methods:
    addToGrid: ->
      @gridster.addVueComp()
      Vue.nextTick =>
        @updateSelectedWidgetProperties()

    updateSelectedWidgetProperties: ->
      widget = $('.gridster li.selected').first()
      Vue.nextTick =>
        @selectedComponent?.properties.dim.value =
          row: parseInt(widget.attr("data-row")) - 1
          col: parseInt(widget.attr("data-col")) - 1
          width: parseInt widget.attr("data-sizex")
          height: parseInt widget.attr("data-sizey")

    navBack: ->
      @$dispatch('nav-design-app')

    restoreFromList: ->
      Vue.nextTick =>
        for widget, idx in @gridster.$widgets
          widget_dim = @list.properties.newItemComponents[idx]?.properties.dim.value
          if widget_dim
            @gridster.move_widget $(widget), widget_dim.col+1, widget_dim.row+1
            @gridster.resize_widget $(widget), widget_dim.width, widget_dim.height

</script>
