window.ButtonOptions =
    template: """
      <button class="btn" style="width: 100%; height: 100%; overflow: hidden; pointer-events: none;"
        v-text="cmp.properties.name.value"
        v-show="cmp.properties.visibility.value">
        </button>
      """
    props: ['cmp']
