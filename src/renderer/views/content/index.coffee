require './style.less'

module.exports =
  template: require('./template.html')
  components:
    components: require './../components.vue'
    properties: require './../properties.vue'
    app: require './../app-view.vue'

  methods:
    testFunc: ->
      alert("LOL")
