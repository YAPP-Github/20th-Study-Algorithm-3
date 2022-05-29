/*
 *  구간 나누기 2.swift
 *  Question Link: https://www.acmicpc.net/problem/13397
 *  Primary idea:   이분 탐색
 *                   1. mid = 구간 점수(각 구간의 최대-최소)의 최댓값
 *
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime: 16 ms
 *  Memory Usage: 79.968 MB
*/

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let m = info[1]

let numbers = readLine()!.split(separator: " ").map{Int($0)!}
var minValue = 0

var left = 0
var right = numbers.max()!
var res = right

while left <= right {
    let mid = (left + right) / 2 // mid를 구간 점수(각 구간의 최대-최소)
    
    if isValid(mid) {
        right = mid - 1
        res = min(res, mid) // 최솟값 저장
    } else {
        left = mid + 1
    }
}

print(res)

func isValid(_ mid: Int) -> Bool {
    var cnt = 1 // 구간의 갯수
    var minValue = numbers[0]
    var maxValue = numbers[0]
    
    for num in numbers {
        if num < minValue { minValue = num }
        if num > maxValue { maxValue = num }
        
        if (maxValue - minValue) > mid { // 구간점수의 최대값 mid 보다 큰 겸우
            cnt += 1
            // 구간 초기화
            minValue = num
            maxValue = num
        }
    }
    
    return cnt <= m
}

