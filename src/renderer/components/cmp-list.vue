<template>
  <div>
    <ul v-show="cmp.properties.visibility.value">
      <li v-for="item in cmp.properties.items" track-by="index">
        <div v-show="item.visible.value">
          {{ item.message.value }}
        </div>
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
