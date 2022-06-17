const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [n, m] = input[0].split(' ').map(Number);
const [...arr]=input[1].split(' ').map(Number);

//mid값이 점수의 최대값의 최소값일 때 구간이 m개가 나오는지 확인


let answer=Number.MAX_SAFE_INTEGER;


const getSection=(mid)=>{
    let cnt=1;
    let minVal=arr[0];
    let maxVal=arr[0];
    for (let i=1; i<n; i++) {
        minVal=Math.min(minVal, arr[i]);
        maxVal=Math.max(maxVal, arr[i]);
        if (maxVal-minVal>mid) {
            cnt++;
            minVal = arr[i];
            maxVal = arr[i];
        }
    }
    //console.log(mid, cnt)
    return cnt;
}

let left=0;
let right=Math.max.apply(null, arr);

while (left<=right) {
    let mid=Math.floor((left+right)/2);
    if (getSection(mid)<=m) {
        right=mid-1;
        answer=Math.min(answer, mid)
    }
    else {
        left=mid+1;
    }
}
console.log(answer);
