function myUniq(arr) {
  let result = [];

  arr.forEach(function(el) {
    if(!result.includes(el)){
      result.push(el);
    }
  });
  return result;
}

// console.log(myUniq([1,2,3,3,4]));


function twoSum(arr) {
  let result = [];

  for(let i = 0;i < arr.length-1; i++){
    for(let j = i+1;j < arr.length; j++){
      if(arr[i] + arr[j] === 0){
        result.push([i,j]);
      }
    }
  }
  return result;
}

// console.log(twoSum([1,-1,2,3,-2]));

function transpose(arr) {
  let result = [];

  // arr.length.times {
  //
  // }

  for (let i = 0; i < arr.length; i++) {
    result.push([]);
  }

  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr[0].length; j++) {
      result[i][j] = arr[j][i];
    }
  }
  return result;
}

// console.log(transpose([[1,2],[3,]]));
