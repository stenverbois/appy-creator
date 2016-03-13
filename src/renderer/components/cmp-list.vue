<template>
  <div>
    <ul v-show="cmp.properties.visibility.value">
      <li v-for="item in cmp.properties.items.items" track-by="index">
        {{ item.message }}
      </li>
    </ul>
</div>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
