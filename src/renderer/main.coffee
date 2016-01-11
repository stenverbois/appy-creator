require 'gridster'
require 'gridster-css'

window.jQuery = require("jquery")
window.$ = require("jquery")
require("materialize-css/dist/css/materialize.min.css")
require("materialize-css/dist/js/materialize.min.js")

# SelectText function for selecting text in contenteditable elements
# source: http://stackoverflow.com/questions/12243898/how-to-select-all-text-in-contenteditable-div
window.jQuery.fn.selectText = ->
  element = this[0]
  console.log(this, element)
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

Vue = require 'vue'
Vue.config.debug = true

UserApp = require './user-app'

global.store =
  state:
    app: new UserApp()

store.state.app.init()

appOptions = require './app.vue'

app = new Vue appOptions
data = app.$data

# data.userApp = userApp

# Mount the data on the DOM
app.$mount '#app'
