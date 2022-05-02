/*
*  탑.swift
*  Question Link: https://www.acmicpc.net/problem/2493
*  Primary idea:   자료구조, 스택
*                   1.
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

let n = Int(readLine()!)!
let tower = readLine()!.split(separator: " ").map{Int($0)!}
var stack = [(Int, Int)]()
var res = [Int](repeating: 0, count: n)

for i in 0..<n {
    while !stack.isEmpty {
        if stack.last!.0 <= tower[i] {
            stack.removeLast()
        } else {
            res[i] = stack.last!.1 + 1
            break
        }
    }
    stack.append((tower[i], i)) // 높이, index
}

var answer = ""
for r in res {
    answer += String("\(r) ")
}

print(answer)

