const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const n=Number(input[0])
const [...arr]=input[1].split(' ').map(Number);
arr.sort((a,b)=> a-b);
let left=0;
let right=n-1;
let max_sum=Number.MAX_SAFE_INTEGER;
let answer=[];
while (left<right) {
    let sum=arr[left]+arr[right];
    if (Math.abs(sum) < max_sum) {
        max_sum=Math.abs(sum);
        answer=[arr[left], arr[right]];
    }
    if (sum < 0) left ++;
    else right--;
}
console.log(answer[0], answer[1]);
