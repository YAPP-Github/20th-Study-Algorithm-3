import Foundation

let V = Int(readLine()!)!

var N: [[Int]] = []
for _ in 0..<V {
    N.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for index in 0..<V {
    
    // f: 출발 From
    for f in 0..<V {
        
        if index == f { continue }
        
        // t: 도착 To
        for t in 0..<V {
            
            if index == f { continue }
            
            // 인접 경로 있다면 처리하지 않는다
            if N[f][t] == 0 && N[f][index] == 1 && N[index][t] == 1 {
                N[f][t] = 1
            }
        }
    }

}

for list in N {
    print(list.map { String($0) }.joined(separator: " "))
}
