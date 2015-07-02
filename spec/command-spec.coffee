command = require './src/command'

describe 'CommandRegistery', ->
  describe 'when a command gets registered', ->
    beforeEach ->
      command.register 'foo:bar', -> 'foobar!'

    afterEach ->
      command.reset()

    it 'increases the size of the registery', ->
      size = command.size()
      command.register 'a', ->
      expect(command.size()).toEqual(size + 1)

    it 'has the right callback', ->
      observed = command.get('foo:bar')()
      expect(observed).toEqual('foobar!')

  describe '::reset()', ->
    it 'empties the registery', ->
      size = command.size()
      expect(size).toEqual(0)

  describe '::dispose()', ->
    it 'disposes the command and callback', ->
      command.dispose 'foo:bar'
      callback = command.get('foo:bar')
      expect(callback).toBeUndefined()
