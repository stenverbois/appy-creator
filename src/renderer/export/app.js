var Button = Vue.extend(ButtonOptions)
Vue.component('cmp-button', Button)

new Vue({
  el: 'app',
  data: {
    classes: [new ButtonClass()]
  }
})
