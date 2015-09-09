<template>
  <button class="btn"
    v-text="cmp.properties.name.value"
    v-show="cmp.properties.visibility.value">
    </button>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']
</script>
