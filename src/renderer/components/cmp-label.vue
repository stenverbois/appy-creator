<template>
  <div class="label"
    v-text="cmp.properties.name.value"
    v-show="cmp.properties.visibility.value">
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']
  methods:
    foo: (test, e) ->
      e.preventDefault()
</script>
