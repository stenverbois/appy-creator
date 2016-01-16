<style>
  /*@import "../style/main.less";*/
  html, body {
    height: 100%;
    width: 100%;
  }
</style>

<template>
  <div>
    <header-view></header-view>
    <contents-view></contents-view>
    <footer-view></footer-view>
  </div>
</template>

<script lang="coffee">
module.exports =
  components:
    'header-view': require './views/header-view.vue'
    'contents-view': require './views/content'
    'footer-view': require './views/footer-view.vue'

</script>
