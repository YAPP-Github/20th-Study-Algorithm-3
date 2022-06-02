import Foundation

/*
 틀렸습니다
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let K = input[1]

let S = readLine()!.split(separator: " ").map { Int($0)! }

// 홀수 사이에 몇개의 짝수들이 붙어있는지 저장
var even: [Int] = []

var last = 0
for i in S {
    
    if i % 2 == 0 {
        last += 1
    } else if last != 0{
        even.append(last)
        last = 0
    }
}
if last != 0{
    even.append(last)
    last = 0
}

// even 배열에서 고를 원소의 개수 결정
// default: K + 1개의 원소를 고른다
// Exception: even의 원소 개수가 K + 1보다 작으면 모든 원소를 고른다
let selection = (even.count >= K + 1) ? K + 1 : even.count

// 초기값 계산 이후 even 배열을 몇번 iteration 할지 계산
let iteration = even.count - selection

// 초기값 계산
var memorize = 0
for i in 0..<selection { memorize += even[i] }

var result = memorize

// 추가로 진행할 iteration이 없다
if iteration == 0 {
    print(result)
  
// 추가로 iteration 하면서 체크해야한다
} else {
    
    var result = memorize
    for i in 1...iteration {
        
        memorize -= even[i-1]               // 없어진 한칸 빼준다
        memorize += even[i+selection-1]     // 새로 들어온 한칸 더해준다
        
        if result < memorize {
            result = memorize
        }
    }
    print(result)
}
