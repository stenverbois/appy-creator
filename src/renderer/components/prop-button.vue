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
        new_index = @data.items.length
        @data.items.push({index: new_index, message: "New Item", name: "item_" + new_index})

</script>
