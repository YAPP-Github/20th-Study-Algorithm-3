const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const n=Number(input[0]);
const arr = input.slice(1, n+1).map((e)=>e.split(' ').map(Number));


for (let k=0; k<n; k++) {
    for (let i=0; i<n; i++) {
        for (let j=0; j<n; j++) {
            if (arr[i][k] && arr[k][j]) arr[i][j]=1;
        }
    }
}

for (let i=0; i<n; i++) {
    console.log(arr[i].join(" "));
}
