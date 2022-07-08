const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const str=input[0];

let leftK=[];
let rightK=[];
let R=0;

//R의 개수
R = str.match(/R/g)?.length;
let cnt=0;
//R의 왼쪽 K 수
for (let i=0; i<str.length; i++) {
    if(str[i]=='K') cnt++;
    else {
        leftK.push(cnt);
    }
}
//R의 오른쪽 K 수
cnt=0;
for (let i=str.length-1; i>=0; i--) {
    if(str[i]=='K') cnt++;
    else {
        rightK.push(cnt);
    }
}
rightK=rightK.reverse();

let left=0;
let right=R-1;
let answer=0;
while (left <= right) {
    answer=Math.max(answer, right-left+1+2*Math.min(leftK[left], rightK[right]));
    if (leftK[left] < rightK[right]) left++;
    else right--;
}
console.log(answer);
