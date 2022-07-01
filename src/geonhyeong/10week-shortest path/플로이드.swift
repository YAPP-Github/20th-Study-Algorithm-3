/*
 *  플로이드.swift
 *  Question Link: https://www.acmicpc.net/problem/11404
 *  Primary idea:   최단 거리
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let n = Int(readLine()!)! // 도시 개수 입력
let m = Int(readLine()!)! // 버스 개수 입력
let INF = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

// i에서 i의 경우 0으로 설정
for i in 1...n {
  graph[i][i] = 0
}

for _ in 0..<m {
  let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
  let v1 = line[0]
  let v2 = line[1]
  let cost = line[2]
  
  // 문제에서 시작 도시와 도착 도시를 연결하는 노선이 하나가 아닐 수 있다고 함,
  // 따라서, v1에서 v2로 가는 노선이 여러개 주어질 경우,
  // graph 배열에 최솟값을 넣어주도록 설정
  graph[v1][v2] = min(graph[v1][v2], cost)
}

// 플로이드-워셜 알고리즘
for k in 1...n {
  for i in 1...n {
    for j in 1...n {
      graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
    }
  }
}

// 출력
for i in 1...n {
  for j in 1...n {
    if graph[i][j] == INF {
      print(0, terminator: " ")
    } else {
      print(graph[i][j], terminator: " ")
    }
  }
  print()
}
