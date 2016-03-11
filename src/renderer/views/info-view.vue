<style lang="scss">
.info-view {
  margin: 2.5rem;
  width: 60%;

  .save-btn {
    margin-top: 1rem;
  }

  .input-field label {
    left: 0;
  }
}
</style>

<template>
  <div class="row">
    <div class="col s12">
      <div class="view header indigo-text text-lighten-1">
        Info/Settings
      </div>
      <div class="info-view">
        <prop-text :data.sync="appAuthor"></prop-text>
        <prop-text :data.sync="appName"></prop-text>
        <prop-range :data.sync="appPreviewWidth"></prop-range>
        <prop-range :data.sync="appPreviewHeight"></prop-range>
        <a class="waves-effect waves-light btn save-btn" @click="saveInfo()"><i class="material-icons right">save</i>Save</a>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state
    appAuthor:
      name: 'Author'
      value: store.state.app.info.author
      type: 'text'
    appName:
      name: 'Appy Name'
      value: store.state.app.info.appName
      type: 'text'
    appPreviewWidth:
      name: 'App Preview Width'
      value: store.state.app.info.width
      min: 10
      max: 60
    appPreviewHeight:
      name: 'App Preview Height'
      value: store.state.app.info.height
      min: 10
      max: 60

  components:
    'prop-checkbox': require('../components/prop-checkbox.vue')
    'prop-text': require('../components/prop-text.vue')
    'prop-switch': require('../components/prop-switch.vue')
    'prop-range': require('../components/prop-range.vue')

  methods:
    saveInfo: ->
      @state.app.info.author = @appAuthor.value
      @state.app.info.appName = @appName.value
      @state.app.info.width = @appPreviewWidth.value
      @state.app.info.height = @appPreviewHeight.value
</script>
