/*
 *  택배.swift
 *  Question Link: https://www.acmicpc.net/problem/1719
 *  Primary idea:   최단 경로
 *                   1. 플로이드-워셜 : 모든 정점에 대한 경로를 계산
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let m = input[1]
let INF = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
var res = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<m {
  let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
  let v1 = line[0]
  let v2 = line[1]
  let cost = line[2]
  
  // 양방향 그래프
  graph[v1][v2] = cost
  graph[v2][v1] = cost
  
  // v1 출발 -> v2 도착이면 v1 기준으로 v2가 도착지점이 되어야함.
  res[v1][v2] = v2
  res[v2][v1] = v1 // 위와 반대
}

// 플로이드-워셜 알고리즘
for k in 1...n {
  for i in 1...n {
    for j in 1...n {
      if i == j { continue } // 자기 자신으로 가는 경로는 제외
      
      // 기존의 i -> j로 가는 저장된 비용보다 'i -> k -> j'로 가는 경로가 더 최단 거리이면
      if graph[i][j] > graph[i][k] + graph[k][j] {
        graph[i][j] = graph[i][k] + graph[k][j] // 비용을 '최단 경로'로 갱신
        res[i][j] = res[i][k] // 먼저 들러야하는 지점인 (i, k)의 값으로 갱신
      }
    }
  }
}

// 출력
for i in 1...n {
  for j in 1...n {
    if res[i][j] == INF {
      print("-", terminator: " ")
    } else {
      print(res[i][j], terminator: " ")
    }
  }
  print()
}
