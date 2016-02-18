Handlebars = require('handlebars');
fs = require('fs');

// To test this file you can just run "node exporter.js"
// Add new templates here
var buttonTemplate = Handlebars.compile(fs.readFileSync("./templates/button.html").toString());
var imageTemplate = Handlebars.compile(fs.readFileSync("./templates/image.html").toString());
var labelTemplate = Handlebars.compile(fs.readFileSync("./templates/label.html").toString());
var textboxTemplate = Handlebars.compile(fs.readFileSync("./templates/textbox.html").toString());

function parseProperties(appDescription){
  for(comp in appDescription["components"]){

    for(prop in appDescription.components[comp].properties){
      appDescription.components[comp].properties[prop] = appDescription.components[comp].properties[prop].value;
    }

  }
  return appDescription
}


// Read json file
if(process.argv[2]) {
    var appDescription = JSON.parse(fs.readFileSync(process.argv[2]).toString());
    appDescription = parseProperties(appDescription);

    var htmlOutput = "";
    for(comp in appDescription.components){
      switch( appDescription.components[comp].type){
        case "ButtonClass":
              htmlOutput += buttonTemplate(appDescription.components[comp].properties);
              break;
        case "ImageClass":
              htmlOutput += imageTemplate(appDescription.components[comp].properties);
              break;
        case "TextboxClass":
              htmlOutput += textboxTemplate(appDescription.components[comp].properties);
              break;
        case "LabelClass":
              htmlOutput += labelTemplate(appDescription.components[comp].properties);
              break;
      }
    }
  //Write htmloutput to file.
  console.log(htmlOutput);
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
