const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
//세로, 가로
const [N, M]=input[0].split(' ');
const arr = input.slice(1, N+1).map((e)=>e.split(' ')).map((e)=>e.map(Number));
const visited=Array.from(Array(Number(N)), () => new Array(Number(M)).fill(false));
let answer=0;
const dx=[-1,-1,1,1];
const dy=[-1,1,-1,1];

//만들 수 없는 경우
if (Number(N)<2 || Number(N)<2) {
    console.log(0);
    return;
}
const backtracking=(x, y, sum)=>{
    //가로로 다 탐색했으면 다음 줄로 넘어감
    if (y==Number(M)) {
        y=0;
        x=x+1;
    }
    //끝까지 다 탐색한 경우
    if (x==Number(N)) {
        answer=Math.max(answer, sum);
        return;
    }
    
    //만약 현재 노드를 방문할 수 있다면
    if (!visited[x][y]) {
        for (let i=0; i<4; i++) {
            const nextX=x+dx[i];
            const nextY=y+dy[i];
            
            if (nextX<0 || nextX>=Number(N) || nextY<0 || nextY>=Number(M)) continue;
            if (visited[x][nextY] || visited[nextX][y]) continue;
            
            visited[x][y]=true;
            visited[x][nextY]=true;
            visited[nextX][y]=true;
            
            backtracking(x, y+1, sum+arr[x][y]*2+arr[x][nextY]+arr[nextX][y]);
            
            visited[x][y]=false;
            visited[x][nextY]=false;
            visited[nextX][y]=false;
        }
    }
    //현재 노드를 방문하지 않는 경우
    backtracking(x, y+1, sum);
}

backtracking(0, 0, 0);
console.log(answer);
