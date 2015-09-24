require './style.less'

module.exports =
  inherit: true

  template: require './template.html'
  components:
    components: require '../components.vue'
    properties: require '../properties.vue'
    app: require '../app-view.vue'

  data: ->
    selected: 0

  computed:
    components: ->
      @userApp.components

    selectedComp: ->
      @components[@selected]
