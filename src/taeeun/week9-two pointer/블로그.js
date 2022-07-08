const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [n, x]=input[0].split(' ').map(Number);
const [...arr]=input[1].split(' ').map(Number);

let visitors=0;

for (let i=0; i<x; i++) {
    visitors+=arr[i];
}
let max_visitors=visitors;
let cnt=1;
for (let i=x; i<n; i++) {
    visitors-=arr[i-x];
    visitors+=arr[i];
    if (max_visitors < visitors) {
        max_visitors=visitors;
        cnt=1;
    }
    else if (max_visitors==visitors) {
        cnt++;
    }
}
if (max_visitors===0) console.log("SAD");
else {
    console.log(max_visitors);
    console.log(cnt);
}
