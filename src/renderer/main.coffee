# Jquery requires and plugins
window.jQuery = require 'jquery'
window.$ = require 'jquery'

# Stop...
window.Hammer = require 'hammerjs'
# Time

# Gridster requires
Gridster = require 'gridster'
require 'gridster-css'
 
# jsPlumb = require 'jsplumb'
# window.jsPlumb = jsPlumb

Vue = require 'vue'
App = require './app'

Vue.config.debug = true

css = require '../style/custom/main.scss'

# Gridster addition to allow dynamic registering of components
Gridster.prototype.addVueComp = (vueObj) ->
  $w = this.$el.children('li').last()
  store.state.selected = $w.index()
  return unless $w

  $w.addClass('gs-w').hide()
  this.$widgets = this.$widgets.add($w)
  this.$changed = this.$changed.add($w)

  this.register_widget($w)

  this.set_dom_grid_width()
  this.set_dom_grid_height()

  this.drag_api.set_limits((this.cols * this.min_widget_width) + ((this.cols + 1) * this.options.widget_margins[0]))

  $w.show()

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
  broadcast: (args...) ->
    # Also emit because broadcast doesn't trigger on the instance itself
    app.$emit(args...)
    app.$broadcast(args...)

  state:
    app: new UserApp()
    selected: -1

app.$mount 'app'

# Materializecss initialization
$(document).ready ->
 # the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal()
  $('select').material_select()
