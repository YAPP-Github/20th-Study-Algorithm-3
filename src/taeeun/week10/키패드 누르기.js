function solution(numbers, hand) {
    let answer = '';
    //현재 위치를 좌표로 나타낸다면 (3으로 나눈 몫, 3으로 나눈 나머지)
    let leftFinger = [3, 0];
    let rightFinger=[3, 2];
    
    
    numbers.forEach((number)=>{
        if (number===0) number=11;
        const row = parseInt((number-1)/3);
        const col = (number%3 === 0 ? 3: number%3)-1;

        if (number%3==1) {
            answer+='L';
            leftFinger=[row, col];
        }
        else if (number%3==0) {
            answer+='R';
            rightFinger=[row, col];
        }
        else {
            const leftDist = Math.abs(leftFinger[0]-row) + Math.abs(leftFinger[1]-col);
            const rightDist=Math.abs(rightFinger[0]-row)+Math.abs(rightFinger[1]-col);
            if (leftDist>rightDist) {
                answer+='R';
                rightFinger=[row, col];
            }
            else if (leftDist<rightDist) {
                answer+='L';
                leftFinger=[row, col];
            }
            else {
                //같을 때
                if (hand == "left") {
                    answer+='L';
                    leftFinger=[row, col];
                }
                else {
                    answer+='R';
                    rightFinger=[row, col];
                }
            }
        }
    })
    
    
    return answer;
}
