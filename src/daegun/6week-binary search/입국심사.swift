import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]    // 심사대 수
var M = input[1]    // 사람 수

var time: [Int] = []
for _ in 0..<N {
    time.append(Int(readLine()!)!)
}
time.sort(by: <)

// 가능한 최대 / 최소 값을 정해 놓고 탐색
var min: Int = 1
var max: Int = time.last! * M

var mid = 0
var result = Int.max

while min <= max {
    
    mid = (min+max)/2      // 사용 가능한 시간
    
    // estimate 시간이 주어지면 모든 심사대가 심사할 수 있는 사람 수의 최댓값 산정
    var capacity = 0
    for checkPoint in time {
        capacity += mid/checkPoint
    }
    
    // 이진탐색
    if capacity >= M {
        if result > mid {
            result = mid
        }
        max = mid - 1
    } else {
        min = mid + 1
    }
    
}

print(result)
