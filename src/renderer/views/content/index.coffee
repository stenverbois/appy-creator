require './style.scss'
module.exports =
  data: ->
    state: store.state

  props: ['page']

  template: require './template.html'

  components:
    components: require '../components.vue'
    properties: require '../properties.vue'
    designView: require '../app-view.vue'
    logicView: require '../logic-view.vue'
    infoView: require '../info-view.vue'
    itemListView: require '../../components/list/generic_list_item.vue'
