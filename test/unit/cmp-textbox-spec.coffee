Vue = require 'vue'
Textbox = require 'src/renderer/components/cmp-textbox'

describe 'Textbox component', ->
  it 'has an "attached" hook', ->
    expect(typeof Textbox.attached).toBe 'function'
