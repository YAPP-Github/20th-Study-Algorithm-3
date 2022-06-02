const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const N=Number(input[0]);
let [...arr]=input[1].split(' ').map(Number);
arr=[0,...arr];

let left=1;
let right=(N-1)*(1+Math.abs(arr[N-1]-arr[0]));
let answer=Number.MAX_SAFE_INTEGER;

while (left<=right) {
    //mid값 이내로 갈 수 있는지
    let mid=Math.floor((left+right)/2);
    let current=1;
    let stack=[current];
    let visited=Array(N+1).fill(false);
    visited[current]=true;
    
    while (stack.length>0) {
        current=stack.pop();

        if (current==N) break;
        for (let i=current+1; i<=N; i++) {
            //current에서 i까지
            let cost=(i-current)*(1+Math.abs(arr[i]-arr[current]));
            if (cost>mid || visited[i]) continue;
            stack.push(i);
            visited[i]=true;
        }
    }
    if (current==N) {
        answer=Math.min(answer, mid);
        right=mid-1;
    }
    else {
        left=mid+1;
    }
}
console.log(answer);
