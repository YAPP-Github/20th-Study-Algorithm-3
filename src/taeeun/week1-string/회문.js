//const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const input = require('fs').readFileSync('./test.txt').toString().trim().split('\n');
const [N, ...arr]=input;
const isSimilar=(str, left, right)=>{
    while (left<right) {
        if (str[left]===str[right]) {
            left++;
            right--;
        }
        else return false;
    }
    return true;
}
const isPalindrome=(str, left, right)=>{
    while (left<right) {
        if (str[left]===str[right]) {
            left++;
            right--;
        }
        else {
            if (isSimilar(str, left+1, right) || isSimilar(str, left ,right-1)) return 1;
            return 2;
        }
    }
    return 0;
}
arr.forEach((e)=> console.log(isPalindrome(e, 0, e.length-1)));
