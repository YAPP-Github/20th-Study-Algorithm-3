/*
 *  불!.swift
 *  Question Link: https://www.acmicpc.net/problem/4179
 *  Primary idea:   그래프 탐색
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = info[0], c = info[1]

var board = [[Character]]()
var dist1 = Array(repeating: Array(repeating: -1, count: c), count: r)
var dist2 = Array(repeating: Array(repeating: -1, count: c), count: r)

var queueF = [(Int, Int)]()
var queueJ = [(Int, Int)]()

// 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<r {
  let b = readLine()!.map { $0 }
  board.append(b)
  for j in 0..<c {
    if board[i][j] == "F" {
      dist1[i][j] = 0
      queueF.append((i, j))
    } else if board[i][j] == "J" {
      dist2[i][j] = 0
      queueJ.append((i, j))
    }
  }
}

var queueIndex = 0 // 시간복잡도 개선을 위해서 사용

// fire dist 계산
while queueF.count > queueIndex {
  let x = queueF[queueIndex].0
  let y = queueF[queueIndex].1

  queueIndex += 1
  
  for i in 0..<4 {
    // 이동 가능한 좌표 계산
    let nx = x + dx[i]
    let ny = y + dy[i]

    // out of index
    if nx < 0 || nx >= r || ny < 0 || ny >= c {
      continue
    }
    
    // 방문했는지, 유효 칸 검사
    if dist1[nx][ny] != -1 || board[nx][ny] == "#" {
      continue
    }
    
    dist1[nx][ny] = dist1[x][y] + 1 // 방문 표시 & 거리계산
    queueF.append((nx, ny))
  }
}

//print(dist1)
//[-1, -1, -1, -1]
//[-1,  1,  0, -1]
//[-1,  2,  1, -1]
//[-1,  3,  2, -1]

// 지훈이 bfs
queueIndex = 0
while  queueJ.count > queueIndex {
  let x = queueJ[queueIndex].0
  let y = queueJ[queueIndex].1

  queueIndex += 1
  
  for i in 0..<4 {
    // 이동 가능한 좌표 계산
    let nx = x + dx[i]
    let ny = y + dy[i]

    // out of index
    if nx < 0 || nx >= r || ny < 0 || ny >= c {
      // 범위를 벗어났다는 것 == 탈출에 성공했다는 것
      print(dist2[x][y] + 1) // 최초 탈출 시간 출력
      exit(0)
    }
    
    // 방문했는지, 유효 칸 검사
    if dist2[nx][ny] >= 0 || board[nx][ny] == "#" {
      continue
    }
    
    // 불에 타죽는지 검사 !!!!!!!
    if dist1[nx][ny] != -1 && dist1[nx][ny] <= dist2[x][y] + 1 {
      continue
    }
    
    dist2[nx][ny] = dist2[x][y] + 1 // 방문 표시 & 거리계산
    queueJ.append((nx, ny))
  }
}

print("IMPOSSIBLE") // 여기까지 온거면 탈출 못했다는거니까
