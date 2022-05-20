/*
 *  죽음의 비.swift
 *  Question Link: https://www.acmicpc.net/problem/22944
 *  Primary idea:   backTracking
 *                   1. 
 *
 *  Time Complexity : O(n^2)
 *  Space Complexity : O()
 *  Runtime: 36 ms
 *  Memory Usage: 83.568 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0] // 한변의 길이
let h = info[1] // 현재 체력
let d = info[2] // 우산의 내구도

// 초기화
var board = [[Character]](repeating: [Character](), count: n)
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//let dx = [-1, 0, 1, 0]          // 서,남,동,북
//let dy = [0, -1, 0 ,1]
var curX = -1, curY = -1        // 현재 위치
var safeX = -1, safeY = -1      // 안전지대 위치
var umbrella = [(Int, Int)]()   // 우산의 위치

// 입력
for i in 0..<n {
    let row = readLine()!
    
    for (j, c) in row.enumerated() {
        board[i].append(c)
        
        if c == "S" { // 현재 위치 저장
            curX = i
            curY = j
        } else if c == "E" { // 안전 지대 저장
            safeX = i
            safeY = j
        } else if c == "U" { // 우산의 위치
            umbrella.append((i, j))
        }
    }
}

var res = Int.max

func backTracking(_ x: Int, _ y: Int, _ health: Int, _ durability: Int, _ cnt: Int) {
    let distance = abs(safeX - x) + abs(safeY - y) // 마지막 까지와의 거리 계산
    
    // 남은 거리 <= 현재 체력 + 내구도
    if distance <= health + durability {
        res = min(res, distance + cnt)
        return
    }
    
    for u in umbrella {
        let ux = u.0
        let uy = u.1
        
        if isVisited[ux][uy] { continue } // 방문한 적이 있는 우산인지
        
        let distance2 = abs(ux - x) + abs(uy - y) // 현재 위치와 우산의 거리
        
        if distance2 - 1 < health + durability { // 현재 위치와 우산 사이의 빈공간을 고려
            isVisited[ux][uy] = true
            
            if distance2 <= durability { // 우산 내구도 체크
                backTracking(ux, uy, health, d, cnt + distance2)
            } else {
                backTracking(ux, uy, health - (distance2 - durability), d, cnt + distance2)
            }
            
            isVisited[ux][uy] = false
        }
    }
}

backTracking(curX, curY, h, 0, 0)
print(res == Int.max ? -1 : res)
