Vue = require 'vue'
Vue.config.debug = true

ButtonComponent = require 'src/renderer/components/cmp-button'
Button = require 'src/renderer/components/button'

describe 'Button component', ->
  vm = new Vue(
    template: '<div><button-component :cmp="buttonObj"></button-component></div>'
    components: {
      "button-component": ButtonComponent
    }
    data: ->
      buttonObj: new Button()
  ).$mount()

  it 'has an "attached" hook', ->
    expect(typeof ButtonComponent.attached).toBe 'function'

  it 'renders the correct default text on the button', ->
    expect(vm.$el.querySelector('button').textContent).toBe 'Sample text'
