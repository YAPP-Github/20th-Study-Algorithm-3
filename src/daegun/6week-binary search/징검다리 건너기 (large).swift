//
// 시간 초과
//

import Foundation

let N = Int(readLine()!)!   // N: 돌의 개수
var A = readLine()!.split(separator: " ").map { Int($0)! }

var result = Int.max

func move(i: Int, K: Int) {
    
    if i == N-1 {
        if K < result {
            result = K
        }
        return
    }
    
    for j in i+1..<N {
        let cost = (j-i) * (1 + abs(A[i]-A[j]))
        
//        print("move: \(i) -> \(j) K:\(K) cost: \(cost)")
        move(i: j, K: max(cost, K))
    }
    
}

move(i: 0, K: -1)
print(result)
