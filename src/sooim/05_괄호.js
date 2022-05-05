let input = require("fs").readFileSync("/dev/stdin").toString().split("\n");
const arrayLength = Number(input[0]);

for (let i = 1; i <= arrayLength; i++) {
  const newArray = input[i];
  const stack = [];
  let result = "YES";

  for (let j = 0; j < newArray.length; j += 1) {
    if (newArray[j] === "(") {
      stack.push(1);
    } else {
      if (!stack.pop()) {
        result = "NO";
        break;
      }
    }
  }
  if (stack.length !== 0) {
    result = "NO";
  }

  console.log(result);
}
