Vue = require 'vue'
Vue.config.debug = true

TextboxComponent = require 'src/renderer/components/cmp-textbox'
Textbox = require 'src/renderer/components/textbox'

describe 'Textbox component', ->
  vm = new Vue(
    template: '<div><textbox-component :cmp="textboxObj"></textbox-component></div>'
    components: {
      "textbox-component": TextboxComponent
    }
    data: ->
      textboxObj: new Textbox()
  ).$mount()

  it 'has an "attached" hook', ->
    expect(typeof TextboxComponent.attached).toBe 'function'
