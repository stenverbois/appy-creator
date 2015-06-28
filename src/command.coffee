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

  ###*
   * Get the callback registerd to a command
   * @param  {String} command The command name
   * @return {Function}       The callback that is registered to the command
  ###
  @get: (command) ->
    commandRegistery[command]
