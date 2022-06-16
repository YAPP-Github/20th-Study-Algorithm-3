const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, M]=input[0].split(' ').map(Number);
const arr = input.slice(1, N+1).map((e)=>e.split(''));

const dx=[-1,1,0,0];
const dy=[0,0,-1,1];
let answer=0;

const isReachable=(x, y)=>{
    if (x<0 || x>=N || y<0 || y>=M) return false;
    return true;
}

//불이 번진 시각
const fireTime=Array.from(Array(N),()=>Array(M).fill(0));
const fire=()=>{
    const q=[];    
    
    for (let i=0; i<N; i++) {
        for (let j=0; j<M; j++) {
            if (arr[i][j]==='F') {
                q.push([i, j]);
                fireTime[i][j]=1;
            }
        }
    }
    
    let prevIdx=0;
    while(true) {
        let curIdx=q.length;
        let flag=false;
        for (let i=prevIdx; i<curIdx; i++) {
            const [currentX, currentY]=q[i];
            for (let i=0; i<4; i++) {
               const nextX=currentX+dx[i];
               const nextY=currentY+dy[i];
               
               if(!isReachable(nextX, nextY)) continue;
               if (fireTime[nextX][nextY]>=1 ||arr[nextX][nextY]=='#') continue;
               
               flag=true;
               fireTime[nextX][nextY]=fireTime[currentX][currentY]+1;
               q.push([nextX, nextY]);
            }
        }
        if(!flag) break;        
        prevIdx=curIdx;
    }
}


const bfs=()=>{
    const q=[];
    const visited=Array.from(Array(N),()=>Array(M).fill(0));
    for (let i=0; i<N; i++) {
        for (let j=0; j<M; j++) {
            if (arr[i][j]=='J') {
                q.push([i, j]);
                visited[i][j]=1;
                break;
            }
        }
    }
    
    let prevIdx=0;
    while(true) {
        let curIdx=q.length;
        let flag=false;
        for (let i=prevIdx; i<curIdx;i++) {
            const [currentX, currentY]=q[i];
            for (let j=0; j<4; j++) {
               const nextX=currentX+dx[j];
               const nextY=currentY+dy[j];
               
               //탈출 할 수 있음
                if (!isReachable(nextX, nextY)) {
                   console.log(visited[currentX][currentY]);
                   return 0;
               }
               
               //벽이거나 이미 방문한 경우
               if (arr[nextX][nextY]==='#' || visited[nextX][nextY]!=0) continue;
               
               //불이 이미 번진 경우
               if (visited[currentX][currentY]+1>=fireTime[nextX][nextY] && fireTime[nextX][nextY]!==0) continue;
               
                visited[nextX][nextY]=visited[currentX][currentY]+1;
                q.push([nextX, nextY]);
                flag=true;
            }
        }
        if(!flag) break;        
        prevIdx=curIdx;
    }
    console.log("IMPOSSIBLE");
}

const solution=()=>{
    fire();
    bfs();
}


solution();
