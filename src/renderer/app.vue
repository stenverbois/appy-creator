<style lang="scss">
  html, body {
    height: 100%;
    width: 100%;
    user-select: none;
  }
</style>

<template>
  <div>
    <header-view @nav-design="nav('design')"
                 @nav-logic="nav('logic')"
                 @nav-info="nav('info')">
    </header-view>

    <contents-view :page="page" :list="list" @nav-listitem="nav('listItem', $arguments)"></contents-view>
    <footer-view></footer-view>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    page: "designView"
    list: null

  components:
    'header-view': require './views/header-view.vue'
    'contents-view': require './views/content.vue'
    'footer-view': require './views/footer-view.vue'

  methods:
    nav: (page, args) ->
      @page = "#{page}View"
      @list = args?[0]

</script>
