const fs = require('fs');
const input = fs.readFileSync('/dev/stdin').toString().trim().split('\n');
const N=input[0];
const arr = input.slice(1).map((v) => v.split(' ').map(Number));
const stack=[];
const data=[];
arr.forEach(([x, r], index)=>{
    //0이 시작점 1이 끝나는 점 index는 원 번호
    data.push([x-r, 0, index]);
    data.push([x+r, 1, index]);
})
data.sort((a,b)=>a[0]-b[0]);
let flag=false;
for (let i=0; i<data.length; i++) {
    let point=data[i];
    if (point[1]===0) {
        stack.push(point);
    }
    else {
        //stack의 가장 위 값이 같은 원이면 원이 닫히는것이므로 pop
        if (stack[stack.length-1][2]===point[2]) 
            stack.pop();
        //아니라면 두 원의 교점이 생김
        else {
            console.log("NO");
            flag=true
            break;
        }
    }
}
if (!flag) console.log("YES");
