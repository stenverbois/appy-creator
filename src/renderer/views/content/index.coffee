require './style.less'

module.exports =
  template: require('./template.html')
  components:
    components: require '../components.vue'
    properties: require '../properties.vue'
    app: require '../app-view.vue'

    "comp-button": require "../../components/button.vue"

  data: ->
    upper: 9001

  methods:
    testFunc: ->
      alert("LOL")
