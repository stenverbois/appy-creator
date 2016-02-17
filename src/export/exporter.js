Handlebars = require('handlebars')

var template = Handlebars.compile("<div>{{teststring}}</div>")

var result = template({teststring: "heya"})

console.log(result)
