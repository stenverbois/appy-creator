<style lang="scss">
@import "./../../style/custom/variables.scss";

.components {
  position: absolute;
  left: 0;
  width: $component-bar-width;
  overflow-x: hidden;
  overflow-y: auto;
  height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});

  .collapsible {
    box-shadow: none;
    border-right: none;
    border-left: none;
  }

  .collection-item {
    a.btn-flat {
      width: 100%;
    }
  }
}
</style>

<template>
  <div class="components z-depth-1">
    <div class="view header indigo-text text-lighten-1">
      Components
    </div>
    <ul class="collapsible" data-collapsible="accordion">
      <li v-for="category in data">
        <div class="collapsible-header"><i class="material-icons" v-text="category.icon"></i>{{category.title}}</div>
        <div class="collapsible-body">
          <ul class="collection">
            <li class="collection-item" v-for="object in category.objects">
              <a class="btn-flat" @click="add(category.title, object)">{{object | isname}}</a>
            </li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
</template>

<script lang="coffee">
module.exports =
  props: ['data']

  ready: ->
    $('.collapsible', @$el).collapsible?()

  watch:
    'data': ->
      $('.collapsible', @$el).collapsible?()

  filters:
    'isname': (val) ->
      return (if typeof val is 'string' then val else val.name)

  methods:
    add: (category, component) ->
      @$dispatch('add-component', category, component)

</script>
