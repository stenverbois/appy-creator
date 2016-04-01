<style lang="scss">
  html, body {
    height: 100%;
    width: 100%;
    user-select: none;
  }
</style>

<template>
  <div>
    <header-view></header-view>
    <content-view :page="page" :list="list"></content-view>
    <footer-view></footer-view>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    page: "design-app-view"
    list: null

  components:
    'header-view': require './views/header-view.vue'
    'content-view': require './views/content-view.vue'
    'footer-view': require './views/footer-view.vue'

  methods:
    nav: (page, list) ->
      @list = list
      @page = "#{page}-view"

  events:
    'nav-design-app': ->
      @nav('design-app')

    'nav-logic': ->
      @nav('logic')

    'nav-info': ->
      @nav('info')

    'nav-listitem': (arg) ->
      console.log arg in store.state.app.components
      @nav('design-list-item', arg)

</script>
