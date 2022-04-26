/*
*  단어 뒤집기 2.swift
*  Question Link: https://www.acmicpc.net/problem/17413
*  Primary idea:   <문자열>
*                   1. Flag를 이용해서 Tag가 시작되는지를 판별
*                   2. 정상 출력(Falg == True)일때,
                        1) 결과값(res)에 그대로 붙임
                        2) '>'일떄(Tag가 끝), Flag = False
*                   3. 뒤집어 출력(Flag == False)일때,
*                   4.  1) '<'일때(Tag가 시작)
                            a) Falg = True
                            b) 모아놓은 단어(word)와 '<'를 붙인 후
                            c) word 초기화
                        2) ' '(공백)일때,
                            a) 모아놓은 단어(word)와 ' '를 붙인 후
                            c) word 초기화
                        3) word의 앞에 붙여서 reverse된 단어(word)를 모으기
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

let str = String(readLine()!)

var res = ""        // 결과
var flag = false    // Tag의 단어인지 판별, True = tag시작
var word = ""       // 단어

for c in str {
    
    // 정상출력
    if flag {
        res += c.description
        if c == ">" {
            flag = false
        }
    } else { // 뒤집어 출력
        if c == "<" {
            flag = true
            res += word + "<"
            word = ""
        } else if c == " " {
            res += word + " "
            word = ""
        } else {
            word = c.description + word
        }
    }
}

print(res + word)
