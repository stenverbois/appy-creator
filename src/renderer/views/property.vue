<style lang="less">
</style>

<template>
  <div class="row">
    <label>{{data.name}}<input type="{{data.type}}" v-model="data.value"></label>
    <p>{{data.help}}</p>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
</script>
