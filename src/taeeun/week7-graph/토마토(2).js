const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, M, H]=input[0].split(' ').map(Number);
const arr = input.slice(1).reduce((acc, v, i) => {
  acc[Math.floor(i / M)].push(v.split(' ').map(v => +v));
  return acc;
}, [...Array(H)].map(() => []));

const dx=[0, 0, 0, 0, -1, 1];
const dy=[0, 0, -1, 1, 0, 0];
const dz=[-1, 1, 0, 0, 0, 0];

let answer=0;

const isReachable=(x, y, z)=>{
    if (x<0 || x>=M || y<0 || y>=N || z<0 || z>=H) return false;
    return true;
}


const bfs=()=>{
    let cnt=0;
    const q=[];
    for (let k=0; k<H; k++) {
        for (let i=0; i<M; i++) {
            for (let j=0; j<N; j++) {
                if (arr[k][i][j]==0) cnt++;
                if (arr[k][i][j]===1) q.push([i, j, k]);
            }
        }  
    }
    let prevIdx=0;
    while(true) {
        //const [currentX, currentY]=q.shift(); shift를 쓰면 시간초과가 난다... ;)
        let curIdx=q.length;
        let flag=false;
        for (let i=prevIdx; i<curIdx; i++) {
            const [currentX, currentY, currentZ]=q[i];
            for (let i=0; i<6; i++) {
               const nextX=currentX+dx[i];
               const nextY=currentY+dy[i];
               const nextZ=currentZ+dz[i];
               
               if (!isReachable(nextX, nextY, nextZ)) continue;
               if (arr[nextZ][nextX][nextY]==-1 || arr[nextZ][nextX][nextY]>=1) continue;
               
               arr[nextZ][nextX][nextY]=arr[currentZ][currentX][currentY]+1;
               q.push([nextX, nextY, nextZ]);
               cnt--;
               flag=true;
            }
        }
        if(!flag) break;
        prevIdx=curIdx;
    }
    if (cnt==0) answer=Math.max(...arr.flat().flat())-1;
    else answer=-1;
}
bfs();
console.log(answer);
