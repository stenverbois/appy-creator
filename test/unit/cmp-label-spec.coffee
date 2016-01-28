Vue = require 'vue'
Button = require 'src/renderer/components/cmp-label'

describe 'Label component', ->
  it 'has an "attached" hook', ->
    expect(typeof Button.attached).toBe 'function'
