/*
 *  무기 공학.swift
 *  Question Link: https://www.acmicpc.net/problem/18430
 *  Primary idea:   backTracking
 *                   1.
 *
 *  Time Complexity : O(n^m)
 *  Space Complexity : O()
 *  Runtime: 148 ms
 *  Memory Usage: 79.516 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]

var board = [[Int]]()
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let dx = [1, 1, -1, -1] // wing1, wing2 날개의 위치
let dy = [1, -1, -1, 1]

// 입력
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map{Int($0)!}
    board.append(row)
}

// out of Index
func outOfIndex(_ x: Int, _ y: Int) -> Bool {
    return x < 0 || x >= n || y < 0 || y >= m
}

// power 계산
func calPower(_ x: Int, _ y: Int, _ wing1: Int, _ wing2: Int) -> Int {
    var power = board[x][y] * 2 // 중심은 2배
    power += board[wing1][y]
    power += board[x][wing2]
    
    return power
}

func backTracking(_ i: Int) -> Int {
    var maxPower = 0
    
    for x in 0..<n {
        for y in i..<m { // i에서 시작
            if isVisited[x][y] || outOfIndex(x, y) { continue }
            
            for dir in 0..<4 { // 4개의 방향으로 check
                let wing1 = x + dx[dir]
                let wing2 = y + dy[dir]
                
                if outOfIndex(wing1, y) || outOfIndex(x, wing2) { continue }
                if isVisited[wing1][y] || isVisited[x][wing2] { continue }
                
                isVisited[x][y] = true
                isVisited[wing1][y] = true
                isVisited[x][wing2] = true
                
                maxPower = max(maxPower, backTracking(y) + calPower(x, y, wing1, wing2))
                
                isVisited[x][y] = false
                isVisited[wing1][y] = false
                isVisited[x][wing2] = false
             }
        }
    }
    
    return maxPower
}

print(backTracking(0))
