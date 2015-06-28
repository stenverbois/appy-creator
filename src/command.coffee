commandRegistery = {}

module.exports =
class CommandRegistery
  @register: (command, callback) ->
    commandRegistery[command] = callback

  @get: (command) ->
    commandRegistery[command]
