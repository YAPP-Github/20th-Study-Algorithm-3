/*
*  N과 M (11).swift
*  Question Link: https://www.acmicpc.net/problem/15665
*  Primary idea:   backTracking
*                   1. 
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 712 ms
*  Memory Usage: 109.940 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var res = Set<[Int]>()

func dfs(_ depth: Int, _ str: [Int]) {
    if depth == m {
        if !res.contains(str) {
            res.insert(str)
            print(str.map{String($0)}.joined(separator: " "))
        }

        return
    }
    
    for i in 0..<n {
        dfs(depth+1, str + [list[i]])
    }
}

dfs(0, [])
