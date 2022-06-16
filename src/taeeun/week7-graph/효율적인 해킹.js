const [NM, ...input] = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, M]=NM.split(' ').map(Number);
const arr=input.map((e)=>e.split(' ').map(Number))
const graph=Array.from(Array(Number(N+1)), () => new Array());
const maxComputer=Array(N+1).fill(0);

const bfs=(v)=>{
    const visited=Array(N+1).fill(false);
    let stack=[];
    let cnt=0;
    stack.push(v);
    visited[v]=true;
    
    while(stack.length) {
        const current=stack.shift();
        for (let i=0; i<graph[current].length; i++) {
            const next=graph[current][i];
            if (!visited[next]) {
                visited[next]=true;
                stack.push(next);
                cnt++;
            }
        }
    }
    maxComputer[v]=cnt;
    
}

for (const [a, b] of arr) {
    graph[b].push(a);
}
for (let i=1; i<=N; i++) {
    bfs(i);
}

const answer=[];
const maxHack=Math.max.apply(null, maxComputer);

for (let i=1; i<=N; i++) {
    if (maxComputer[i]==maxHack) answer.push(i);
}


console.log(...answer);
