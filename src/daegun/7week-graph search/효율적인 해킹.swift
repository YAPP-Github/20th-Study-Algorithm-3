/*
 시간 초과
 */

import Foundation

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let E = data[0]
let V = data[1]

// 간선 정보 입력
var graph: [[Bool]] = [[Bool]].init(repeating: [Bool].init(repeating: false, count: E), count: E)
for _ in 0..<V {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[1] - 1][input[0] - 1] = true
}
// BFS 과정에서 재사용될 변수 설정
var visited: [Bool] = []
var visitedEach: [Int] = [Int].init(repeating: 0, count: E)     // 각 노드에서 시작할 때의 visited == true 인 값 저장

func BFS(start: Int) {
    
    var front = 0
    
    var queue = [start]
    visited[start] = true
    
    while queue.count > front {
    
        visitedEach[start] += 1          // 방문했기 때문에 +1
        visited[queue[front]] = true     // 현재 노드 방문처리
        
        for (idx, isConnected) in graph[queue[front]].enumerated() {
            if isConnected && !visited[idx] {
                queue.append(idx)
            }
        }
        
        // queue의 맨 앞부분을 지워준다
        front += 1
    }
    
}

for i in 0..<E {
    print(i)
    visited = [Bool].init(repeating: false, count: E)
    BFS(start: i)
}

var result: [Int] = []

let max = visitedEach.max()
for (idx, value) in visitedEach.enumerated() {
    if value == max {
        result.append(idx+1)
    }
}

print(result.map { String($0) }.joined(separator: " "))
