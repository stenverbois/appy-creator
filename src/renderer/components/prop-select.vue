<template>
  <div>
    <label>Select Item</label>
    <select class="browser-default">
      <option v-for="item in data.items">{{item.name}}</option>
    </select>
  </div>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

</script>
