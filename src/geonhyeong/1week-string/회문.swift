/*
*  회문.swift
*  Question Link: https://www.acmicpc.net/problem/17609
*  Primary idea:   <문자열, 투 포인터>
*                   1.
*
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

for _ in 0..<Int(readLine()!)! {
    let str = Array(readLine()!)
    
    func isPalindrome(_ left: Int, _ right: Int, _ cnt: Int) -> Int {
        if left < right {
            if str[left] == str[right] {
                return isPalindrome(left+1, right-1, cnt)
            } else {
                if cnt == 0 {
                    let newStr1 = isPalindrome(left, right-1, 1)
                    let newStr2 = isPalindrome(left+1, right, 1)
                    
                    if newStr1 == 0 || newStr2 == 0 {
                        return 1
                    } else {
                        return 2
                    }
                } else {
                    return 2
                }
            }
        }
        return 0
    }
    
    print(isPalindrome(0, str.count-1, 0))
}

