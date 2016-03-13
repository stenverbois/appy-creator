<template>
  <div>
    <label>Select Item</label>
    <select class="browser-default" @change="data.onchange">
      <option v-for="item in data.items" :value="item.index">{{item.name}}</option>
    </select>
  </div>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

</script>
