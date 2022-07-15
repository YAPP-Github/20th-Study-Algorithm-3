/*
 *  ㅋㅋ루ㅋㅋ.swift
 *  Question Link: https://www.acmicpc.net/problem/20442
 *  Primary idea:   투 포인터
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
 */

let str = readLine()!  // 문자열
let arr = Array(str)

// 갯수 체크
var rCount = arr.filter{$0 == "R"}.count // r의 갯수

// 투 포인터 변수 선언
var kCount = 0
var (start, end) = (0, arr.count - 1)
var res = rCount

while start < end {
  // 양 옆에서 k를 찾을 때까지 이동
  while arr[start] != "K" { // R일 경우
    start += 1
    rCount -= 1
  }
  while arr[end] != "K" { // R일 경우
    end -= 1
    rCount -= 1
  }
  
  // 탈출
  if rCount == 0 { break }
  
  // k를 선택하고 문자열 내부에 r 갯수로 값 갱신
  if start < end {
    kCount += 2 // 양 옆
    res = max(res, kCount + rCount) // 최대 길이 저장
    start += 1
    end -= 1
  }
}

print(res)
