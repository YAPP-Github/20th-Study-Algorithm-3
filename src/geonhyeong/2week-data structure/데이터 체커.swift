/*
*  데이터 체커.swift
*  Question Link: https://www.acmicpc.net/problem/22942
*  Primary idea:   자료구조, 스택
*                   1. x-r, x+r값을 저장
                        1-1. [x-r or x+r, 시작인지 끝인지, 원의 번호]
                    2. x축값의 거리순으로 정렬
                    3. 원의 시작(1)이면 stack에 '원의 번호' 저장
                    4. 원의 시작이 아니(0)라면 stack의 top과 같은지 비교후,
                        4-1. 같으면 pop() = removeLast()
                        4-2. 다르면 "NO"
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime: 320 ms
*  Memory Usage: 98.34 MB
*/

import Foundation

let n = Int(readLine()!)!
var circle = [(Int, Bool, Int)]()
var stack = [Int]()
var breakFlag = false

// input
for i in 0..<n {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x = info[0]
    let r = info[1]
    circle.append((x-r, true, i)) // # 시작 x값, 시작 flag, 원의 번호
    circle.append((x+r, false, i)) // 끝 x값, 끝 flag, 원의 번호
}

// sort
circle.sort{$0.0 < $1.0}

// 계산
for i in 0..<circle.count {
    if circle[i].1 { // 원의 시작
        stack.append(circle[i].2)
    } else if circle[i].2 == stack.last! {
        stack.removeLast()
    } else {
        breakFlag = true
        break
    }
}

if breakFlag {
    print("NO")
} else {
    print("YES")
}
