<template>
  <div class="col s12">
    <input id="{{data.name}}" type="checkbox" class="filled-in" v-model="data.value" />
    <label for="{{data.name}}">{{data.name}}</label>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
</script>
