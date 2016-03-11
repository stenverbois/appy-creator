<template>
  <p class="range-field">
    <label for="Range">{{data.name}}</label>
    <input id="Range" type="range"
      :min.once="{{data.min || 0}}"
      :max.once="{{data.max || 100}}"
      :value.once="data.value"
      @input='updateValue'/>
  </p>
</template>

<script lang="coffee">
module.exports =
  props: ['data']

  methods:
    updateValue: ->
      @data.value = $('input[type=range]').val()
</script>
