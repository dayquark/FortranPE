var _ = require('lodash')
var fs = require('fs')
var data = require('./data.json')

console.log(data.name)

var msg = "Hello Node JS";
console.log(msg);
console.log(_.random(10, 20))

fs.readFile('./data.json', 'utf-8', function(err, data){
    var data = JSON.parse(name)
    console.log(data)
})