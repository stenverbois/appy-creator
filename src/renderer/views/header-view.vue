<style lang="scss">
@import "./../../style/custom/variables.scss";

.nav-wrapper {
  z-index: 10;
  .brand-logo {
    width: $component-bar-width;
    padding-left: 0.6rem;
  }
  ul li a {
    padding: 0 20px;
  }
  .separator {
    width: 3rem;
    // TODO: Better way to show seperator
    // Possibly reworking entire header
    height: 1rem;
  }

  .active {
    height: 60px;
    box-sizing: content-box;
    border-bottom: 4px solid $accent-color;
  }
}
</style>

<template>
  <header>
    <nav class="z-depth-0">
      <div class="nav-wrapper z-depth-1">
        <ul id="nav-mobile" class="left">
          <li><div class="brand-logo z-depth-1">Appy</div></li>
        </ul>
        <ul id="nav-mobile" class="right">
          <li><div :class="{'active': page === 'design-app-view' || page === 'design-list-item-view'}"><a @click="gotoDesignPage()">Design</a></div></li>
          <li><a @click="gotoLogicPage()" :class="{'active': page === 'logic-view'}">Logic</a></li>
          <li><a @click="gotoInfoPage()" :class="{'active': page === 'info-view'}">Info</a></li>
          <li><div class="separator"></div></li>
          <li><a @click="saveApp()">Save</a></li>
          <li><a @click="loadApp()">Load</a></li>
          <li><a class="modal-trigger" href="#upload_modal">Upload</a></li>
        </ul>
      </div>
    </nav>
  </header>

  <div id="upload_modal" class="modal">
    <div class="modal-content">
      <h4>Upload to</h4>
      <input type="text" v-model="uploadURL">
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat indigo white-text" @click="uploadFile()">Upload</a>
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
    </div>
  </div>
  <div id="qr_modal" class="modal">
    <div class="modal-content">
      <qr v-ref:qr></qr>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
  </div>
</template>

<script lang="coffee">
fs = require 'fs'
ipc = require('electron').ipcRenderer
remote = require('electron').remote
dialog = remote.dialog

module.exports =
  props: ['page']
  data: ->
    state: store.state

    uploadURL: 'https://appy-ua.herokuapp.com/'
    qrContent: ''

  components:
    qr: require './qr.vue'

  methods:
    saveApp: ->
      appy_path = dialog.showSaveDialog
        filters: [{ name: 'Appy', extensions: ['appy'] }]

      fs.writeFile appy_path, JSON.stringify(@state.app.export(), null, 2)

    loadApp: ->
      appy_path = dialog.showOpenDialog
        filters: [{ name: 'Appy', extensions: ['appy'] }]
        properties: [ 'openFile' ]

      if appy_path?[0]
        fs.readFile appy_path[0], (err, data) =>
          @state.app.load(JSON.parse(data))

    uploadFile: ->
      request = require 'request'
      formData =
        user: 'john'
        title: 'test'
        file: JSON.stringify(@state.app.export(), null, 2)

      request.post
        url: "#{@uploadURL}/upload/"
        formData: formData
        (err, httpResponse, body) =>
          if err?
            alert "Upload failed: #{err}"
          else
            # alert "Successfully uploaded your appy!\nServer responded with #{body}"
            $(@$refs.qr.$el).empty()
            @$refs.qr.renderQR(body)
            $('#qr_modal').openModal();

    gotoDesignPage: ->
      @$dispatch('nav-design-app')

    gotoLogicPage: ->
      @$dispatch('nav-logic')

    gotoInfoPage: ->
      @$dispatch('nav-info')


</script>
