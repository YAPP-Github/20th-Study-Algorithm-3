/*
*  후위 표기식.swift
*  Question Link: https://www.acmicpc.net/problem/1918
*  Primary idea:   자료구조, 스택
*                   1. ( : 여는 괄호는 그 앞에 어떤 연산자가 있어도 그 뒤에 연산자부터 계산이 이루어지기 때문에, 어떠한 처리없이 스택에 추가해준다.
*                   2. ) : 닫는 괄호는 여는 괄호와 그 사이에 있는 모든 연산을 처리해주고, 마지막에 여는 괄호를 pop 해준다.
*                   3. / : 곱하기와 나누기는 그 전의 연산자(스택의 맨위)가 곱하기와 나누기일 때, 그 연산자를 처리해주고, 그 후에 곱하기와 나누기를 스택의 맨 위에 추가해준다.
*                   4. + - : 더하기와 빼기는 그 전의 연산자(스택의 맨위)가 여는 괄호일 때만 바로 처리해주고, 그렇지 않으면 그냥 스택의 맨위에 추가해준다.
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

let str = readLine()!
var stack = [Character]()
var res = [Character]()

for c in str {
    if c.isUppercase { // 대문자일 경우,
        res.append(c)
    } else { // 연산자일 경우, +-*/()
        if c == "(" {
            stack.append(c)
        } else if c == ")" {
            while !stack.isEmpty && stack.last! != "(" { // '(' 만날때까지
                res.append(stack.removeLast())
            }
            stack.removeLast() // stack에 쌓여있는 '(' 제거
        } else if c == "*" || c == "/"{
            while !stack.isEmpty && (stack.last! == "*" || stack.last! == "/") { // '*' or '/'일떄까지
                res.append(stack.removeLast())
            }
            stack.append(c)
        } else if c == "+" || c == "-" {
            while !stack.isEmpty && stack.last! != "(" { // '(' 만날때까지
                res.append(stack.removeLast())
            }
            stack.append(c)
        }
    }
}

while !stack.isEmpty {
    res.append(stack.removeLast())
}

print(String(res))
