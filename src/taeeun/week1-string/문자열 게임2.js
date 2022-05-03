const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const N=parseInt(input[0]);
let data=[];
for (let i = 1; i < N*2; i+=2) {
    //string, length
    data.push([input[i], input[i+1]]);
}

for (let i=0; i<data.length; i++) {
    const str=data[i][0];
    const num=parseInt(data[i][1]);
    const alphabet=Array.from(Array(26), () => new Array())
    //각 알파벳이 나타나는 인덱스를 저장
    for (let i=0; i<str.length; i++) {
        alphabet[str[i].charCodeAt()-97].push(i);
    }
    const answer=[];
    for (let i=0; i<26; i++) {
        //있어야하는 개수보다 적다면 탐색하지 않음
        if (alphabet[i].length<num) continue;
        //num개를 포함하는 길이
        for (let j = 0; j < alphabet[i].length-num+1; j++){
            answer.push(alphabet[i][j + num - 1] - alphabet[i][j] + 1);
        }
    }
    if (answer.length>0) console.log(Math.min.apply(null, answer), Math.max.apply(null, answer))
    else console.log(-1);
}
