const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const n=Number(input[0]);
const m=Number(input[1]);
const arr = input.slice(2, m+2).map((e)=>e.split(' ').map(Number));
const dist=Array.from(Array(Number(n+1)), () => new Array(Number(n+1)).fill(Number.MAX_SAFE_INTEGER));

for (const [a, b, cost] of arr) {
    dist[a][b]=Math.min(dist[a][b], cost);
}


for (let k=1; k<=n; k++) {
    for (let i=1; i<=n; i++) {
        for (let j=1; j<=n; j++) {
            if (dist[i][j] > dist[i][k]+dist[k][j]) {
                dist[i][j]=dist[i][k]+dist[k][j];
            }
            
        }
    }
}

//출력
let answer='';
for (let i=1; i<=n; i++) {
    for (let j=1; j<=n; j++) {
        if (i==j) {
            answer+='0 ';
            continue;
        }
        if (dist[i][j]==Number.MAX_SAFE_INTEGER) answer+='0 ';
        else answer+=dist[i][j]+ ' ';
    }
    answer+="\n";
}

console.log(answer);
