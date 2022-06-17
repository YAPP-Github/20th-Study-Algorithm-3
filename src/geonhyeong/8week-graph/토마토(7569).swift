/*
 *  토마토(7569).swift
 *  Question Link: https://www.acmicpc.net/problem/7569
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
let m = info[0], n = info[1], h = info[2]

var arr = [[[Int]]]()
var queue = [(Int, Int, Int)]()


for _ in 0..<h {
  var values: [[Int]] = []
  for _ in 0..<n {
    values.append(readLine()!.split(separator: " ").map{Int($0)!})
  }
  arr.append(values)
}

// 1을 찾아 저장
for i in 0..<h {
  for j in 0..<n {
    for k in 0..<m {
      if arr[i][j][k] == 1 {
        queue.append((i, j, k))
      }
    }
  }
}

let dx: [Int] = [1, -1, 0, 0, 0, 0]
let dy: [Int] = [0, 0, 1, -1, 0, 0]
let dz: [Int] = [0, 0, 0, 0, 1, -1]


var maxValue = 0
var queueIndex = 0 // 시간복잡도 개선을 위해서 사용

while queue.count > queueIndex {
  let z = queue[queueIndex].0
  let x = queue[queueIndex].1
  let y = queue[queueIndex].2

  queueIndex += 1
  
  for i in 0..<6 {
    // 이동 가능한 좌표 계산
    let nx = x + dx[i]
    let ny = y + dy[i]
    let nz = z + dz[i]
    
    // out of index
    if nz >= 0 && nz < h && nx >= 0 && nx < n && ny >= 0 && ny < m {
      if arr[nz][nx][ny] == 0 { // 익지 않은 토마토
        queue.append((nz, nx, ny))
        arr[nz][nx][ny] = arr[z][x][y] + 1
      }
    }
  }
}


let flatvisited = arr.flatMap{ $0 }.flatMap{ $0 } // 3차원을 1차원으로
maxValue = flatvisited.max()!

if flatvisited.contains(0) { // bfs로 다 찾아봤는데 토마토를 익히지 못했다면 -1 출력
  print("-1")
} else if maxValue == 1 {
  print("0")
} else {
  print(maxValue - 1) // 처음 시작을 1로 표현했으니 1을 빼주기
}
