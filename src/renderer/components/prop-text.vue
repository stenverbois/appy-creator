<template>
  <div class="input-field col s12">
    <input :id.once="data.name" :type.once="data.type" v-model="data.value" />
    <label :for="data.name" class="active">{{data.name}}</label>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']
</script>
