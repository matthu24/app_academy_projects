function bubbleSort(arr) {
  let sorted = false;
  while(sorted ===false){
    for (let i = 0; i < arr.length -1; i++) {
      sorted = true;
      let j = i + 1;
      if(arr[i] > arr[j]){
        let temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        sorted = false;
      }

    }
  }
  return arr;
}

// console.log(bubbleSort([3,2,1,1]));

function subString(str) {
  let result = [];

  for (let i = 0; i < str.length; i++) {
    for (let j = i+1; j <= str.length; j++) {
      let temp = str.slice(i,j);
      if (!result.includes(temp)) {
        result.push(temp);
      }
    }
  }
  return result;
}

// console.log(subString("hello"));
