Handlebars = require('handlebars');
fs = require('fs');

// To test this file you can just run npm exporter.js
// Add new templates here
var buttonTemplate = Handlebars.compile(fs.readFileSync("./templates/button.html").toString());
var imageTemplate = Handlebars.compile(fs.readFileSync("./templates/image.html").toString());
var labelTemplate = Handlebars.compile(fs.readFileSync("./templates/label.html").toString());
var textboxTemplate = Handlebars.compile(fs.readFileSync("./templates/textbox.html").toString());


/* Example for button

var buttonResult = buttonTemplate({width: 100, height: 100, name: "test", on_click_method: ""});
console.log(buttonResult);
*/

var labelResult = labelTemplate({name: "Yay it twerks", visibility: true});
console.log(labelResult);
