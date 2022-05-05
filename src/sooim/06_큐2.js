const array = require("fs")
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let queue = [];
let result = [];

let len = array.shift();
for (let i = 0; i < len; i++) {
  switch (array[i]) {
    case "pop":
      result.push(queue.pop() || -1);
      break;

    case "size":
      result.push(queue.length);
      break;

    case "empty":
      result.push(queue[0] ? 0 : 1);
      break;

    case "front":
      result.push(queue[0] || -1);
      break;

    case "back":
      result.push(queue[queue.length - 1] || -1);
      break;

    default:
      queue.push(array[i].split(" ")[1]);
      break;
  }
}

console.log(result.join("\n"));
