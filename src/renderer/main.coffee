require 'gridster'
require 'gridster-css'

window.jQuery = require("jquery");
window.$ = require("jquery");
require("materialize-css/dist/css/materialize.min.css");
require("materialize-css/dist/js/materialize.min.js");

Vue = require 'vue'
Vue.use require('vue-dnd')
Vue.config.debug = true

UserApp = require './user-app'

appOptions = require './app.vue'

app = new Vue appOptions
data = app.$data

userApp = new UserApp()
userApp.init()

data.userApp = userApp

# Mount the data on the DOM
app.$mount '#app'
