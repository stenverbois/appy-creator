<template>

  <div class="input-field">
    <input type="text" class="validate" style="width: 100%; height: 100%; overflow: hidden; pointer-events: none;"
      v-model="cmp.properties.name.value"
      v-show="cmp.properties.visibility.value">
    </input>
  </div>

</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  attached: ->
    @$parent.addToGrid()
</script>
