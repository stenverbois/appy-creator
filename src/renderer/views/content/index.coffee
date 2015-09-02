require './style.less'

Button = require '../../components/button'

module.exports =
  template: require('./template.html')
  components:
    components: require '../components.vue'
    properties: require '../properties.vue'
    app: require '../app-view.vue'

  data: ->
    components: [new Button('Button1'), new Button('Button2'), new Button('Button3'), new Button('Button4')]
    selected: 0

  computed:
    selectedComp: ->
      @components[@selected]

  methods:
    testFunc: ->
      alert("LOL")
