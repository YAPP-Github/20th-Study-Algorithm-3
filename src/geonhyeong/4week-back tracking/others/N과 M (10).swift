/*
*  N과 M (10).swift
*  Question Link: https://www.acmicpc.net/problem/15664
*  Primary idea:   backTracking
*                   1. 
*
*  Time Complexity : O(n^2)
*  Space Complexity : O()
*  Runtime: 12 ms
*  Memory Usage: 79.524 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var isVisited = [Bool](repeating: false, count: n + 1)
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
        if let last = str.last {
            if list[i] < last {
                continue
            }
        }
        
        if !isVisited[i] {
            isVisited[i] = true
            dfs(depth+1, str + [list[i]])
            isVisited[i] = false
        }
    }
}

dfs(0, [])
