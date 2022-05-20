const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, S]=input[0].split(' ');
const [...arr]=input[1].split(' ').map(Number);
let answer=0;
const backtracking=(idx, sum)=>{
    if (idx>=Number(N)) return;
    //먼저 더하지 않으면 아무것도 선택 안했을 경우(합이 0)인 케이스가 합쳐짐
    sum+=arr[idx];
    if (sum==Number(S)) answer++;
    backtracking(idx+1, sum);
    backtracking(idx+1, sum-arr[idx]);
}
backtracking(0, 0);
console.log(answer);
