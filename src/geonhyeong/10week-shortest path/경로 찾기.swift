/*
 *  최단 경로.swift
 *  Question Link: https://www.acmicpc.net/problem/11403
 *  Primary idea:   경로 찾기
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [0], count: n)
var v = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n{
  let line = readLine()!.split(separator: " ").map{ Int($0)! }
  graph[i] = line
}

// 플로이드-워셜 알고리즘
for k in 0..<n {
  for i in 0..<n {
    for j in 0..<n {
      if graph[i][k] == 1 && graph[k][j] == 1 {
        graph[i][j] = 1
      }
    }
  }
}

for i in 0..<graph.count{
  var str = ""
  for j in 0..<graph[0].count{
    str += "\(graph[i][j]) "
  }
  print(str)
}
