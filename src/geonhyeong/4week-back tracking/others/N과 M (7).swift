/*
*  N과 M (7).swift
*  Question Link: https://www.acmicpc.net/problem/15656
*  Primary idea:   backTracking
*                   1. 
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 906 ms
*  Memory Usage: 79.516 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()

func dfs(_ depth: Int, _ str: String) {
    if depth == m {
        print(str)
        
        return
    }
    
    for i in 0..<n {
        dfs(depth+1, "\(str)\(list[i]) ")
    }
}

dfs(0, "")
