Vue = require 'vue'
Vue.config.debug = true

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
