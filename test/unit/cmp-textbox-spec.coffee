Vue = require 'vue'
Vue.config.debug = true

{nextTick} = require './util'
runGenerator = require 'jasmine-es6-generator'

TextboxComponent = require 'src/renderer/components/cmp-textbox'
Textbox = require 'src/renderer/components/textbox'

describe 'Textbox component', ->
  vm = new Vue(
    template: '<div><textbox-component :cmp.sync="textboxObj"></textbox-component></div>'
    components: {
      "textbox-component": TextboxComponent
    }
    data: ->
      textboxObj: new Textbox()
  ).$mount()

  it 'has an "attached" hook', ->
    expect(typeof TextboxComponent.attached).toBe 'function'

  it 'has a two way binding for the text in the textbox', runGenerator ->
    # Changes in the Label object should propagate to the component
    vm.textboxObj.properties.name.value = 'a'
    yield nextTick()
    expect(vm.$el.querySelector('input[type=text]').value).toBe 'a'

    vm.textboxObj.properties.name.value = ''
    yield nextTick()
    expect(vm.$el.querySelector('input[type=text]').value).toBe ''

    # Changes in the component should propagate to the Label object
    # TODO: Changing value property like below doesn't fire change event of textbox
    # and doesn't update its v-model property. Need another way to simulate a
    # textbox input value change
    vm.textboxObj.properties.name.value = 'a'
    vm.$el.querySelector('input[type=text]').value = 'b'
    yield nextTick()
    # expect(vm.textboxObj.properties.name.value).toBe 'b'

    vm.$el.querySelector('input[type=text]').value = ''
    yield nextTick()
    # expect(vm.textboxObj.properties.name.value).toBe ''
