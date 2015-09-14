<style lang="less">
  @import "../style/main.less";
  html, body {
    height: 100%;
    width: 100%;
  }
</style>

<template>
  <header-view></header-view>
  <div>
    <contents-view></contents-view>
    <footer-view></footer-view>
  </div>
</template>

<script lang="coffee">
module.exports =
  # Data gets initiated in main.coffee
  data: ->
    userApp: undefined

  components:
    'header-view': require './views/header-view.vue'
    'contents-view': require './views/content'
    'footer-view': require './views/footer-view.vue'

</script>
