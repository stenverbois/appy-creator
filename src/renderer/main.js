var Vue = require('vue')
Vue.config.debug = true
Vue.use(require('vue-dnd'))
var appOptions = require('./app.vue')
require('gridster')
require('gridster-css')
var app = new Vue(appOptions).$mount('#app')
