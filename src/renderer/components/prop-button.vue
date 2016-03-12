<template>
  <button class="btn" style="width: 100%; height: 100%; overflow: hidden;"
          v-text="data.value"
          @mousedown="addItem">
  </button>
</template>

<script lang="coffee">
  module.exports =
    data: ->

    props: ['data']

    methods:
      addItem: ->
        @data.items.push({index: @data.items.length, message: "New Item"})

</script>
