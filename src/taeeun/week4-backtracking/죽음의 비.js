const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, H, D]=input[0].split(' ');
const arr = input.slice(1, N+1).map((e)=>e.split(''));
const visited=Array.from(Array(Number(N)), () => new Array(Number(N)).fill(false));
const start=[];
const end=[];
const umbrella=[];
for (let i=0; i<Number(N); i++) {
    for (let j=0; j<Number(N); j++) {
        if (arr[i][j]=='S') start.push(i,j);
        if (arr[i][j]=='E') end.push(i,j);
        if (arr[i][j]=='U') umbrella.push([i,j]);
    }
}
let answer=Number.MAX_SAFE_INTEGER;

const getDist=(x, y, x1, y1)=> {
   return Math.abs(x-x1)+Math.abs(y-y1);
}
const backtracking=(x, y, h, d, cnt)=>{
    const distLeft=getDist(x, y, end[0], end[1]);
    //남은 거리가 우산+현재체력만으로 갈 수 있다면 탐색 종료
    if (distLeft<=h+d) {
        answer=Math.min(answer, cnt+distLeft);
        return;
    }
    //안된다면 우산으로 걸어가야함
    for (let i=0; i<umbrella.length; i++) {
        const [umbrellaX, umbrellaY]=umbrella[i];
        
        //이미 방문한 우산은 x
        if (visited[umbrellaX][umbrellaY]) continue;
        
        const distToUmbrella=getDist(x, y, umbrellaX, umbrellaY);
        
        //우산으로 걸어갈 수 없으면 x
        if (distToUmbrella>h+d) continue;
        
        visited[umbrellaX][umbrellaY]=true;
        //현재 내구도로 다음 우산까지 방문할 수 있는 경우
        if (d>=distToUmbrella) backtracking(umbrellaX, umbrellaY, h, Number(D), cnt+distToUmbrella);
        //아니라면 체력 소모
        else backtracking(umbrellaX, umbrellaY, h+d-distToUmbrella, Number(D), cnt+distToUmbrella);
        visited[umbrellaX][umbrellaY]=false;
    }
    
}
backtracking(start[0], start[1], Number(H), 0, 0);
if (answer==Number.MAX_SAFE_INTEGER) {
    console.log(-1); return 0;
}
console.log(answer);
