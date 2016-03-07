<style lang="scss">
.nav-wrapper {
  .brand-logo {
    margin-left: 0.6rem;
  }
}
</style>

<template>
  <header>
    <nav>
      <div class="nav-wrapper">
        <a class="brand-logo">Appy</a>
        <ul id="nav-mobile" class="left">
        </ul>

        <ul id="nav-mobile" class="right">
          <!-- <li><a @click="uploadFile()">Upload</a></li> -->
          <li><a @click="saveApp()">Save</a></li>
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
ipc = require('electron').ipcRenderer
module.exports =
  data: ->
    state: store.state

    uploadURL: 'localhost:8000'
    qrContent: ''

  components:
    qr: require './qr.vue'

  methods:
    saveApp: ->
      ipc.send 'export:app', JSON.stringify(@state.app.export(), null, 2)

    uploadFile: ->
      request = require 'request'
      formData =
        user: 'john'
        title: 'test'
        file: JSON.stringify @state.app.export()

      request.post
        url: "http://#{@uploadURL}/upload/"
        formData: formData
        (err, httpResponse, body) =>
          if err?
            alert "Upload failed: #{err}"
          else
            alert "Successfully uploaded your appy!\nServer responded with #{body}"
            $(@$refs.qr.$el).empty()
            @$refs.qr.renderQR(body)
            $('#qr_modal').openModal();


</script>
