<template>
  <div style="width: 100%; height: 100%; overflow: hidden; pointer-events: none;">
    <ul v-show="cmp.properties.visibility.value">
      <li v-for="item in cmp.properties.genitems">
        <ul>
          <li v-for="component in item.data">
            <div>
              {{component | json}}
              <!-- <component :is="component.cmpName" :cmp="component"></component> -->
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
    'cmp-button': require './../button/cmp-button.vue'
    'cmp-label': require './../label/cmp-label.vue'
    'cmp-textbox': require './../textbox/cmp-textbox.vue'
    'cmp-image': require './../image/cmp-image.vue'
    'cmp-list': require './../list/cmp-list.vue'

  attached: ->
    @$parent.addToGrid?()
</script>
