/*
 *  효율적인 해킹.swift
 *  Question Link: https://www.acmicpc.net/problem/1325
 *  Primary idea:   그래프 탐색
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]

// 2차원 배열 생성
var arr = [[Int]](repeating: [Int](), count: n+1)

// 입력
for _ in 0..<m {
  let AB = readLine()!.split(separator: " ").map{Int($0)!}
  let A = AB[0]
  let B = AB[1]
  // A가 B를 신뢰한다 -> B를 해킹하면 A도 해킹가능
  arr[B].append(A)
}
//print(arr) // [[], [3], [3], [4, 5], [], []]

// 단방향이기 때문에, 모든 정점을 다 검사
func bfs(start: Int, N: Int) -> Int {
  var visited: [Bool] = [Bool](repeating: false, count: N + 1)
  var stack: [Int] = []

  visited[start] = true
  stack.append(start)

  var count: Int = 0 // 해킹 가능한 컴퓨터 수
  
  while !stack.isEmpty {
    count += 1 // 신뢰받는 컴퓨터가 있으면, count += 1
    let pop = stack.popLast()!
    
    for related in arr[pop] {
      if !visited[related] { // 방문한적이 없으면
        visited[related] = true
        stack.append(related)
      }
    }
  }
  
  return count
}

// 해킹 가능한 최대 컴퓨터 수 구하기
var maxHack = -1
var counts: [Int] = []
for i in 1...n { // 컴퓨터는 1번부터 시작
  let count = bfs(start: i, N: n)
  maxHack = max(maxHack, count)
  counts.append(count)
}


var res = ""
// maxHack에 해당하는 컴퓨터 번호 모두 출력
for i in 0..<n {
  if counts[i] == maxHack {
    res += "\(i+1) "
  }
}

print(res)
