<style lang="scss">
.title {
  font-size: 1.5rem;
  font-weight: bold;
}
</style>

<template>
  <a class="btn" @click="state.app.addFunction('Plus')">Plus</a>

  <div class="card" v-for="func in state.app.functions">
    <div class="title" v-text="func.name"></div>
    <div class="row">
      <form class="col s12">
        <!-- Inputs (parameters) -->
        <div class="row" v-for="parameter in func.parameterNames">
          <div class="input-field col s6">
            <input :id.once="parameter" type="text" v-model="func.parameters[parameter]">
            <label :for.once="parameter" v-text="parameter"></label>
          </div>
        </div>
        <!-- Outputs -->
        <div class="row" v-for="output in func.outputNames">
          <div class="input-field col s6">
            <input :id.once="output" type="text" v-model="func.parameters[output]">
            <label :for.once="output" v-text="output"></label>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  data: ->
    state: store.state
</script>
