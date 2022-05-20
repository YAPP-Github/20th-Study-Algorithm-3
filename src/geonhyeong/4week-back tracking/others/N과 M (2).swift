/*
*  N과 M (2).swift
*  Question Link: https://www.acmicpc.net/problem/15650
*  Primary idea:   backTracking
*                   1. dfs
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 32 ms
*  Memory Usage: 69.108 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
var isVisited = [Bool](repeating: false, count: n+1)

func dfs(_ i: Int, _ str: [Int]) {
    if i == m {
        if str.sorted() == str {
            print(str.map{String($0)}.joined(separator: " "))
            return
        } else {
            return
        }
    }
    
    
    for j in 1...n {
        if !isVisited[j] {
            isVisited[j] = true
            dfs(i+1, str + [j])
            isVisited[j] = false
        }
        
    }
}

dfs(0, [])
