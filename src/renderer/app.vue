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

    <contents-view :page="page" @nav-itemlist="nav('itemList')"></contents-view>
    <footer-view></footer-view>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    page: "designView"

  components:
    'header-view': require './views/header-view.vue'
    'contents-view': require './views/content'
    'footer-view': require './views/footer-view.vue'

  methods:
    nav: (page) ->
      console.log(page)
      @page = "#{page}View"

</script>
