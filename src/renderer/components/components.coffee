module.exports =
  components:
    'cmp-button': require './button/cmp-button.vue'
    'cmp-label': require './label/cmp-label.vue'
    'cmp-textbox': require './textbox/cmp-textbox.vue'
    'cmp-image': require './image/cmp-image.vue'
    'cmp-list': require './list/cmp-list.vue'

  classes:
    Button: require './button/button'
    Label: require './label/label'
    Textbox: require './textbox/textbox'
    Image: require './image/image'
    List: require './list/list'

  generic:
    List: require './list/list_generic'
