/*
 *  토마토(7576).swift
 *  Question Link: https://www.acmicpc.net/problem/7576
 *  Primary idea:   그래프 탐색
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map { Int($0)! }
let m = info[0], n = info[1]

var arr = [[Int]]()
var queue = [(Int, Int)]()

for i in 0..<n {
  let values = readLine()!.split(separator: " ").map { Int($0)! }
  queue.append(contentsOf: values.enumerated().filter({ 1 == $0.element }).map{ (i, $0.offset) }) // 값이 1인 index
  arr.append(values)
}
//print(queue) // [(3, 5)]
//print(arr)

// 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var maxValue = 0
var queueIndex = 0 // 시간복잡도 개선을 위해서 사용

while queue.count > queueIndex {
  let x = queue[queueIndex].0
  let y = queue[queueIndex].1
//  print(queue)
  queueIndex += 1
  
  for i in 0..<4 {
    // 이동 가능한 좌표 계산
    let nx = x + dx[i]
    let ny = y + dy[i]
    
    // out of index
    if nx >= 0 && ny >= 0 && nx < n && ny < m {
      if arr[nx][ny] == 0 { // 익지 않은 토마토
        queue.append((nx, ny))
        arr[nx][ny] = arr[x][y] + 1 // 총 이동거리 계산
      }
    }
  }
}

let flatvisited = arr.flatMap { $0 } // 2차원을 1차원으로
maxValue = flatvisited.max()!

if flatvisited.contains(0) { // bfs로 다 찾아봤는데 토마토를 익히지 못했다면 -1 출력
  print("-1")
} else if maxValue == 1 {
  print("0")
} else {
  print(maxValue - 1) // 처음 시작을 1로 표현했으니 1을 빼주기
}
