/*
*  N과 M (4).swift
*  Question Link: https://www.acmicpc.net/problem/15652
*  Primary idea:   backTracking
*                   1. 
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 28 ms
*  Memory Usage: 79.844 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
var res = ""

func dfs(_ depth: Int, _ str: [Int]) {
    if depth == m {
        res += str.map{String($0)}.joined(separator: " ")
        res += "\n"
        return
    }
    
    for i in 1...n {
        if let last = str.last { // 비 내림차순
            if i < last {
                continue
            }
        }
        
        dfs(depth+1, str + [i])
    }
}

dfs(0, [])
print(res)
