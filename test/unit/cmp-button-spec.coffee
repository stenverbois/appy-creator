Vue = require 'vue'
Vue.config.debug = true

{nextTick} = require './util'
runGenerator = require 'jasmine-es6-generator'

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

  it 'has a one way binding for the text on the button', runGenerator ->
    # Changes in the Button object should propagate to the component
    vm.buttonObj.properties.name.value = 'a'
    yield nextTick()
    expect(vm.$el.querySelector('button').textContent).toBe 'a'

    vm.buttonObj.properties.name.value = ''
    yield nextTick()
    expect(vm.$el.querySelector('button').textContent).toBe ''

    # Changes in the component should not propagate to the Button object
    vm.buttonObj.properties.name.value = 'a'
    vm.$el.querySelector('button').textContent = 'b'
    yield nextTick()
    expect(vm.buttonObj.properties.name.value).not.toBe 'b'

    vm.$el.querySelector('button').textContent = ''
    yield nextTick()
    expect(vm.buttonObj.properties.name.value).not.toBe ''
