Vue = require 'vue'
Vue.config.debug = true

{nextTick} = require './util'
runGenerator = require 'jasmine-es6-generator'

LabelComponent = require 'src/renderer/components/cmp-label'
Label = require 'src/renderer/components/label'

describe 'Label component', ->
  vm = new Vue(
    template: '<div><label-component :cmp="labelObj"></label-component></div>'
    components: {
      "label-component": LabelComponent
    }
    data: ->
      labelObj: new Label()
  ).$mount()

  it 'has an "attached" hook', ->
    expect(typeof LabelComponent.attached).toBe 'function'

  it 'renders the correct default text on the label', ->
    expect(vm.$el.querySelector('div.label').textContent).toBe 'Sample text'

  it 'has a one way binding for the text on the label', runGenerator ->
    # Changes in the Label object should propagate to the component
    vm.labelObj.properties.name.value = 'a'
    yield nextTick()
    expect(vm.$el.querySelector('.label').textContent).toBe 'a'

    vm.labelObj.properties.name.value = ''
    yield nextTick()
    expect(vm.$el.querySelector('.label').textContent).toBe ''

    # Changes in the component should not propagate to the Label object
    vm.labelObj.properties.name.value = 'a'
    vm.$el.querySelector('.label').textContent = 'b'
    yield nextTick()
    expect(vm.labelObj.properties.name.value).not.toBe 'b'

    vm.$el.querySelector('.label').textContent = ''
    yield nextTick()
    expect(vm.labelObj.properties.name.value).not.toBe ''
