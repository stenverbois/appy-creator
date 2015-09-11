require 'gridster'
require 'gridster-css'

Vue = require 'vue'
Vue.use require('vue-dnd')
Vue.config.debug = true

appOptions = require './app.vue'

app = new Vue appOptions


# Mount the data on the DOM
app.$mount('#app')
