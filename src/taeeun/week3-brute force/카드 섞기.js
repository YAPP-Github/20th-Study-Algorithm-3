let fs = require('fs');
let input = fs.readFileSync('/dev/stdin').toString().trim().split('\n');
const N=Number(input[0]);
let arr=input[1].split(' ').map(Number);
let cards=[];
const step=(lastCard, numCards)=>{
    let temp=[];
    for (let i=lastCard-numCards; i<lastCard; i++) {
        temp.push(cards[i]);
        cards[i]=0
    }
    cards=temp.concat(cards).filter(e=>e!==0);
}
const mixCard=(k)=>{
    let lastCard=N;
    for (let i=1; i<=k+1; i++) {
        let numCards=Math.pow(2, k-i+1);
        step(lastCard, numCards);
        lastCard=numCards;
    }
}
const createCardDeck=()=>{
    let cards=[];
    for (let i=0; i<N; i++) {
        cards.push(i+1);
    }
    return cards;
}
const check=(cards)=>{
    for (let i=0 ;i<N; i++) {
        if (arr[i]!=cards[i]) return false;
    }
    return true;
}
for (let i=1; Math.pow(2,i)<=N; i++) {
    for (let j=1; Math.pow(2, j)<=N; j++) {
        cards=createCardDeck();
        mixCard(i);
        mixCard(j);
        if (check(cards)) {
            console.log(i, j);
            return 0;
        }
    }
}
