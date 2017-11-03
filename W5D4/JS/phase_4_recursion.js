function range(start, end) {
  if (start === end) {
    return [start];
  }
  let result = [];
  result = range(start, end - 1).concat([end]);
  return result;
}

// console.log(range(2,8));

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }

  let sum = 0;
  let ending = arr.length - 1;
  sum = sumRec(arr.slice(0, ending)) + arr[ending];
  return sum;
}

// console.log(sumRec([1,2,3,4]));

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }

  let result = base * exponent1(base, exp - 1);
  return result;
}

// console.log(exponent1(2,3));

function exponent2(base,exp) {
  if(exp ===0){
    return 1;
  }

  if(exp ===1) {
    return base;
  }
  let result = 1;
  if(exp % 2 === 0){
     result = Math.pow(exponent2(base,exp/2),2);
  }else{
     result = base * exponent2(base,exp-1);
  }
  return result;
}
// console.log(exponent2(2,3));

//fibonacci: 1,1,2,3,5

function fibonacci(n) {
  if(n === 1){
    return [1];
  }

  if(n===2){
    return[1,1];
  }
  let result = [];
  let temp = fibonacci(n-1);
  result = temp.concat(temp[temp.length-2] + temp[temp.length-1]);
  return result;
}

// console.log(fibonacci(5));


function bsearch(arr, target) {
  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  }

  if (arr.length === 1) {
    if (arr[0] !== target) {
      return -1;
    }
  }

  let left = arr.slice(0, mid);
  let right = arr.slice(mid, arr.length);


  if (target > mid) {
    const subproblem = bsearch(right, target);
    return subproblem === -1 ? -1 : subproblem + mid;
  }else {
    return bsearch(left, target);
  }

}

console.log(bsearch([2,3,4,6], 5));
//4


function merge(left,right) {

  let result = [];

  while(left.length > 0 && right.length > 0){
    if(left[0] > right[0]){
      result.push(right.shift());

    }else{
      result.push(left.shift());
    }
  }
  return result.concat(left).concat(right);

}


function mergeSort(arr) {
  if (arr.length === 1 || arr.length ===0){
    return arr;
  }

  let mid = Math.floor(arr.length/2);
  let left = arr.slice(0,mid);
  let right = arr.slice(mid);
  
  return merge(mergeSort(left),mergeSort(right));


}
console.log(mergeSort([3,2,1,1]));
