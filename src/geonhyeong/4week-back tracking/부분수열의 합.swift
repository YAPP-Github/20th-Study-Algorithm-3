/*
 *  부분수열의 합.swift
 *  Question Link: https://www.acmicpc.net/problem/1182
 *  Primary idea:   backTracking
 *                   1. depth가 마지막을 가리키면 반환
 *                   2. depth 부터 for문 시작
 *
 *  Time Complexity : O(n^2)
 *  Space Complexity : O()
 *  Runtime: 20 ms
 *  Memory Usage: 80.040 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let s = info[1]
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var cnt = 0

func dfs(_ depth: Int, _ sum: Int) {
    if depth == n+1 {
        return
    }
    
    if depth > 0 && sum == s {
        cnt += 1
    }
    
    for i in depth..<n {
        dfs(i + 1, sum + list[i])
    }
}

dfs(0, 0, [])
print(cnt)
