<style lang="scss">
@import "./../../style/custom/variables.scss";
// .view {
//   position: absolute;
//   height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});
// }

.content {
  // position: absolute;
  // left: $component-bar-width;
  // width: calc(100% - #{$properties-bar-width} - #{$component-bar-width});
  // height: calc(100% - #{$top-bar-height} - #{$footer-bar-height});
}

.flowchart-demo .window {
    border: 2px solid $primary-color;
    box-shadow: 2px 2px 19px #aaa;
    -o-box-shadow: 2px 2px 19px #aaa;
    -webkit-box-shadow: 2px 2px 19px #aaa;
    -moz-box-shadow: 2px 2px 19px #aaa;
    -moz-border-radius: 0.5em;
    border-radius: 0.5em;
    opacity: 0.8;
    width: 180px;
    height: 135px;
    cursor: pointer;
    text-align: center;
    z-index: 20;
    position: absolute;
    background-color: #eeeeee;
    color: #212121;
    font-family: helvetica, sans-serif;
    // padding: 0.5em;
    font-size: 0.9em;
    -webkit-transition: -webkit-box-shadow 0.15s ease-in;
    -moz-transition: -moz-box-shadow 0.15s ease-in;
    -o-transition: -o-box-shadow 0.15s ease-in;
    transition: box-shadow 0.15s ease-in;
}

.flowchart-demo .window:hover {
    box-shadow: 2px 2px 19px #444;
    -o-box-shadow: 2px 2px 19px #444;
    -webkit-box-shadow: 2px 2px 19px #444;
    -moz-box-shadow: 2px 2px 19px #444;
    opacity: 0.6;
}

.flowchart-demo .active {
    border: 1px dotted green;
}

.flowchart-demo .hover {
    border: 1px dotted red;
}

.flowchart-demo .jsplumb-connector {
    z-index: 4;
}

.flowchart-demo .jsplumb-endpoint, .endpointTargetLabel, .endpointSourceLabel {
    z-index: 21;
    cursor: pointer;
}

.flowchart-demo .aLabel {
    background-color: white;
    padding: 0.4em;
    color: #444;
    z-index: 21;
    border: 0px;
    opacity: 0.8;
    cursor: pointer;
}

.flowchart-demo .aLabel.jsplumb-hover {
    /*background-color: #5C96BC;*/
    /*color: white;*/
    border: 1px solid white;
}

.window.jsplumb-connected {
    border: 2px solid green;
}

.jsplumb-drag {
    // outline: 4px solid $accent-color !important;
    box-shadow: 2px 2px 19px $primary-color !important;
}

path, .jsplumb-endpoint {
    cursor: pointer;
}

.jsplumb-overlay {
    background-color:transparent;
}

.block-title {
  top: 0;
}

.action-container {
  padding-top: 10px;
  margin-bottom: 5px;
}

.inout-container {
  width: 100%;
}

.in-container {
  width: 50%;
  float: left;
  text-align: left;
}

.out-container {
  width: 50%;
  float: right;
  text-align: right;
  margin-top: 15px;
}

.block-parameter {
  margin-top: 10px;
  padding-left: 20%;
  padding-right: 20%;
}

.block-name {
  width: 100%;
  background-color: $primary-color;
  color: $primary-color-text;
  font-weight: bold;
  font-size: 1.2rem;
  // border-top: 1px solid #B6B6B6;
  // border-bottom: 1px solid #B6B6B6;
}
</style>

