const input = require('fs').readFileSync('/dev/stdin').toString().trim()
let answer='';
const arr=input.split("");
let flag=false;
let temp='';
arr.forEach((e)=>{
    if (e==='<') {
        flag=true;
        answer+=temp.split("").reverse().join("");
        answer+=e;
        temp='';
    }
    else if (e==='>') {
        flag=false;
        answer+=temp;
        answer+=e;
        temp='';
    }
    else if (e===' ') {
        answer+= (flag ? temp : temp.split("").reverse().join(""))+' ';
        temp='';
    }
    else {
        temp+=e;
    }
})
answer+=temp.split("").reverse().join("");
console.log(answer);
