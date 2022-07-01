const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [n, m]=input[0].split(" ").map(Number);
const arr = input.slice(1, m+1).map((e)=>e.split(' ').map(Number));
const dist=Array.from(Array(Number(n+1)), () => new Array(Number(n+1)).fill(Number.MAX_SAFE_INTEGER));
const answer=Array.from(Array(Number(n+1)), () => new Array(Number(n+1)).fill(0));

for (let i=0; i<m; i++) {
    const [x, y, cost]=arr[i];
    dist[x][y]=cost;
    dist[y][x]=cost;
    
    answer[x][y]=y;
    answer[y][x]=x;
}

for (let k=1; k<=n; k++) {
    for (let i=1; i<=n; i++) {
        for (let j=1; j<=n; j++) {
            if (dist[i][j]>dist[i][k]+dist[k][j]) {
                dist[i][j]=dist[i][k]+dist[k][j]
                answer[i][j]=answer[i][k];
            }
        }
    }
}

let log='';

for (let i=1; i<=n; i++) {
    for (let j=1; j<=n; j++) {
        if (i==j) log+='-'+ ' ';
        else log+=answer[i][j]+ ' ';
    }
    log+="\n";
}

console.log(log);
