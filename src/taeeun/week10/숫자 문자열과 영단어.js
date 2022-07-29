function solution(s) {
    var answer = '';
    const words = {'zero': '0',
             'one': '1',
             'two': '2',
             'three': '3',
             'four': '4',
             'five': '5',
             'six': '6',
             'seven': '7',
             'eight': '8',
             'nine': '9'}   
    let temp='';
    for (let string of s){
        //숫자라면
        if (!isNaN(string)){
            answer+=string;
            continue;
        }
        temp+=string;
        if (words[temp]){
            answer+=words[temp];
            temp='';
        }
    }
    return parseInt(answer);
}
