import Foundation

let N = readLine()!.split(separator: " ").map { Int($0)! }  // Edge, Vertex 수
let inf = 10000         // inf = 1000일때 부분 성공

var V: [[Int]] = []    // Vertex 정보를 담을 배열

// 간선 배열 초기화
for f in 0..<N[0] {
    V.append([])
    for t in 0..<N[0] {
        if f == t {
            V[f].append(0)             // 자기 자신으로 가는 가중치는 0
        } else {
            V[f].append(inf)       // 무한대 대신 Int.max 사용
        }
    }
}

// 간선 배열에 도로 정보 입력: 직접적으로 연결된 구간의 가중치 1 입력
(0..<N[1]).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    V[input[0]-1][input[1]-1] = 1
    V[input[1]-1][input[0]-1] = 1
}

// 플로이드 와샬
for index in 0..<N[0] {
    
    // f: 출발 From
    for f in 0..<N[0] {
        
        if index == f { continue }
        
        // t: 도착 To
        for t in 0..<N[0] {
            if index == f || f == t { continue }
            
            var new = V[f][index] + V[index][t]
            if new >= inf {
                new = inf
            } else if new < V[f][t] {
                V[f][t] = new
            }
            
        }
    }

}

var result = [inf, inf, inf]   // 치킨집이 될 건물 1, 치킨집이 될 건물 2, 왕복 시간

for a in 0..<N[0] {
    
    for b in a..<N[0] {
        
        if a == b { continue }
        
        var sum = 0
        for t in 0..<N[0] {
            sum += min(V[a][t], V[b][t])
        }
        
        if sum < result[2] {
            result[0] = a
            result[1] = b
            result[2] = sum
        
        // 건물 조합이 다양하게 가능하면
        } else if sum == result[2]{
            
            // 작은 번호가 더 작은 것을 출력
            if result[0] > a {
                result[0] = a
                result[1] = b
                result[2] = sum
                
            // 작은 번호가 같다면 큰 번호가 더 작은 걸 출력
            } else if result[0] == a {
                if result[1] > b {
                    result[0] = a
                    result[1] = b
                    result[2] = sum
                }
            }
        }
            
    }
}

print("\(result[0]+1) \(result[1]+1) \(result[2]*2)")
