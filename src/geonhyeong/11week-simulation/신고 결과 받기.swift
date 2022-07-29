/*
 *  신고 결과 받기.swift
 *  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/92334
 *  Primary idea:   구현
 *                   1.
 *  시간 : 20분 3초
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var dic = [String:Int]() // 아이디별 신고 누적 횟수
    var dic2 = [String:[String]]() // 유저별 신고한 ID
    var answer = [Int](repeating: 0, count: id_list.count)
    
    // 유저별 신고한 ID 초기화
    for id in id_list {
        dic2[id] = []
    }
    
    for r in report {
        let info = r.split(separator: " ").map{String($0)}
        let reporter = info[0]
        let reported = info[1]
        
        if !dic2[reporter]!.contains(reported) { // 중복 방지
            dic[reported, default: 0] += 1
            dic2[reporter, default: []].append(reported)
        }
    }

    let suspended = dic.filter{$0.value >= k}.keys
    for (i, id) in id_list.enumerated() {
        answer[i] = dic2[id]!.filter{suspended.contains($0)}.count
    }
    
    return answer
}
