/*
 *  징검다리 건너기 (Large).swift
 *  Question Link: https://www.acmicpc.net/problem/22871
 *  Primary idea:   이분 탐색
 *                   1.
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime: 532 ms
 *  Memory Usage: 80.016 MB
*/

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
arr.insert(0, at: 0)

var start = 0
var end = 1_000_000

while start <= end {
    let mid = (start + end) / 2
    var visited = [Bool](repeating: false, count: n+1)
    visited[1] = true
    
    for i in 1...n {
        if visited[n] { break } // 마지막 도달
        if visited[i] {
            for j in i+1...n {
                let power = (j-i) * (1 + abs(arr[j] - arr[i]))
                if power < mid {
                    visited[j] = true
                }
            }
        }
    }
    
    if visited[n] { // 징검다리 도착 -> mid 값 작아지도록
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(end)
