/*
 *  키패드 누르기.swift
 *  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/67256
 *  Primary idea:   구현
 *                   1.
 *
 *  시간 : 36분 57초
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

let phoneNumber = [
    "1":(0, 0),"2":(0, 1),"3":(0, 2),
    "4":(1, 0),"5":(1, 1),"6":(1, 2),
    "7":(2, 0),"8":(2, 1),"9":(2, 2),
    "*":(3, 0),"0":(3, 1),"#":(3, 2)
]

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var left = "*"
    var right = "#"
    let hand = hand == "right" ? "R" : "L"
    
    for number in numbers {
        if [1,4,7].contains(number) {
            answer += "L"
            left = String(number)
        } else if [2,5,8,0].contains(number) {
            let distByLeft = dist(left, String(number))
            let distByRight = dist(right, String(number))
            
            // 거리 계산
            if distByLeft < distByRight {
                answer += "L"
                left = String(number)
            } else if distByLeft > distByRight {
                answer += "R"
                right = String(number)
            } else if distByLeft == distByRight {
                answer += hand
                if hand == "L" {
                    left = String(number)
                } else if hand == "R" {
                    right = String(number)
                }
            }

        } else if [3,6,9].contains(number) {
            answer += "R"
            right = String(number)
        }
    }
    
    return answer
}

func dist(_ start: String, _ dest: String) -> Int {
    let x = phoneNumber[start]!.0
    let y = phoneNumber[start]!.1

    let xx = phoneNumber[dest]!.0
    let yy = phoneNumber[dest]!.1
    
    return abs(x-xx) + abs(y-yy)
}
