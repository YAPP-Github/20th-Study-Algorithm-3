import Foundation

let N = Int(readLine()!)!    // 전체 용액 수
var liquid = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

var start = 0
var end = N-1

var result = (-1, -1)       // (start, end)
var min = Int.max

while start < end {
    
    let sum = liquid[start] + liquid[end]
    
    if abs(sum) < min {
        min = abs(sum)
        result = (start, end)
    }
        
    if sum > 0 {
        end -= 1
    } else if sum == 0 {
        break
    } else if sum < 0 {
        start += 1
    }
    
}

print("\(liquid[result.0]) \(liquid[result.1])")
