Vue = require 'vue'
Button = require 'src/renderer/components/cmp-button'

describe 'Button component', ->
  # it 'should render correct contents', ->
  #   vm = new Vue({
  #     template: '<div><hello></hello></div>',
  #     components: { Hello }
  #   }).$mount()
  #   expect(vm.$el.querySelector('.hello h1').textContent).toBe 'Hello World!'
  it 'has an "attached" hook', ->
    expect(typeof Button.attached).toBe 'function'
# also see example testing a component with mocks at
# https://github.com/vuejs/vue-loader-example/blob/master/test/unit/a.spec.js#L24-L49
