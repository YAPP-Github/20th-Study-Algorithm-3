let fs = require('fs');
let input = fs.readFileSync('/dev/stdin').toString().split(' ')[0];
let answer=[];
let st=[];
const priority=(ch)=>{
    switch (ch) {
	    case '*': case '/': return 1; //우선순위 높음
	    case '+': case '-': return 2;//우선순위 낮음
	    case '(': case ')': return 3;//우선순위 없음
	}
}
const toPostfix=(ch)=>{
    switch(ch){
        case '*': case '/': case '+': case '-':
            while (st.length!=0 && priority(st[st.length-1])<=priority(ch)) {
                answer.push(st[st.length-1]);
                st.pop();
            }
            st.push(ch);
            break;
        case '(':
		    st.push(ch);
		    break;
		case ')':
		    while (st.legnth!=0 && st[st.length-1]!='(') {
		        answer.push(st[st.length-1]);
		        st.pop();
		    }
		    //'(' pop
		    st.pop();
		    break;
    }
}
for (let i=0; i<input.length; i++) {
    if (input[i]>='A' && input[i]<='Z') {
        answer.push(input[i]);
    }
    else {
        toPostfix(input[i]);
    }
}
while (st.length!=0) {
    answer.push(st[st.length-1]);
    st.pop();
}
console.log(answer.join(''));
