/*
 *  최소비용 구하기.swift
 *  Question Link: https://www.acmicpc.net/problem/1916
 *  Primary idea:   최단 거리
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let n = Int(readLine()!)! // 도시의 갯수(노드)
let m = Int(readLine()!)! // 버스의 갯수(간선)
let INF = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
var dist = [Int](repeating: INF, count: n + 1) // 가중치

// 도시들 간의 거리 입력받기
for _ in 0..<m {
  let line = readLine()!.split(separator: " ")
  let v1 = Int(line[0])!
  let v2 = Int(line[1])!
  let cost = Int(line[2])!
  
  graph[v1][v2] = min(graph[v1][v2], cost)
}

// 구하고자 하는 경로
let str2 = readLine()!.split(separator: " ")
let start = Int(str2[0])!
let end = Int(str2[1])!

// 첫번째 위치 queue에 추가
var queue = [start]
dist[start] = 0

while (!queue.isEmpty) {
  let from = queue.removeFirst()
  
  // neighbor 전부 확인
  for i in 1...n {
    let cost = dist[from] + graph[from][i]
    
    // 최소 경로일 경우,
    if dist[i] > cost {
      dist[i] = cost
      queue.append(i)
    }
  }
}

print(dist[end])
