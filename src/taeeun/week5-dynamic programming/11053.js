const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const N=Number(input[0]);
const [...arr]=input[1].split(' ').map(Number);
let dp=Array(N).fill(1);
for (let i=1; i<N; i++) {
    for (let j=i-1; j>=0; j--) {
        if (arr[j]<arr[i]) {
            dp[i]=Math.max(dp[i], dp[j]+1);
        }
    }
}
console.log(Math.max.apply(null, dp))
