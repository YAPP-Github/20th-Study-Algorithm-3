const fs = require('fs'); 
const [n, ...arr] = fs.readFileSync("/dev/stdin").toString().trim().split(/\s/);
let stack=[];
let answer=[];
for (let i=0; i<arr.length; i++) {
    arr[i]=Number(arr[i]);
}
//가장 처음 탑의 값 넣어줌

stack.push({index:1, height:arr[0]});
answer.push(0);

for (let i=1; i<n; i++) {
    const current={
        index: i+1,
        height: arr[i],
    }
    while (stack.length) {
        //스택의 가장 위의 탑의 높이와 현재 탑의 높이와 비교
        //만약 현재 탑의 높이가 더 크다면 stack에서 pop하고 탐색 진행
        if (stack[stack.length-1].height<current.height) {
            stack.pop();
        }
        //아니라면 스택의 가장 위의 탑에 레이저가 맞는 것이므로 그 탑의 인덱스를 정답에 넣음
        else {
            answer.push(stack[stack.length-1].index);
            break;
        }
    }
    //맞을 탑이 없다면 0 푸쉬
    if (stack.length===0) answer.push(0);
    stack.push(current);
    
}
console.log(answer.join(' '));
