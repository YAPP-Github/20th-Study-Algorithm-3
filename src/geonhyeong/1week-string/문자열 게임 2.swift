/*
*  문자열 게임2.swift
*  Question Link: https://www.acmicpc.net/problem/20437
*  Primary idea:   <문자열, 슬라이딩 윈도우>
*                   1. Dictionary(windowList) 이용
                       1) key : 알파벳
                       2) value : 알파벳 갯수
                    2. 풀이
                       1) K == 1일 경우, "1, 1" 출력
                       2) cnt >= K : 알파벳의 갯수가 K보다 갯수가 많은 것만 찾기
                       3) 선택된 알파벳들이 시작하는 index List(startIndex)구하기
                       4) 범위(0 ~ startIndex)-K+1) : K갯수를 더했을때 out of index가 되는 것까지만
                       5) i+K-1 : K개를 포함한 index, -1은 마지막 요소의 out of index를 방지하기 위함
                       6) Dictionary(windowList)에 아무 값이 없을 경우, -1 출력
                       7) min, max로 최소값 구하기
*
*  Time Complexity : O(n^2)
*  Space Complexity : O(n)
*  Runtime:  ms
*  Memory Usage:  MB
*/

for _ in 0..<Int(readLine()!)! {
    let W = String(readLine()!)
    let K = Int(readLine()!)!
    
    var dic = [Character:Int]()
    var windowList = [Int]()
    
    // 알파벳 갯수 세기
    for c in W {
        dic[c, default: 0] += 1
    }
    
    for (c, cnt) in dic {
        if K <= cnt {
            var startIndex = [Int]()
            
            // 해당 문자열의 index 추출
            for (i, alpha) in W.enumerated() {
                if c == alpha {
                    startIndex.append(i)
                }
            }
            
            for i in 0..<startIndex.count - K + 1 {
                windowList.append(startIndex[i+K-1] - startIndex[i])
            }
        }
    }
    
    if windowList.isEmpty {
        print(-1)
    } else {
        print("\(windowList.min()! + 1) \(windowList.max()! + 1)")
    }
}

