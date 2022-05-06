import Foundation

let N = Int(readLine()!)!
let towers = readLine()!.split(separator: " ").map { Int(String($0))! }

var result: [Int] = [Int].init(repeating: 0, count: N)
var stack: [Int] = []

for i in (0..<N).reversed() {
    
    while stack.count > 0 && towers[stack.last!] <= towers[i] {
        
        let last = stack.removeLast()
        result[last] = i + 1
    }
    
    stack.append(i)
}

print(result.map { "\($0)" }.joined(separator:" "))
