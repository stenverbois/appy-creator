Handlebars = require('handlebars');
fs = require('fs');
_ = require('underscore');


// Register Handlebars helper to stringify json
// Use: {{{json object}}}
// Source: http://stackoverflow.com/a/10233247
Handlebars.registerHelper('json', function(context) {
    return JSON.stringify(context);
});

// To test this file you can just run "node exporter.js file"
// Add new templates here
var templates = {
  Button: Handlebars.compile(fs.readFileSync("./templates/HTML/button.html").toString()),
  Image: Handlebars.compile(fs.readFileSync("./templates/HTML/image.html").toString()),
  Label: Handlebars.compile(fs.readFileSync("./templates/HTML/label.html").toString()),
  Textbox: Handlebars.compile(fs.readFileSync("./templates/HTML/textbox.html").toString()),
  Plus: Handlebars.compile(fs.readFileSync("./templates/js/plus.js").toString()),
}

var appTemplate = Handlebars.compile(fs.readFileSync("./templates/HTML/app_page.html").toString());
var ComponentTriggers = {};

function parseProperties(appDescription) {
  for(comp in appDescription.components) {
    appDescription.components[comp].binding = {};
    for(prop in appDescription.components[comp].properties) {
      // Set default component bindings

      if(appDescription.components[comp].properties[prop].input) {
        appDescription.components[comp].binding[prop] = appDescription.components[comp].properties[prop].input;
      }
      else {
        appDescription.components[comp].binding[prop] = comp + '.' + prop;
      }

      appDescription.components[comp].properties[prop] = appDescription.components[comp].properties[prop].value;
    }
  }
  return appDescription
}

function getTrigger(func){
  func.triggers.forEach(function(t){

    var trigger = appDescription.logic.triggers[t];

    if(!(trigger.component in ComponentTriggers)){
      ComponentTriggers[trigger.component] = {};
    }

    ComponentTriggers[trigger.component][trigger.action] = func.name;
  });

}

function setCompTriggers(){
  for(comp in appDescription.components) {
    component = appDescription.components[comp];
    for(trigger in ComponentTriggers[comp]) {
      // Get all the triggers we have function(s) for
      component.binding[trigger] = ComponentTriggers[comp][trigger]
    }
  }
}

// Read json file
if(process.argv[2]) {
  var appDescription = JSON.parse(fs.readFileSync(process.argv[2]).toString());
  appDescription = parseProperties(appDescription);
  appDescription.logic.methods = {}
  // Logic
  for(f in appDescription.logic.functions) {

    func = appDescription.logic.functions[f];
    if(func.triggers.length == 0){
      func.name = f + '_computed';
    }else{
      func.name = f;

    }
    func.js = templates[func.type](_.extend(func.parameters, {'name': f}));
    if(func.triggers.length > 0){
      appDescription.logic.methods[func.name] = func.js;
      delete appDescription.logic.functions[f];

    }
    getTrigger(func);
    // Set all outputs of this logic component to null
    appDescription.components[f] = {};
    appDescription.components[f].properties = {result: null};

  }
  // Set the functions on the right triggers
  setCompTriggers();

  for(comp in appDescription.components) {
    component = appDescription.components[comp];
    //console.log(component.type);

    // TODO: if we change this to coffeescript:
    // component.html = templates[component.type]?(component.binding);
    component.html = typeof templates[component.type] === "function" ? templates[component.type](component.binding) : void 0;
  }

  //Write HTML output to file
  //console.log(appTemplate(appDescription));
  fs.writeFileSync("./output.html", appTemplate(appDescription))
}
else {
  // Test stuff if we don't want to parse a file
  /* Example for button

  var buttonResult = buttonTemplate({width: 100, height: 100, name: "test", on_click_method: ""});
  console.log(buttonResult);
  */

  //var labelResult = labelTemplate({name: "Yay it twerks", visibility: true});
  //console.log(labelResult);
  console.log("no input file");
}
