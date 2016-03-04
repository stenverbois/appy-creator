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
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" @click="uploadFile()">Upload</a>
    </div>
  </div>

</template>

<script lang="coffee">
ipc = require('electron').ipcRenderer
module.exports =
  data: ->
    state: store.state
    uploadURL: "localhost:8000"

  methods:
    saveApp: ->
      compArray = {"components": {}, "logic": {}}
      for obj in @state.app.components
        compArray["components"][obj.name] =
          properties: obj.properties
          type: obj.type

      ipc.send 'export:app', JSON.stringify(compArray, null, 2)
    uploadFile: ->
      compArray = {"components": {}, "logic": {}}
      for obj in @state.app.components
        compArray["components"][obj.name] =
          properties: obj.properties
          type: obj.type

      console.log "http://#{@uploadURL}/upload/"

      $.post "http://#{@uploadURL}/upload/",
        user: 'John Doe'
        title: 'Test'
        file: JSON.stringify(compArray)
        (data) -> alert("Successfully uploaded appy!")


</script>
