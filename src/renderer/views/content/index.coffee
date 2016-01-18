#require './style.less'

module.exports =
  template: require './template.html'
  components:
    components: require '../components.vue'
    properties: require '../properties.vue'
    'app-view': require '../app-view.vue'

  data: ->
    state: store.state
    selected: -1

  computed:
    selectedComp: ->
      @state.app.components[@selected]
