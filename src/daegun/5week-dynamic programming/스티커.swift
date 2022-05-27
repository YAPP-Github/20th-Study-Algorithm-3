import Foundation

/*
 틀렸습니다
 */


let T = Int(readLine()!)!

// 3칸씩 체크
// A: [0][0] + [1][1] + [2][0]     B: [0][1] + [1][0] + [2][1]     C: [0][0] + [2][1]     D: [0][1] + [2][0]
// 4개 케이스중 최댓값을 가지는 경우 채택 -> 합을 result에 더해준다
func solution(arr: [[Int]], n: Int) -> Int{
    
    var sticker = arr
    var isOver = false
    
    var result = 0
    var i = 0
    
    while true {

        // 각 케이스 비교, 최댓값 산출
        var A = sticker[0][i] + sticker[1][i + 1] + sticker[0][i + 2]
        var B = sticker[1][i] + sticker[0][i + 1] + sticker[1][i + 2]
        var C = sticker[0][i] + sticker[1][i + 2]
        var D = sticker[1][i] + sticker[0][i + 2]
        
        let sum = max(A, B, C, D)
        result += sum
        
        // 선택 스티커 제거, 뜯긴 주변 스티커 제거
        // 공통적으로 뜯기는 위치 6칸
        sticker[0][i] = 0
        sticker[1][i + 1] = 0
        sticker[0][i + 2] = 0
        sticker[1][i] = 0
        sticker[0][i + 1] = 0
        sticker[1][i + 2] = 0
        
        
        // 상황에 따라 다르게 뜯기는 위치 1칸 - 마지막 시행일때는 [i+3]이 존재하지 않는다
        if i + 3 < n {
            
            // 중복인 경우 -> 뜯길 스티커 점수가 높은걸 선택
            if sum == A && A == C {
                
                if sticker[0][i+3] > sticker[1][i+3] {
                    A = -1
                } else {
                    C = -1
                }
                
            } else if sum == B && B == D {
                
                if sticker[0][i+3] < sticker[1][i+3] {
                    B = -1
                } else {
                    D = -1
                }
            }
            
            
            if sum == A || sum == D {
                sticker[0][i+3] = 0
            } else if sum == B || sum == C {
                sticker[1][i+3] = 0
            }
        }
                    
        print("result: \(result) i: \(i)")
        print(sticker)
        
        if isOver {
            break
        }
        
        // Overflow 방지
        i += 3
        if i + 3 >= n {
            i = n - 3
            isOver = true
        }
        
    }

    return result
}

for _ in 0..<T {
    
    let n = Int(readLine()!)!
    
    // 2차원 배열의 row수는 2로 고정,
    var sticker: [[Int]] = []
    sticker.append(readLine()!.split(separator: " ").map{ Int($0)! })
    sticker.append(readLine()!.split(separator: " ").map{ Int($0)! })
        
    if n >= 3 {
        
        // 뒤에서부터 체크하는 경우를 위한 뒤집힌 배열
        var reversed: [[Int]] = []
        reversed.append(sticker[0].reversed())
        reversed.append(sticker[1].reversed())
        
        print(max(solution(arr: sticker, n: n), solution(arr: reversed, n: n)))
        
    } else if n == 2 {
        print(max(sticker[0][0] + sticker[1][1], sticker[0][1] + sticker[1][0]))
        
    } else if n == 1{
        print(max(sticker[0][0], sticker[1][0]))
    }
    
}

