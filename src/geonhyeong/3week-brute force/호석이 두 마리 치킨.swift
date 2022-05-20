/*
*  호석이 두 마리 치킨.swift
*  Question Link: https://www.acmicpc.net/problem/21278
*  Primary idea:   완전 탐색
*                   1.
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime: 320 ms
*  Memory Usage: 98.34 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]

var map = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)

// 저장 - 양방향
for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map{Int($0)!}
    map[data[0]][data[1]] = 1
    map[data[1]][data[0]] = 1
}

// 왕복 최소 시간
for k in 1...n { // k는 전체 건물을 선회
    for i in 1...n {
        for j in 1...n {
            if i == j { map[i][j] = 0 }
            if map[i][k] == Int.max || map[k][j] == Int.max { continue }
            map[i][j] = min(map[i][j], map[i][k] + map[k][j])
        }
    }
}

var x = Int.max, y = Int.max, dist = Int.max
for i in 1...n-1 {
    for j in i+1...n {
        let minDistance = sumMinTime(map, i, j) // 누적 최소 거리 구하기
        
        if dist > minDistance {
            x = i
            y = j
            dist = minDistance
        }
    }
}

print("\(x) \(y) \(dist*2)")

// 누적 최소 거리
func sumMinTime(_ map: [[Int]], _ x: Int, _ y: Int) -> Int {
    var distance = 0
    
    for i in 1...n {
        distance += min(map[x][i], map[i][y])
    }
    
    return distance
}

// 출력
func printArr(_ map: [[Int]]) {
    for i in 0..<map.count {
        print(map[i])
    }
}
