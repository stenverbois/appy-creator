<template>
  <div class="">
    <ul class=""
        v-show="cmp.properties.visibility.value">
      <li class="">Alvin</li>
      <li class="">Alvin</li>
    </ul>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