<template>
<div>
  <components :data="components" @add-component="addComponentClick($arguments)"></components>
  <div class="content">
    <!-- <div class="row">
      <a class="btn" v-for="component in state.app.components" @click="addComponent(component)">{{component.name}}</a>
    </div>
    <div class="row" id="logic_functions">
      <a class="btn" v-for="(name, func) in functions" @click="addFunction(name)" v-text="name"></a>
    </div>
    <div class="row" id="list_logic_functions">
      <a class="btn" v-for="(name, func) in listFunctions" @click="addListFunc(func)" v-text="name"></a>
    </div> -->
    <div class="row">
      <div class="col s12">
        <div class="jtk-demo-canvas canvas-wide flowchart-demo jtk-surface jtk-surface-nopan" id="canvas">
            <div v-for="node in state.app.components" data-name="{{node.name}}" v-show="node.visibleInLogic">
              <div v-if="node.type == 'List'">
                <div v-for="genitem in node.properties.newItemComponents" data-type="{{genitem.type}}" data-name="{{node.name}}" v-show="node.visibleInLogic">
                  <div class="window jtk-node" id="{{node.name}}{{genitem.name}}">
                    <div class="block-name">{{node.name}}.{{genitem.name}}</div>
                    <div v-for="(key, property) of genitem.properties" data-type="{{genitem.type}}" data-name="{{node.name}}.{{genitem.name}}" v-show="property.primary" id="{{node.name}}{{genitem.name}}{{property.name}}" class="block-parameter">
                      {{key}}
                    </div>
                  </div>
                </div>
              </div>
              <div v-else>
                <div class="window jtk-node logic-container" id="{{node.name}}">
                  <div class="block-name">{{node.name}}</div>
                  <div class="inout-container">
                    <div v-for="(key, property) of node.properties" data-type="{{node.type}}" data-name="{{node.name}}" v-show="property.primary" id="{{node.name}}{{property.name}}" class="block-parameter">
                      {{key}}
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div v-for="node in state.app.functions" data-name="{{node.name}}" class="window jtk-node" id="{{node.name}}" v-show="node.visibleInLogic">
              <div id="{{node.name}}action" data-name="{{node.name}}" class="action-container">
                Action
              </div>
              <div class="block-name">{{node.type}}</div>
              <div class="in-container">
                <div v-for="param in node.parameterNames" data-name="{{node.name}}"  id="{{node.name}}{{param.name}}" class="block-parameter">
                  {{param.name}}
                </div>
              </div>
              <div class="out-container">
                <div v-for="param in node.outputNames" data-name="{{node.name}}"  id="{{node.name}}{{param.name}}" class="block-parameter">
                  {{param.name}}
                </div>
              </div>
              <br/>
              <br/>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script lang="coffee">
