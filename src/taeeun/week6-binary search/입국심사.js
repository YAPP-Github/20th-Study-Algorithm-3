//프로그래머스에서는 통과하는데 백준에서는 시간초과..
const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [n, m] = input[0].split(' ').map(Number);
const [...arr]=input.splice(1, n+1).map(Number);
arr.sort((a,b)=>a-b);
//최소 시간~최대 시간
let left=1;
let right=arr[n-1]*m;
let answer=0;
while (left<=right) {
    let cnt=0;
    let mid=Math.floor((left+right)/2);
    //mid의 시간 만큼 있을 때 몇명을 심사할 수 있는지
    cnt=arr.reduce((acc, cur)=>acc+Math.floor(mid/cur),0);
    if (cnt<m) {
        left=mid+1;
    }
    else {
        answer=mid;
        right=mid-1;
    }
}
console.log(answer);
