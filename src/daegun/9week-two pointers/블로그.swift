import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]    // 전체 일수
let X = input[1]    // 기준 일수

var visitor = readLine()!.split(separator: " ").map { Int(String($0))! }

// 기준 일수가 전체 일수보다 크다
if visitor.count <= X {
    
    let sum = visitor.reduce(0, +)
    if sum == 0 {
        print("SAD")
    } else {
        print(sum)
        print("1")
    }
} else {
        
    var temp = 0
    for i in 0..<X {
        temp += visitor[i]
    }
    
    var max = temp         // 최대값
    var maxCount = 1       // 최대값의 개수
    
    for i in X..<N {
        
        temp -= visitor[i-X]
        temp += visitor[i]
        
        if max < temp {
            max = temp
            maxCount = 1
        } else if max == temp {
            maxCount += 1
        }
    }
    
    if max == 0 {
        print("SAD")
    } else {
        print(max)
        print(maxCount)
    }
    
}
