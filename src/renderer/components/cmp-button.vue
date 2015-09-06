<template>
  <button v-text="cmp.properties.name.value"></button>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']
</script>
