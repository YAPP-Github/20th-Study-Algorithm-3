/*
*  N과 M (6).swift
*  Question Link: https://www.acmicpc.net/problem/15655
*  Primary idea:   backTracking
*                   1. 
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 86 ms
*  Memory Usage: 79.520 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
var isVisited = [Bool](repeating: false, count: n+1)
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var res = ""

func dfs(_ depth: Int, _ str: [Int]) {
    if depth == m {
        if str.sorted() == str {
            res += str.map{String($0)}.joined(separator: " ")
            res += "\n"
        }
        return
    }
    
    for i in 0..<n {
        if !isVisited[i] {
            isVisited[i] = true
            dfs(depth+1, str + [list[i]])
            isVisited[i] = false
        }
    }
}

dfs(0, [])
print(res)
