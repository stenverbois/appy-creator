<style lang="scss">

</style>

<template>
  <div class="row app-preview">
    <div class="valign-wrapper">
      <div class="valign center">
        <div class="gridster">
          <ul class="blue-grey lighten-2 card">
            <li data-row="1" data-col="1" data-sizex="1" data-sizey="1"
                :class="{selected: state.selected == $index}"
                v-for="component in state.app.components"
                @mousedown="state.selected = $index">

              <div>
                <component :is="component.cmpName" :cmp="component"></component>
              </div>

            </li>
          </ul>
        </div>
      </div>
    </div>
</template>

<script lang="coffee">
  module.exports =
    data: ->

</script>
