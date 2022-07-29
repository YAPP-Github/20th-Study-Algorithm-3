/*
 *  숫자 문자열과 영단어.swift
 *  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/81301
 *  Primary idea:   구현
 *                   1.
 *  시간 : 40분 59초
 *  Time Complexity : O()
 *  Space Complexity : O()
 *  Runtime:  ms
 *  Memory Usage:  MB
*/

import Foundation

func solution(_ s:String) -> Int {
  let replace: [String:String] = [
    "zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5",
    "six":"6", "seven":"7", "eight":"8", "nine":"9"
  ]
  
  var answer = ""
  let len = s.count
  let arrS = Array(s)
  var i = -1
  
  while i < len - 1 {
    i += 1
    
    if arrS[i].isLetter { // 문자일 경우
      var word = ""
      var j = i
      
      while j < len {
        j += 1
        if replace.keys.contains(String(arrS[i...j])) {
          word = String(arrS[i...j])
          break
        }
      }
      answer += replace[word]!
      i = j
    } else { // 숫자일 경우
      answer += String(arrS[i])
    }
  }
  return Int(answer)!
}
