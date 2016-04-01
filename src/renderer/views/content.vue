<template>
  <div>
    <component :is="page"></component>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['page']
  components:
    'design-app-view': require './design-app-view.vue'
    'design-list-item-view': require './list-item-view.vue'
    'logic-view': require './logic-view.vue'
    'info-view': require './info-view.vue'
</script>
