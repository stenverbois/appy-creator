<style lang="less">
</style>

<template>
  <div class="form-group">
    <label>{{data.name}}<input type="{{data.type}}" class="form-control" v-model="data.value"></label>
    <p class="help-block">{{data.help}}</p>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
</script>
