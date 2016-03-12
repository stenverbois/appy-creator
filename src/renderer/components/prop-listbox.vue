<template>
  <div class="listbox">
    <select style="width: 100%; height: 100%; overflow: hidden;">
      <option v-for="item in data.items">{{item.name}}</option>
    </select>
  </div>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

</script>
