<template>
  <div>
    <component :is="page" :list="list"></component>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['page', 'list']
  components:
    'design-app-view': require './design-app-view.vue'
    'design-list-item-view': require './design-list-item-view.vue'
    'logic-view': require './logic-view.vue'
    'info-view': require './info-view.vue'
</script>
