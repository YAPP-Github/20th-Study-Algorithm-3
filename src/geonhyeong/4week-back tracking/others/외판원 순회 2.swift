/*
 *  외판원 순회 2.swift
 *  Question Link: https://www.acmicpc.net/problem/10971
 *  Primary idea:   backTracking
 *                   1. 순열
 *                   2. depth == n && 시작 지점 == 끝나는 지점
 *
 *  Time Complexity : O(n^2)
 *  Space Complexity : O()
 *  Runtime: 20 ms
 *  Memory Usage: 80.040 MB
*/

import Foundation

let n = Int(readLine()!)!
var isVisited = [Bool](repeating: false, count: n)
var board = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map{Int($0)!}
    board.append(row)
}

var minCost = Int.max

func dfs(_ depth: Int, _ pre: Int, _ cost: Int) {
    if depth == n && pre == 0 {
        minCost = min(minCost, cost)
        return
    }


    for i in 0..<n {
        if !isVisited[i] && board[pre][i] > 0 {
            isVisited[i] = true
            dfs(depth+1, i, cost + board[pre][i])
            isVisited[i] = false
        }
    }
}

dfs(0, 0, 0)
print(minCost)
