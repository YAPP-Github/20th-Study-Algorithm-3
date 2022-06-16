const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, M]=input[0].split(' ').map(Number);
const arr = input.slice(1, M+1).map((e)=>e.split(' ').map(Number));
const dx=[0, 0, -1, 1];
const dy=[-1, 1, 0, 0];
let answer=0;

const isReachable=(x, y)=>{
    if (x<0 || x>=M || y<0 || y>=N) return false;
    return true;
}

const bfs=()=>{
    let cnt=0;
    const q=[];
    for (let i=0; i<M; i++) {
        for (let j=0; j<N; j++) {
            if (arr[i][j]==0) cnt++;
            if (arr[i][j]===1) q.push([i, j]);
        }
    }
    let prevIdx=0;
    while(true) {
        //const [currentX, currentY]=q.shift(); shift를 쓰면 시간초과가 난다... ;)
        let curIdx=q.length;
        let flag=false;
        for (let i=prevIdx; i<curIdx; i++) {
            const [currentX, currentY]=q[i];
            for (let i=0; i<4; i++) {
               const nextX=currentX+dx[i];
               const nextY=currentY+dy[i];
               
               if (!isReachable(nextX, nextY)) continue;
               if (arr[nextX][nextY]==-1 || arr[nextX][nextY]>=1) continue;
               
               arr[nextX][nextY]=arr[currentX][currentY]+1;
               q.push([nextX, nextY]);
               cnt--;
               flag=true;
            }
        }
        if(!flag) break;
        prevIdx=curIdx;
    }
    
    if (cnt==0) answer=Math.max(...arr.flat())-1;
    else answer=-1;
}
bfs(); 
console.log(answer);
