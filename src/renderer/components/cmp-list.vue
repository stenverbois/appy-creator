<template>
  <ul class=""
      v-show="cmp.properties.visibility.value">
    <li v-for="item in cmp.items" track-by="index">
      {{ item.message }}
    </li>
  </ul>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
