import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]    // 노드 수
let M = input[1]    // 경로 수

let inf = 1001*200

var graph = [[Int]].init(repeating: [Int].init(repeating: inf, count: N), count: N)     // 거리
var path = [[Int]].init(repeating: [Int].init(repeating: inf, count: N), count: N)      // 처음 가야하는 경로

// 그래프 초기화
for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[edge[0]-1][edge[1]-1] = edge[2]
    graph[edge[1]-1][edge[0]-1] = edge[2]
    
    path[edge[0]-1][edge[1]-1] = edge[1]-1
    path[edge[1]-1][edge[0]-1] = edge[0]-1
}



// index: 경유지
for index in 0..<N {
    
    // f: 출발 From
    for f in 0..<N {
        
        if index == f { continue }
        
        // t: 도착 To
        for t in 0..<N {
            
            if index == f || f == t { continue }
            
            if graph[f][t] > graph[f][index] + graph[index][t] {
                graph[f][t] = graph[f][index] + graph[index][t]     // 거리 갱신
                path[f][t] = path[f][index]                         // 처음 목적지 갱신
            }
            
        }
    }

}

for list in path {
    print(list.map {
        if $0 == inf {
            return "-"
        } else {
            return String($0 + 1)   // 0부터 시작하는 index이므로 1 더해준다
        }
    }.joined(separator: " "))
}
