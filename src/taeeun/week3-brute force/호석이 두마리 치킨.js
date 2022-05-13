const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [N, M]=input[0].split(' ');
let A=[]; let B=[];
let answer=[0, 0, Number.MAX_SAFE_INTEGER];
for (let i=1; i<=Number(M); i++) {
   A.push(Number(input[i].split(' ')[0]));
   B.push(Number(input[i].split(' ')[1]));
}
let dist=Array.from(Array(Number(N)), () => Array(Number(N)).fill(0))

//거리 초기화
for (let i=0; i<Number(N); i++) {
    for (let j=0; j<Number(N); j++) {
        if (i!==j) dist[i][j]=Number.MAX_SAFE_INTEGER;
    }
}
//길이 있음
for (let i=0; i<Number(M); i++) {
    for (let j=0; j<Number(M); j++) {
       dist[A[i]-1][B[i]-1]=1;
       dist[B[i]-1][A[i]-1]=1;
    }
}

//최소거리 갱신
for (let k=0; k<Number(N); k++) {
    for (let i=0; i<Number(N); i++) {
        for (let j=0; j<Number(N); j++) {
            dist[i][j]=Math.min(dist[i][j], dist[i][k]+dist[k][j]);
        }
    }
}

const getDistance=(i, j)=>{
    let distance=0;
    for (let x=0; x<Number(N); x++) {
        distance+=Math.min(dist[x][i], dist[x][j])*2;
    }
    return distance;
}



for (let i=0; i<Number(N)-1; i++) {
    for (let j=i+1; j<Number(N); j++) {
        //치킨집이 i, j위치(실제로는 i+1, j+1)에 있을 때 X번에서의 최소 거리들의 합 구한다.
        if (getDistance(i, j)<answer[2]) {
            answer[0]=i+1; answer[1]=j+1; answer[2]=getDistance(i,j);
        }
    }
}
console.log(answer[0]+" "+answer[1]+" "+answer[2]);
