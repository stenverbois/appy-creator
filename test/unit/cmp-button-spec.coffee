Vue = require 'vue'
Vue.config.debug = true

ButtonComponent = require 'src/renderer/components/cmp-button'
Button = require 'src/renderer/components/button'

describe 'Button component', ->
  vm = undefined
  beforeEach ->
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

  it 'has a one way binding for the text on the button', ->
    console.log vm.buttonObj.properties.name
    # Changes in the Button object should propagate to the component
    vm.buttonObj.properties.name.value = 'a'
    # TODO: Fix callback hell with generators
    vm.$nextTick ->
      expect(vm.$el.querySelector('button').textContent).toBe 'a'
      vm.buttonObj.properties.name.value = ''
      vm.$nextTick ->
        expect(vm.$el.querySelector('button').textContent).toBe ''

    # Changes in the component should not propagate to the Button object
    # TODO: There should be nextTick here as well. Do this when we have solved callback hell
    vm.buttonObj.properties.name.value = 'a'
    vm.$el.querySelector('button').textContent = 'b'
    expect(vm.buttonObj.properties.name.value).not.toBe 'b'
    vm.$el.querySelector('button').textContent = ''
    expect(vm.buttonObj.properties.name.value).not.toBe ''
