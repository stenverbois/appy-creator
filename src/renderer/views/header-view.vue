<style lang="less">
@import "./../../style/variables.less";

.header {
  display: flex;
  flex-direction: row;
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: @top-bar-height;

  -webkit-user-select: none;
}
</style>

<template>
  <!--<div class="header blue-grey lighten-1">
    <div class="row">
      Header
    </div>
  </div>-->
  <header>
    <nav class="z-depth-1">
      <div class="nav-wrapper">
        <ul id="nav-mobile" class="left">
          <li><a>Something</a></li>
          <li><a>Other</a></li>
          <li><a>More</a></li>
          <li><a v-on:click="uploadFile()">Upload</a></li>
        </ul>

        <ul id="nav-mobile" class="right">
          <li><a>Not</a></li>
          <li><a>Done</a></li>
          <li><a>Yet</a></li>
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


</script>
