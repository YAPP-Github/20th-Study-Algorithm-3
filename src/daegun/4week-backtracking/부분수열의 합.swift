import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let S = input[1]

var arr = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

func solution(visited: [Int], index: Int){
    
    // 수열의 길이가 M -> 출력
    if index <= arr.count {
        
        // Sum == S 인지 체크
        var sum = 0
        visited.forEach { sum += arr[$0] }
        if sum == S && !visited.isEmpty{
            result += 1
        }
        
        for n in index..<arr.count {
            
            // 중복 없을 경우
            if !visited.contains(n) {
                // index로 n을 넘겨준다 -> 중복 방지
                solution(visited: visited + [n], index: n)
            }
            
        }
        
    }
    
}

solution(visited: [], index: 0)
print(result)
