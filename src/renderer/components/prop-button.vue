<template>
  <button class="btn" style="width: 100%; height: 100%; overflow: hidden;"
          v-text="data.value"
          @mousedown="data.func">
  </button>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

</script>
