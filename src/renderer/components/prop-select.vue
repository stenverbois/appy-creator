<template>
  <div>
    <label>Select Item</label>
    <select class="browser-default" v-model="data.selected" @change="data.onchange">
      <option v-for="option in data.options" :value="option.index">{{option.name}}</option>
    </select>
  </div>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

</script>
