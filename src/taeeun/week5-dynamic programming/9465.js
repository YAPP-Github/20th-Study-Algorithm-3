const input = require('fs').readFileSync('/dev/stdin').toString().trim().split('\n');
const [T, ...arr]=input;
for (let i=0; i<Number(T); i++) {
    const N=Number(arr[i*3]);
    const stickers=arr.slice(i*3+1, i*3+3).map((e)=>e.split(' ').map(Number));
    const dp=Array.from(Array(2),()=>Array(N+1).fill(0));
    dp[0][0]=dp[1][0]=0;
    
    dp[0][1]=stickers[0][0];
    dp[1][1]=stickers[1][0];
    
    for (let j=2; j<=N; j++) {
        //옆에서 고를 때
        //위에서 고를 때
        //둘 다 고르지 않았을 때
        dp[0][j]=Math.max(dp[1][j-1], dp[1][j-2])+stickers[0][j-1];
        dp[1][j]=Math.max(dp[0][j-1], dp[0][j-2])+stickers[1][j-1];
    }
    
    console.log(Math.max(Math.max.apply(null, dp[0]), Math.max.apply(null, dp[1])));
}

//틀린코드.. 왜인지 모르겠음
    // dp[0][1]=stickers[0][0];
    // dp[1][1]=stickers[1][0];

    // if (N==1) {
    //     console.log(Math.max(dp[0][0], dp[1][0]));
    //     return;
    // }
    
    // dp[0][1]=stickers[0][1]+dp[1][0];
    // dp[1][1]=stickers[1][1]+dp[0][0];
    
    
    // for (let j=2; j<N; j++) {
    //     //대각선으로 고를 때&고르지 않을 때
    //     dp[0][j]=Math.max(dp[1][j-1], dp[1][j-2])+stickers[0][j];
    //     dp[1][j]=Math.max(dp[0][j-1], dp[0][j-2])+stickers[1][j];
    // }
    
    // console.log(Math.max(Math.max.apply(null, dp[0]), Math.max.apply(null, dp[1])));
