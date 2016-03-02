<style lang="scss" scoped>
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
          <li><a>Something</a></li>
          <li><a>Other</a></li>
          <li><a>More</a></li>
          <li><a v-on:click="uploadFile()">Upload</a></li>
        </ul>

        <ul id="nav-mobile" class="right">
          <li><a>Export</a></li>
        </ul>
      </div>
    </nav>
  </header>

</template>

<script lang="coffee">
  module.exports =
    data: ->
      state: store.state
      testJSON: {}

    methods:

      uploadFile: ->
        compArray = {"components": {}, "logic": {}}
        for obj in @state.app.components
          compArray["components"][obj.name] =
            properties: obj.properties
            type: obj.type

        $.post 'http://localhost:8000/upload/',
          user: 'John Doe'
          title: 'Test'
          file: JSON.stringify(compArray)
          (data) -> alert("Successfully uploaded appy!")


</script>
