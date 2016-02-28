// var Button = Vue.extend(ButtonOptions)
// Vue.component('cmp-button', Button)

Vue.config.debug = true

var vm = new Vue({
  el: 'app',
  data: {
    component_1: new ButtonClass(),
    component_2: new TextboxClass(),
    component_3: new TextboxClass(),
    component_4: new LabelClass(),
  },
  computed: {
    computed_1: function() {
      return this.component_2.properties.name.value + " and " + this.component_3.properties.name.value
    }
  },
  methods: {
    method_1: function() {
      this.component_4.properties.name.value = this.computed_1
    }
  },
})
