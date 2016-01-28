Vue = require 'vue'
Label = require 'src/renderer/components/cmp-label'

describe 'Label component', ->
  it 'has an "attached" hook', ->
    expect(typeof Label.attached).toBe 'function'
