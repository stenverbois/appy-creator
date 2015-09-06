<template>
  <button v-text="cmp.properties.prop3.value"></button>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']
</script>
