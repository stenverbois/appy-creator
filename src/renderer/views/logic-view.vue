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
    <a class="btn" v-for="component in state.app.components" @click="add(component)">{{component.name}}</a>
  </div>
  <div class="row" v-for="func in functions">
    <a class="btn" @click="">{{func}}</a>
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
    id: 0
    instance: null
    sourceEndpoint: null
    targetEndpoint: null
    basictype: null
    functions: Object.keys require('./../logic/functions.coffee').classes
    triggers: ["click"]

  methods:
    isEditableProperty: (property) ->
      property.type? and property.type isnt 'hidden'

    add: (comp) ->
      if comp.type is 'List'
        for subcomp in comp.properties.newItemComponents
          # Text on block is List1.Button2
          # Id is Button2List1 so we can check for type at start
          $("#canvas").append("<div class=\"window jtk-node\" id=\"#{subcomp.name+comp.name}\"><strong class=\"block-title\">#{comp.name + '.' + subcomp.name}</strong></div>");
          @addDynEndPoints(subcomp.name+comp.name, comp);
      else
        $("#canvas").append("<div class=\"window jtk-node\" id=\"#{comp.name}\"><strong class=\"block-title\">#{comp.name}</strong></div>");
        @addDynEndPoints(comp.name ,comp);
      @instance.draggable($(".flowchart-demo .window"), { grid: [20, 20] });
      @id = @id + 1

    addDynEndPoints: (name, comp) ->
      sourceAnchors = ["RightMiddle"]
      targetAnchors = ["LeftMiddle"]

      # Dirty cases
      # switch comp.type
        # when 'Button'


      for source in sourceAnchors
        sourceUUID = name + source;
        returned = @instance.addEndpoint(name, @sourceEndpoint, { anchor: source, uuid: sourceUUID });
        console.log returned

      for target in targetAnchors
        targetUUID = name + target;
        @instance.addEndpoint(name, @targetEndpoint, { anchor: target, uuid: targetUUID });


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
            visible: false
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
          [ "Label", { location: [0.5, -0.5], label: "Drop", cssClass: "endpointTargetLabel", visible:false } ]
      ]

    init = (connection) ->
      if connection.sourceId.startsWith 'Button'
        # TODO: this doesn't work. Need a way to enable label on certain connections
        connection.getOverlay('label').setVisible(true)
        connection.getOverlay("label").setLabel("<select class=\"browser-default\">
                                                  <option value=\"onclick\">On Click</option>
                                                 </select>");

    # // suspend drawing and initialise.
    @instance.batch(=>

        #_addEndpoints("Window4", ["TopCenter", "BottomCenter"], ["LeftMiddle", "RightMiddle"]);
        #_addEndpoints("Window2", ["LeftMiddle", "BottomCenter"], ["TopCenter", "RightMiddle"]);
        #_addEndpoints("Window3", ["RightMiddle", "BottomCenter"], ["LeftMiddle", "TopCenter"]);
        #_addEndpoints("Window1", ["LeftMiddle", "RightMiddle"], ["TopCenter", "BottomCenter"]);

        # // listen for new connections; initialise them the same way we initialise the connections at startup.
        @instance.bind("connection", (connInfo, originalEvent) ->
            init(connInfo.connection);
        );

        # // make all the window divs draggable
        @instance.draggable(jsPlumb.getSelector(".flowchart-demo .window"), { grid: [20, 20] });
        # // THIS DEMO ONLY USES getSelector FOR CONVENIENCE. Use your library's appropriate selector
        # // method, or document.querySelectorAll:
        # //jsPlumb.draggable(document.querySelectorAll(".window"), { grid: [20, 20] });

        # // connect a few up
        #instance.connect({uuids: ["Window2BottomCenter", "Window3TopCenter"], editable: true});
        #instance.connect({uuids: ["Window2LeftMiddle", "Window4LeftMiddle"], editable: true});
        #instance.connect({uuids: ["Window4TopCenter", "Window4RightMiddle"], editable: true});
        #instance.connect({uuids: ["Window3RightMiddle", "Window2RightMiddle"], editable: true});
        #instance.connect({uuids: ["Window4BottomCenter", "Window1TopCenter"], editable: true});
        #instance.connect({uuids: ["Window3BottomCenter", "Window1BottomCenter"], editable: true});
        # //

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
