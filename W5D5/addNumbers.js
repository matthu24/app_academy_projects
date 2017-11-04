const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum,numsLeft,completionCallback) {
  if (numsLeft > 0) {
    //answer is a string number
    reader.question("What is your next number: ", function (answer) {

      //turns string answer into an integer answerNum
      const answerNum = parseInt(answer);

      sum += answerNum;
      console.log("current sum is " + sum);

      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else if (numsLeft === 0) {
    completionCallback(sum);
  }

}

//last input in addNumbers is the completion callback,
// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
addNumbers(0, 3, function(sum){console.log('Total Sum: ${sum}');});
