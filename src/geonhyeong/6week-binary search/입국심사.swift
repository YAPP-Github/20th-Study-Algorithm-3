/*
 *  입국심사.swift
 *  Question Link: https://www.acmicpc.net/problem/3079
 *  Primary idea:   이분 탐색
 *                   1. mid : M명을 심사하는데 걸리는 시간
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime: 128 ms
 *  Memory Usage: 80.300 MB
*/
import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]
var timeList = [Int](repeating: 0, count: n)

// 입략
for i in 0..<n {
    timeList[i] = Int(readLine()!)!
}

var left = 0
var right = timeList.max()! * m
var res = Int.max()

while left <= right {
    let mid = (left + right) / 2 // M명을 심사하는데 걸리는 시간
    var people = 0
    
    for time in timeList {
        people += mid / time
    }
    
    if people >= m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left)
