Vue = require 'vue'
Button = require 'src/renderer/components/cmp-textbox'

describe 'Textbox component', ->
  it 'has an "attached" hook', ->
    expect(typeof Button.attached).toBe 'function'
