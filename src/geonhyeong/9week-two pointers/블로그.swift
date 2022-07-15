/*
 *  블로그.swift
 *  Question Link: https://www.acmicpc.net/problem/21921
 *  Primary idea:   투 포인터
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let numVisitors = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0] // 전체 일수
let x = input[1] // 기준 일수

var left = 0
var right = x
var maxVisit = 0 // 최대 방문자 수
var day = 1 // 기간이 몇개 있는지
var curVisit = 0

for i in 0..<x { // 처음 기간내 방문자 수
  curVisit += numVisitors[i] // 누적
}

maxVisit = max(maxVisit, curVisit)

while right < numVisitors.count {
  curVisit = curVisit - numVisitors[left] + numVisitors[right] // 현재 방문자 수 - 이전의 하루 방문자 + 다음 하루 방문자
  left += 1
  right += 1
  
  if curVisit > maxVisit {
    maxVisit = curVisit
    day = 1
  } else if curVisit == maxVisit {
    day += 1
  }
}

if maxVisit == 0 {
    print("SAD")
} else {
    print("\(maxVisit)\n\(day)")
}
