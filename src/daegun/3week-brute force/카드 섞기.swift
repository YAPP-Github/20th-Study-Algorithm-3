import Foundation

/*
 Test case 성공
 런타임 에러
 */

// (2, K) 를 수행하고 결과를 반환하는 합수
func shuffle(_ card: [Int], _ k: Int) -> [Int] {
    
    var shuffled: [Int] = card                  // 뒤집힐 수 있는 카드 더미
    var completed:[Int] = []                    // 더이상 뒤집히지 않는 카드 더미
    var select = Int(pow(Double(2), Double(k))) // 뒤집을 카드 더미 수: 회차가 늘어날 수록 1/2이 된다

    while select >= 1 && shuffled.count > 0 {
        
        completed = Array(shuffled[0...shuffled.count-select-1]) + completed      // 뒤집히지 않은 카드 따로 저장
        shuffled = Array(shuffled[shuffled.count-select...shuffled.count-1])      // 뒤집힌 카드 저장후 처리
        
        select /= 2     // 뒤집을 개수 갱신
    }

    return shuffled + completed
}

func solution() {
    let N = Int(readLine()!)!           // 카드의 개수

    var card: [Int] = []                // 카드 목록 (앞순서일수록 위에 있도록)
    (1...N).forEach { card.append($0) } // 카드 목록 초기화

    let match = readLine()!.split(separator: " ").map { Int($0)! }  // 섞기 후 카드 더미
    
    // K의 최댓값 계산
    var limit = 0
    while Int(pow(Double(2), Double(limit))) <= N {
        limit += 1
    }
    limit -= 1

    // Brute Force로 결과에 부합하는 결과 확인
    for k1 in 1...limit {
        for k2 in 1...limit {
            
            if shuffle(shuffle(card, k1), k2) == match {
                print("\(k1) \(k2)")
                return
            }
        }
    }

}

solution()
