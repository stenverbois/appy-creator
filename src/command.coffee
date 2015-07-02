commandRegistery = {}

module.exports =
class CommandRegistery
  ###*
   * Register a new command to the commands registery.
   * @param  {String}   command  The command name
   * @param  {Function} callback The callback to be used
  ###
  @register: (command, callback) ->
    commandRegistery[command] = callback

  @dispose: (command) ->
    delete commandRegistery[command]?

  ###*
   * Get the callback registered to a command
   * @param  {String} command The command name
   * @return {Function}       The callback that is registered to the command
  ###
  @get: (command) ->
    commandRegistery[command] if command of commandRegistery

  ###*
   * Get the number of commands registered in the registery
   * @return {Number} The number of commands registered
  ###
  @size: ->
    Object.keys(commandRegistery).length
