<template>
  <div>
    <edit-app-view :page="page"></edit-app-view>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['page']
  components:
    "edit-app-view": require './edit-app-view.vue'
</script>
