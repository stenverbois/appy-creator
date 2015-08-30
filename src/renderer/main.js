$(document).on("mousedown", ".gridster button", function(e) {
  console.log("click")
})

var Vue = require('vue')
Vue.use(require('vue-dnd'))
var appOptions = require('./app.vue')
require('gridster')
require('gridster-css')
var app = new Vue(appOptions).$mount('#app')
