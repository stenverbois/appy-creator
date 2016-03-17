<style lang="scss">
  .title {
    font-size: 1.5rem;
    font-weight: bold;
  }
</style>

<template>
  <div class="row">
    <div class="card col s3" v-for="component in state.app.components">
      <div class="row">
        <div class="title" v-text="component.name"></div>
        <div v-for="property in component.properties"  v-if="isEditableProperty(property)">
          <div class="input-field col s6">
            <input :id.once="property.name" type="text" v-model="property.input">
            <label :for.once="property.name" v-text="property.name"></label>
          </div>
        </div>
      </div>
    </div>
  </div>
  <a class="btn" @click="state.app.addFunction('Plus')">Plus</a>
  <div class="row">
    <div class="card col s3" v-for="func in state.app.functions">
      <div class="title" v-text="func.name"></div>
      <div class="row">
        <form class="col s12">
          <!-- Inputs (parameters) -->
          <div v-for="parameter in func.parameterNames">
            <div class="input-field col s6">
              <input :id.once="parameter" type="text" v-model="func.parameters[parameter]">
              <label :for.once="parameter" v-text="parameter"></label>
            </div>
          </div>
          <!-- Triggers -->
          <div class="row" v-for="trigger in func.triggers">
            <div class="input-field col s6">
              <input :id.once="trigger" type="text" v-model="trigger">
              <label :for.once="trigger">Trigger</label>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <a class="btn" @click="state.app.addTriggers">Trigger</a>
  <div class="row">
    <div class="card col s3" v-for="trigger in state.app.triggers">
      <div class="row">
        <div class="title" v-text="trigger.name"></div>
        <div class="input-field col s6">
          <input :id.once="trigger.component" type="text" v-model="trigger.component">
          <label :for.once="trigger.component">Component</label>
        </div>
        <div class="input-field col s6">
          <input :id.once="trigger.action" type="text" v-model="trigger.action">
          <label :for.once="trigger.action">Action</label>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state

  methods:
    isEditableProperty: (property) ->
      property.type? and property.type isnt 'hidden'
</script>
