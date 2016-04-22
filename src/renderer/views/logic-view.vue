<style>
.flowchart-demo .window {
    border: 1px solid #346789;
    box-shadow: 2px 2px 19px #aaa;
    -o-box-shadow: 2px 2px 19px #aaa;
    -webkit-box-shadow: 2px 2px 19px #aaa;
    -moz-box-shadow: 2px 2px 19px #aaa;
    -moz-border-radius: 0.5em;
    border-radius: 0.5em;
    opacity: 0.8;
    width: 130px;
    height: 90px;
    cursor: pointer;
    text-align: center;
    z-index: 20;
    position: absolute;
    background-color: #eeeeef;
    color: black;
    font-family: helvetica, sans-serif;
    padding: 0.5em;
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
    outline: 4px solid pink !important;
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
</style>

<template>
  <div class="row">
    <a class="btn" v-for="component in state.app.components" @click="addComponent(component)">{{component.name}}</a>
  </div>
  <div class="row" v-for="(name, func) in functions">
    <a class="btn" @click="addFunction(name)" v-text="name"></a>
  </div>
  <div class="row">
    <div class="col s12">
      <div class="jtk-demo-canvas canvas-wide flowchart-demo jtk-surface jtk-surface-nopan" id="canvas">

          <!--<div class="window jtk-node" id="flowchartWindow1"><strong>1</strong><br/><br/></div>
          <div class="window jtk-node" id="flowchartWindow2"><strong>2</strong><br/><br/></div>
          <div class="window jtk-node" id="flowchartWindow3"><strong>3</strong><br/><br/></div>
          <div class="window jtk-node" id="flowchartWindow4"><strong>4</strong><br/><br/></div>-->
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
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

  methods:
    isEditableProperty: (property) ->
      property.type? and property.type isnt 'hidden'

    addComponent: (comp) ->
      if comp.type is 'List'
        for subcomp in comp.properties.newItemComponents
          # Text on block is List1.Button2
          # Id is ButtonButton2List1 so we can check for type at start
          $("#canvas").append("<div class=\"window jtk-node\" data-name=\"#{comp.name}.#{subcomp.name}\" id=\"#{subcomp.type+subcomp.name+comp.name}\"><strong class=\"block-title\">#{comp.name + '.' + subcomp.name}</strong></div>");
          target_style = @targetEndpoint
          target_style.overlays[0][1].label = comp.getDefaultInput()
          t = { style: target_style, anchor: 'Left' }
          @addTargetEndPoint(subcomp.type+subcomp.name+comp.name, t)
          source_style = @sourceEndpoint
          source_style.overlays[0][1].label = comp.getDefaultOutput()
          s = { style: source_style, anchor: 'Right' }
          @addSourceEndPoint(subcomp.type+subcomp.name+comp.name, s)
      else
        $("#canvas").append("<div class=\"window jtk-node\" data-name=\"#{comp.name}\" id=\"#{comp.type+comp.name}\"><strong class=\"block-title\">#{comp.name}</strong></div>");
        target_style = @targetEndpoint
        target_style.overlays[0][1].label = comp.getDefaultInput()
        t = { style: target_style, anchor: 'Left' }
        @addTargetEndPoint(comp.type+comp.name, t)
        source_style = @sourceEndpoint
        source_style.overlays[0][1].label = comp.getDefaultOutput()
        s = { style: source_style, anchor: 'Right' }
        @addSourceEndPoint(comp.type+comp.name, s)
      @instance.draggable($(".flowchart-demo .window"), { grid: [20, 20] });

    addFunction: (name) ->
      # console.log @state.app
      func = @state.app.addFunction(name)
      $("#canvas").append("<div class=\"window jtk-node\" data-name=\"#{func.name}\" id=\"#{func.name}\"><strong class=\"block-title\">#{func.name}</strong></div>");

      for param in func.parameterNames
        target_style = @targetEndpoint
        target_style.overlays[0][1].label = param.name
        t = { style: target_style, anchor: param.position }
        @addTargetEndPoint(func.name, t)

      for output in func.outputNames
        source_style = @sourceEndpoint
        source_style.overlays[0][1].label = output.name
        s = { style: source_style, anchor: output.position }
        @addSourceEndPoint(func.name, s)

      trigger_style = @targetEndpoint
      trigger_style.overlays[0][1].label = 'Action'
      t = { style: trigger_style, anchor: 'Top' }
      @addTargetEndPoint(func.name, t)

      @instance.draggable($(".flowchart-demo .window"), { grid: [20, 20] });

    addSourceEndPoint: (name, source) ->
      sourceUUID = name + source.anchor;
      @instance.addEndpoint(name, source.style, { anchor: source.anchor, uuid: sourceUUID });

    addTargetEndPoint: (name, target) ->
      targetUUID = name + target.anchor;
      @instance.addEndpoint(name, target.style, { anchor: target.anchor, uuid: targetUUID });

  ready: ->
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
      strokeStyle: "#61B7CF",
      joinstyle: "round",
      outlineColor: "white",
      outlineWidth: 2
      # // .. and this is the hover style.

    connectorHoverStyle =
      lineWidth: 4,
      # strokeStyle: "#216477",
      outlineWidth: 2,
      outlineColor: "white"

    endpointHoverStyle =
      # fillStyle: "#216477",
      # strokeStyle: "#216477"
      # // the definition of source endpoints (the small blue ones)

    @sourceEndpoint =
      endpoint: "Dot",
      paintStyle:
        strokeStyle: "#7AB02C",
        fillStyle: "transparent",
        radius: 7,
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
      paintStyle: { fillStyle: "#7AB02C", radius: 11 },
      hoverPaintStyle: endpointHoverStyle,
      maxConnections: -1,
      dropOptions: { hoverClass: "hover", activeClass: "active" },
      isTarget: true,
      overlays: [
          [ "Label", { location: [0.5, -0.5], label: "Drop", cssClass: "endpointTargetLabel", visible: true } ]
      ]

    init = (connection) =>
      if connection.sourceId.startsWith 'Button'
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
            s = $("##{connection.sourceId}")
            t = $("##{connection.targetId}")

            # If the function is the source
            key = Object.keys(connInfo.sourceEndpoint.getOverlays())[0]
            sourceOverlayLabel = connInfo.sourceEndpoint.getOverlay(key).label

            key = Object.keys(connInfo.targetEndpoint.getOverlays())[0]
            targetOverlayLabel = connInfo.targetEndpoint.getOverlay(key).label

            # If the function is the target
            result = (func for func in @state.app.functions when func.name == t.data("name"))
            if result.length > 0
              func = result[0]
              if targetOverlayLabel == "Action"
                connectionOverlayLabel = connInfo.connection.getOverlay("label").label
                select = $($.parseHTML(connectionOverlayLabel)).attr("id")
                option = $("##{select}").val()

                func.connectTrigger(@state.app.addTrigger(s.data("name"), option))

              else
                func.connectParameter(targetOverlayLabel, s.data("name"), sourceOverlayLabel)

            else
              # If function is the source
              result = (func for func in @state.app.functions when func.name == s.data("name"))
              if result.length > 0
                func = result[0]
                func.connectOutput(targetOverlayLabel, t.data("name"))
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
            conn.toggleType("basic");
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
