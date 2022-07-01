import Foundation

let N = Int(readLine()!)!    // 노드 수
let M = Int(readLine()!)!    // 경로 수

let inf = 100000

var graph = [[Int]].init(repeating: [Int].init(repeating: inf, count: N), count: N)     // 비용

// 그래프 초기화

for i in 0..<N {
    graph[i][i] = 0
}

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if graph[edge[0]-1][edge[1]-1] != inf {
        
        let existing = graph[edge[0]-1][edge[1]-1]
        graph[edge[0]-1][edge[1]-1] = min(edge[2], existing)
    } else {
        graph[edge[0]-1][edge[1]-1] = edge[2]
    }
}



// index: 경유지
for index in 0..<N {
    
    // f: 출발 From
    for f in 0..<N {
        
        if index == f { continue }
        
        // t: 도착 To
        for t in 0..<N {
            
            if index == t || index == f || f == t { continue }
            
            graph[f][t] = min(graph[f][index] + graph[index][t], graph[f][t])
        }
    }

}

for list in graph {
    print(list.map {
        if $0 == inf {
            return "0"
        } else {
            return String($0)   // 0부터 시작하는 index이므로 1 더해준다
        }
    }.joined(separator: " "))
}
