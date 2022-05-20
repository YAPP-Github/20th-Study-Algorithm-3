/*
*  N과 M (9).swift
*  Question Link: https://www.acmicpc.net/problem/15663
*  Primary idea:   backTracking
*                   1. 
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 56 ms
*  Memory Usage: 80.316 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var isVisited = [Bool](repeating: false, count: n + 1)
var res = Set<String>()

func dfs(_ depth: Int, _ str: String) {
    if depth == m {
        if !res.contains(str) {
            res.insert(str)
            print(str)
        }

        return
    }
    
    for i in 0..<n {
        if !isVisited[i] {
            isVisited[i] = true
            dfs(depth+1, "\(str)\(list[i]) ")
            isVisited[i] = false
        }
    }
}

dfs(0, "")
