/*
 *  신규 아이디 추천.swift
 *  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/72410
 *  Primary idea:   구현
 *
 *  시간 : 16분 28초
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
 */

import Foundation

extension Character {
    var isValid: Bool {
        return (self.isNumber || self.isLetter
        || self == "-" || self == "_" || self == ".")
    }
}

func solution(_ new_id:String) -> String {
    var myId: String = new_id
    
    // 1단계
    myId = myId.lowercased()
    
    // 2단계
    myId = myId.filter {$0.isValid}
    
    // 3단계
    while myId.contains("..") {
        myId = myId.replacingOccurrences(of: "..", with: ".")
    }
    
    // 4단계
    if myId.first == "." {
        myId.removeFirst()
    }
    
    if myId.last == "." {
        myId.removeLast()
    }
    
    // 5단계
    if myId.count == 0 {
        myId = "a"
    }
    
    // 6단계
    if myId.count >= 16 {
        let i = myId.index(myId.startIndex, offsetBy: 15)
        myId = String(myId[myId.startIndex..<i])
        if myId.last == "." {
            myId.removeLast()
        }
    }
    
    // 7단계
    if myId.count <= 2 {
        while myId.count < 3 {
            myId = myId + String(myId.last!)
        }
    }
    
    return myId
}