Vue = require 'vue'
module.exports =
  data: ->
    state: store.state
    instance: null
    sourceEndpoint: null
    targetEndpoint: null
    basictype: null
    functions: require('./../logic/functions.coffee').classes
    triggers: ["click"]
    selectId: 0
    components: []

  components:
    'components': require './components.vue'

  methods:
    isEditableProperty: (property) ->
      property.type? and property.type isnt 'hidden'

    createListFunction: (listName, newItemComps) ->
      add_func = new @functions["AddListItem"]("#{listName}", newItemComps)
      remove_func = new @functions["RemoveListItem"]("#{listName}")
      @components.push({title: listName, icon: 'list', objects: [add_func, remove_func]})

    addComponentClick: (args) ->
      switch args?[0]
        when 'Functions'
          @addFunction(args?[1])
        when 'Components'
          @addComponent(args?[1])
        else
          console.log args?[0]
          if args?[0].startsWith 'List'
            @addListFunc(args?[1])

    addComponent: (comp) ->
      comp.visibleInLogic = true
      Vue.nextTick(=>
        Vue.nextTick(=>
          if comp.type == "List"
            console.log(comp.properties.newItemComponents)
            @createListFunction(comp.name, comp.properties.newItemComponents)
            for newItemComp in comp.properties.newItemComponents
              for propertyName, property of newItemComp.properties
                if property.primary
                  target_style = @targetEndpoint
                  target_style.overlays[0][1].label = ""
                  t = { style: target_style, anchor: "Left" }
                  @addTargetEndPoint("#{comp.name}#{newItemComp.name}#{property.name}", t)
                  source_style = @sourceEndpoint
                  source_style.overlays[0][1].label = ""
                  s = { style: source_style, anchor: "Right" }
                  @addSourceEndPoint("#{comp.name}#{newItemComp.name}#{property.name}", s)

          else
            for propertyName, property of comp.properties
              if property.primary
                target_style = @targetEndpoint
                target_style.overlays[0][1].label = ""
                t = { style: target_style, anchor: "Left" }
                @addTargetEndPoint("#{comp.name}#{property.name}", t)
                source_style = @sourceEndpoint
                source_style.overlays[0][1].label = ""
                s = { style: source_style, anchor: "Right" }
                @addSourceEndPoint("#{comp.name}#{property.name}", s)
        )
      )

    renderFuncNode: (func) ->
      Vue.nextTick(=>
        Vue.nextTick(=>
          for property in func.parameterNames
            target_style = @targetEndpoint
            target_style.overlays[0][1].label = ""
            t = { style: target_style, anchor: "Left" }
            @addTargetEndPoint("#{func.name}#{property.name}", t)

          for property in func.outputNames
            source_style = @sourceEndpoint
            source_style.overlays[0][1].label = ""
            s = { style: source_style, anchor: "Right" }
            @addSourceEndPoint("#{func.name}#{property.name}", s)

          #Trigger
          trigger_style = @targetEndpoint
          trigger_style.overlays[0][1].label = ''
          t = { style: trigger_style, anchor: 'Top' }
          @addTargetEndPoint("#{func.name}action", t)

          @instance.draggable($(".flowchart-demo .window"), { grid: [20, 20] });
        )
      )

    addListFunc: (func) ->
      @state.app.addListFunction(func)
      func.visibleInLogic = true
      @renderFuncNode(func)

    addFunction: (name) ->
      console.log "Adding function " + name
      func = @state.app.addFunction(name)
      func.visibleInLogic = true
      @renderFuncNode(func)

    addSourceEndPoint: (name, source) ->
      sourceUUID = name + source.anchor;
      @instance.addEndpoint(name, source.style, { anchor: source.anchor, uuid: sourceUUID });

    addTargetEndPoint: (name, target) ->
      targetUUID = name + target.anchor;
      @instance.addEndpoint(name, target.style, { anchor: target.anchor, uuid: targetUUID });

  ready: ->
    @components = [
      {
        title: 'Components'
        icon: 'timeline'
        objects: @state.app.components
      }
      {
        title: 'Functions'
        icon: 'timeline'
        objects: (f for f in Object.keys require('./../logic/functions.coffee').classes when (@functions[f]).isForList == false)
      }
    ]

    @instance = window.jsp = jsPlumb.getInstance({
        # // default drag options
        DragOptions: { cursor: 'pointer', zIndex: 2000 },
        # // the overlays to decorate each connection with.  note that the label overlay uses a function to generate the label text; in this
        # // case it returns the 'labelText' member that we set on each connection in the 'init' method below.
        ConnectionOverlays: [
            [ "Arrow", {
                location: 1
                id: "ARROW"
                events:{
                    # click: -> alert("you clicked on the arrow overlay")
                }
                visible: false
            } ],
            [ "Label", {
                location: 0.3,
                id: "label",
                cssClass: "aLabel",
                events:{
                    # tap: -> alert("hey")
                }
                visible: false
            }]
        ],
        Container: "canvas"
    });

    @basicType = {
        connector: "StateMachine",
        paintStyle: { strokeStyle: "red", lineWidth: 4 },
        hoverPaintStyle: { strokeStyle: "blue" },
        overlays: [
            "Arrow"
        ]
    };
    @instance.registerConnectionType("basic", @basicType);

      # // this is the paint style for the connecting lines..
    connectorPaintStyle =
      lineWidth: 4,
      strokeStyle: "#8BC34A",
      outlineColor: "white",
      outlineWidth: 2

    connectorHoverStyle =
      lineWidth: 4,
      # strokeStyle: "#3F51B5",
      outlineWidth: 2,
      outlineColor: "white"

    endpointHoverStyle =
      # fillStyle: "#3F51B5",
      # strokeStyle: "#3F51B5"
      # // the definition of source endpoints (the small blue ones)

    @sourceEndpoint =
      endpoint: "Dot",
      paintStyle:
        strokeStyle: "#8BC34A",
        # fillStyle: "transparent",
        fillStyle: "#FFFFFF",
        radius: 10,
        lineWidth: 3
      isSource: true,
      maxConnections: -1,
      connector: [ "Flowchart", { stub: [40, 60], gap: 10, cornerRadius: 5, alwaysRespectStubs: true } ],
      connectorStyle: connectorPaintStyle,
      hoverPaintStyle: endpointHoverStyle,
      connectorHoverStyle: connectorHoverStyle,
      dragOptions: {},
      overlays: [
        [
          "Label", {
            location: [-1, 0.5],
            label: "Action",
            cssClass: "endpointSourceLabel",
            visible: true
          }
        ]
      ]

    # // the definition of target endpoints (will appear when the user drags a connection)
    @targetEndpoint =
      endpoint: "Dot",
      paintStyle: { fillStyle: "#8BC34A", radius: 11 },
      hoverPaintStyle: endpointHoverStyle,
      maxConnections: -1,
      dropOptions: { hoverClass: "hover", activeClass: "active" },
      isTarget: true,
      overlays: [
          [ "Label", { location: [0.5, -0.5], label: "Drop", cssClass: "endpointTargetLabel", visible: true } ]
      ]

    init = (connection) =>
      s = $("body").find("##{connection.sourceId}")
      if s.data("type") == "Button"
        connection.getOverlay('label').setVisible(true)
        connection.getOverlay("label").setLabel("<select id=\"select#{@selectId}\" class=\"browser-default\">
                                                  <option value=\"click\">On Click</option>
                                                 </select>");
        @selectId += 1

    # // suspend drawing and initialise.
    @instance.batch(=>

        # // listen for new connections; initialise them the same way we initialise the connections at startup.
        @instance.bind("connection", (connInfo, originalEvent) =>
            init(connInfo.connection);

            connection = connInfo.connection
            console.log("##{connection.sourceId}")
            console.log("##{connection.targetId}")

            s = $("body").find("##{connection.sourceId}")
            t = $("body").find("##{connection.targetId}")

            sourceOverlayLabel = s.text().trim(" ")
            targetOverlayLabel = t.text().trim(" ")

            # If the function is the target
            console.log(targetOverlayLabel)
            console.log(sourceOverlayLabel)
            result = (func for func in @state.app.functions when func.name == t.data("name"))
            if result.length > 0
              func = result[0]
              if targetOverlayLabel == "Action"
                connectionOverlayLabel = connInfo.connection.getOverlay("label").label
                select = $($.parseHTML(connectionOverlayLabel)).attr("id")
                option = $("##{select}").val()

                func.connectTrigger(@state.app.addTrigger(s.data("name"), option))

              else
                console.log(targetOverlayLabel)
                console.log(s.data("name"))
                console.log(sourceOverlayLabel)
                func.connectParameter(targetOverlayLabel, s.data("name"), sourceOverlayLabel)

            else
              # If function is the source
              result = (func for func in @state.app.functions when func.name == s.data("name"))
              if result.length > 0
                func = result[0]
                func.connectOutput(targetOverlayLabel, t.data("name"))
        );

        @instance.bind("beforeDetach", (connection) =>
            console.log("WHY YOU DETACHING BRAH");
            console.log("##{connection.sourceId}")
            console.log("##{connection.targetId}")

            s = $("body").find("##{connection.sourceId}")
            t = $("body").find("##{connection.suspendedElementId}")

            sourceOverlayLabel = s.text().trim(" ")
            targetOverlayLabel = t.text().trim(" ")

            # If the function is the target
            #console.log(connection)
            #console.log(targetOverlayLabel)
            #console.log(sourceOverlayLabel)
            result = (func for func in @state.app.functions when func.name == t.data("name"))
            if result.length > 0
              func = result[0]
              if targetOverlayLabel == "Action"
                connectionOverlayLabel = connInfo.connection.getOverlay("label").label
                select = $($.parseHTML(connectionOverlayLabel)).attr("id")
                option = $("##{select}").val()
                #func.connectTrigger(@state.app.addTrigger(s.data("name"), option))
                func.disconnectTrigger(@state.app.getTrigger(s.data("name")))

              else
                #console.log("PARAM")
                #console.log(targetOverlayLabel)
                #console.log(s.data("name"))
                #console.log(sourceOverlayLabel)
                #func.connectParameter(targetOverlayLabel, s.data("name"), sourceOverlayLabel)
                func.disconnectParameter(targetOverlayLabel)

            else
              # If function is the source
              result = (func for func in @state.app.functions when func.name == s.data("name"))
              if result.length > 0
                func = result[0]
                #func.connectOutput(targetOverlayLabel, t.data("name"))
                func.disconnectOutput(targetOverlayLabel, t.data("name"))
        );


        # // make all the window divs draggable
        @instance.draggable(jsPlumb.getSelector(".flowchart-demo .window"), { grid: [20, 20] });
        # // THIS DEMO ONLY USES getSelector FOR CONVENIENCE. Use your library's appropriate selector
        # // method, or document.querySelectorAll:
        # //jsPlumb.draggable(document.querySelectorAll(".window"), { grid: [20, 20] });

        # //
        # // listen for clicks on connections, and offer to delete connections on click.
        # //
        @instance.bind("click", (conn, originalEvent) ->
          #  // if (confirm("Delete connection from " + conn.sourceId + " to " + conn.targetId + "?"))
            #  //   instance.detach(conn);
            # conn.toggleType("basic");
        );

        @instance.bind("connectionDrag", (connection) ->
            console.log("connection " + connection.id + " is being dragged. suspendedElement is ", connection.suspendedElement, " of type ", connection.suspendedElementType);
        );

        @instance.bind("connectionDragStop", (connection) ->
            console.log("connection " + connection.id + " was dragged");
        );

        @instance.bind("connectionMoved", (params) ->
            console.log("connection " + params.connection.id + " was moved");
        );
    );

    jsPlumb.fire("jsPlumbDemoLoaded", @instance);

</script>
