require 'gridster'
require 'gridster-css'

Vue = require 'vue'
App = require './app'

Vue.config.debug = true

window.jQuery = require("jquery")
window.$ = require("jquery")

# ipcRenderer = require('electron').ipcRenderer

# SelectText function for selecting text in contenteditable elements
# source: http://stackoverflow.com/questions/12243898/how-to-select-all-text-in-
# contenteditable-div
window.jQuery.fn.selectText = ->
  element = this[0]
  if document.body.createTextRange
    range = document.body.createTextRange()
    range.moveToElementText(element)
    range.select()
  else if window.getSelection
    selection = window.getSelection()
    range = document.createRange()
    range.selectNodeContents(element)
    selection.removeAllRanges()
    selection.addRange(range)

app = new Vue App

UserApp = require './user-app'

global.store =
  state:
    app: new UserApp()
    selected: -1

app.$mount 'app'
