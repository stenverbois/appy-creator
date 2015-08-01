<style lang="less">
  html, body {
    height: 100%;
    width: 100%;
  }
</style>

<template>
  <header></header>
  <contents>ehhhh</contents>
  <footer></footer>
</template>

<script lang="coffee">
module.exports =
  data:
    msg: "Message."
  components:
    header: require './components/header.vue'
    contents: require './components/content.vue'
    footer: require './components/footer.vue'

</script>
