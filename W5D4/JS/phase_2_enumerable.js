

Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

// [1,2,3].myEach(el => { console.log(el); });


Array.prototype.myMap = function(callback) {
  let result = [];
  // const that = this;
  // this.myEach(function(el) {
  //   // console.log(this); // window in Chrome (global scope)
  //   result.push(callback(el));
  // })

  this.myEach(el => {
    // console.log(this); // the 'this' that the arrow function was defined in
    result.push(callback(el));
  });
  return result;
};

// console.log([1,2,3].myMap(el => (el * 2) ));

Array.prototype.myReduce = function(callback, initialValue) {
  let arr = this;

  if (!initialValue) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let acc = initialValue;

  arr.forEach(el => {acc = callback(acc,el);} );

  return acc;
};

// console.log([1,2,3].myReduce(function(acc, el) {
//   return acc + el;
// }));
