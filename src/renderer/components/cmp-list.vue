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

  # TODO: The reason we can't require('./components.coffee').components here
  # is because of circular dependecy?
  components:
    'cmp-button': require './cmp-button.vue'
    'cmp-label': require './cmp-label.vue'
    'cmp-textbox': require './cmp-textbox.vue'
    'cmp-image': require './cmp-image.vue'
    'cmp-list': require './cmp-list.vue'

  attached: ->
    @$parent.addToGrid?()
</script>
