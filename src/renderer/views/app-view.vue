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
    <div class="row">
      <div class="col s12">
        <div class="gridster">
          <ul class="blue-grey lighten-2">
            <li data-row="1" data-col="1" data-sizex="1" data-sizey="1" v-for="component in state.app.components" :class="{selected: state.selected == $index}">
              <div @click="state.selected = $index">
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
        <button class="btn" @click="exportTest()">Export</button>
        <p>Voorbeeld JSON output voor beschreven scenario</p>
        <p><pre>{{testJSON | json}}<pre></p>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">

module.exports =
  data: ->
    state: store.state
    testJSON: {}

  components: require('../components/components.coffee').components

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

  created: ->
    console.log @$options.components['cmp-button'].options

  methods:
    addToGrid: ->
      @gridster.addVueComp()

    exportTest: ->
      # ipc = require('electron').ipcRenderer
      {Button, Textbox, Label} = require('../components/components.coffee').classes
      # ipc.send('export:class', classes.Button)

      # Exporting tests
      # console.log(JSON.stringify(obj.properties)) for obj in @state.app.components

      # Scenario: Button die text van label set op text van textbox1 + textbox2
      # eerste parameter is 'name', = unieke id
      button1 = new Button('button1')
      text1 = new Textbox('text1')
      text2 = new Textbox('text2')
      label1 = new Label('label1')

      Trigger = require '../logic/trigger'
      {Plus, Set} = require '../logic/function'

      # Plus has 2 inputs (left, right) and 1 output (result)
      plus1 = new Plus()
      plus1.connectParameter('right', 'text1', 'name') # connect text1:name (=textbox text) to plus1:right
      plus1.connectParameter('left', 'text2', 'name') # connect text2:name to plus1:left

      # Set has 1 input (input) and 1 output (output)
      set1 = new Set()
      trigger1 = new Trigger('trigger1', 'button1', 'click') # define trigger1 as a click on button1
      set1.connectParameter('input', 'plus1', 'result') # connect plus1:result to set1:input
      set1.connectTrigger('trigger1') # connect trigger1 to the set function

      # Set the input member of the name object on label to be set1:output
      label1.properties.name.input =
        component: 'set1'
        output: 'output'
      # Dit is een beetje raar maar dus da zou er zo uit zien (de lijntjes me de plus extra)
      # label1: {
      #   properties: {
      #     name: {
      #           name: 'Value'
      #           value: 'Sample text'
      #           type: 'text'
      # +         input: {
      # +           component: 'set1'
      # +           output: 'output'
      # +         }
      #     }
      #     ...
      #   }
      #   ...
      # }
      #
      # De gegenereerde html zou dan in plaats van
      #   <div class="label" v-text="some_component.properties.name.value"></div>
      # zijn:
      #   <div class="label" v-text="some_computed_property"></div>

      console.log JSON.stringify('Button1', button1.properties)

      # Output (ik cheat hier wa door de keys al ne naam te geven, in principe zouden die ook moeten komen van het object zelf)
      @testJSON =
        components:
          button1: button1.properties
          text1: text1.properties
          text2: text2.properties
          label1: label1.properties
        logic:
          triggers:
            trigger1: trigger1.export()
          functions:
            plus1: plus1.export()
            set1: set1.export()
</script>
