import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

// 각 원소까지의 부분수열에서 가장 큰 오름차순 부분수열 원소 개수
// 첫 원소의 부분수열 원소 수는 무조건 1
var smaller: [Int] = [1]

// 첫 원소 제외한 모든 원소 체크
for i in 1..<A.count {
    
    var num = 1
    
    // 현재보다 앞에 있는 원소 iteration
    for j in 0..<i {
        
        // 현재 원소보다 앞에 있는 원소가 작은 것 중에 최대값 + 1을 저장해서 append
        if smaller[j] + 1 > num && A[j] < A[i]{
            num = smaller[j] + 1
        }
        
    }
    smaller.append(num)
}

print(smaller.max()!)
