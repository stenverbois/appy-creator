<template>
  <div>
    <ul v-show="cmp.properties.visibility.value">
      <li v-for="item in cmp.properties.items">
        <ul>
          <li v-for="component in item.components">
            <div>
              <component :is="component.cmpName" :cmp="component"></component>
            </div>
          </li>
        </ul>
      </li>
    </ul>
</div>
</template>

<script lang="coffee">
module.exports =
  props: ['cmp']

  components:
    'cmp-button': require('./cmp-button.vue')

  attached: ->
    @$parent.addToGrid?()
</script>
