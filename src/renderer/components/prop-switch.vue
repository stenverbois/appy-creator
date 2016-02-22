<template>
  <div class="switch">
    <label>
      Hidden
      <input :id.once="data.name" type="checkbox" v-model="data.value" />
      <span class="lever"></span>
      Visible
    </label>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
</script>
