<style lang="less">
</style>

<template>
  <input type="{{data.type}}" v-model="data.value">
</template>

<script lang="coffee">
module.exports =
  props: ['data']
</script>
