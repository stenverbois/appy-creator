<template>
  <div>
    <label>Select Item</label>
    <select class="browser-default" v-model="data.selected" v-on:change="data.func(data.selected)">
      <option v-for="item in data.items" v-bind:value="item.index">{{item.name}}</option>
    </select>
  </div>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

</script>
