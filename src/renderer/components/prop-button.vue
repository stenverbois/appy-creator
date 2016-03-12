<template>
  <button class="btn" style="width: 100%; height: 100%; overflow: hidden;"
          v-text="data.value"
          @mousedown="addItem">
  </button>
</template>

<script lang="coffee">
  module.exports =
    props: ['data']

    methods:
      addItem: ->
        @data.items.push("New Item")


</script>
