Handlebars = require('handlebars');
fs = require('fs');

// Register Handlebars helper to stringify json
// Use: {{{json object}}}
// Source: http://stackoverflow.com/a/10233247
Handlebars.registerHelper('json', function(context) {
    return JSON.stringify(context);
});

// To test this file you can just run "node exporter.js file"
// Add new templates here
var buttonTemplate = Handlebars.compile(fs.readFileSync("./templates/button.html").toString());
var imageTemplate = Handlebars.compile(fs.readFileSync("./templates/image.html").toString());
var labelTemplate = Handlebars.compile(fs.readFileSync("./templates/label.html").toString());
var textboxTemplate = Handlebars.compile(fs.readFileSync("./templates/textbox.html").toString());

var appTemplate = Handlebars.compile(fs.readFileSync("./templates/app_page.html").toString());

function parseProperties(appDescription) {
  for(comp in appDescription.components) {
    for(prop in appDescription.components[comp].properties) {
      appDescription.components[comp].properties[prop] = appDescription.components[comp].properties[prop].value;
    }
  }
  return appDescription
}

// Read json file
if(process.argv[2]) {
  var appDescription = JSON.parse(fs.readFileSync(process.argv[2]).toString());
  appDescription = parseProperties(appDescription);

  for(comp in appDescription.components) {
    component = appDescription.components[comp];
    switch(component.type) {
      case "ButtonClass":
        component.html = buttonTemplate(component.properties);
        break;
      case "ImageClass":
        component.html = imageTemplate(component.properties);
        break;
      case "TextboxClass":
        component.html = textboxTemplate(component.properties);
        break;
      case "LabelClass":
        component.html = labelTemplate(component.properties);
        break;
    }
  }

  // Logic
  for(logic in appDescription.logic){
    // First get the triggers
    for(trigger in logic.triggers){

    }
    // Then get the functions
    for(func in logic.functions){

    }
    // Then fill in the actions
    for(action in logic.actions){

    }
  }


  //Write HTML output to file
  console.log(appTemplate(appDescription));
  fs.writeFileSync("./output.html", appTemplate(appDescription))
}
else {
  // Test stuff if we don't want to parse a file
  /* Example for button

  var buttonResult = buttonTemplate({width: 100, height: 100, name: "test", on_click_method: ""});
  console.log(buttonResult);
  */

  var labelResult = labelTemplate({name: "Yay it twerks", visibility: true});
  console.log(labelResult);
}
