const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [S, K]=input[0].split(' ').map(Number);
const [...arr]=input[1].split(' ').map(Number);

let answer=0;

const count=(index, oddCnt, maxLen)=>{
    if (arr[index]%2!=0) oddCnt++;
    else maxLen++;
    return [oddCnt, maxLen];
}

//left 포인터를 고정하고 right만 움직임
for (let left=0; left<S; left++) {
    let right=left+1;
    let [oddCnt, maxLen]=count(left, 0, 0);
    
    while (true){
        if (oddCnt>K || right==S) break;
        [oddCnt, maxLen]=count(right, oddCnt, maxLen);
        right++;
    }
    //최대값 갱신
    answer=Math.max(answer,maxLen);
}
console.log(answer);
