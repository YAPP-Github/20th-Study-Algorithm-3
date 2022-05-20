/*
*  N과 M (3).swift
*  Question Link: https://www.acmicpc.net/problem/15651
*  Primary idea:   backTracking
*                   1. dfs
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 952 ms
*  Memory Usage: 111.008 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
var res = ""

func dfs(_ i: Int, _ str: [Int]) {
    if i == m {
        res += str.map{String($0)}.joined(separator: " ")
        res += "\n"
        return
    }
    
    
    for j in 1...n {
        dfs(i+1, str + [j])
    }
}

dfs(0, [])
print(res)
