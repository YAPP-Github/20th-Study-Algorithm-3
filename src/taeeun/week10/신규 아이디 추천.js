function solution(new_id) {
    let answer = '';
    answer=new_id.toLowerCase() // 1단계
    .replace(/[^a-z-_.0-9]/g,'')  //2단계
    .replace(/\.{2,}/g, '.') //3단계
    .replace(/^\.|\.$/g, '') //4단계
    .substr(0,15) //6단계
    .replace(/\.$/g, '') //6단계
    if (answer.length==0) answer+="a"; //5단계
    while (answer.length<=2) answer+=answer[answer.length-1]; //7단계
    return answer;
}
