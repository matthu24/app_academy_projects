let obj = { 1: {'a': 1}, 2: {'b': 2}};
let keys = Object.keys(obj);
let result = keys.map(function(el) {
  return obj[el];
});
console.log(result);

//[{'a': 1}, {'b': 2}]
