import Foundation

let length = Int(readLine()!)!
var result: [Int] = []

func palindrome(str: [String.Element]) -> Int {
    for i in 0..<str.count/2 {
        
        if str[i] != str[str.count-1-i] {
            
            // Remove element at behind
            if str[i] == str[str.count-2-i] {
                var new = str
                new.remove(at: str.count-1-i)
                
                // Check palindrome again
                for j in 0..<new.count/2 {
                    if new[j] != new[new.count-1-j] {
                        break
                    } else if j == new.count/2-1 {
                        return 1
                    }
                }
            }
    
            // Remove element at front
            if str[i+1] == str[str.count-1-i] {
                var new = str
                new.remove(at: i)
                
                // Check palindrome again
                for j in 0..<new.count/2 {
                    if new[j] != new[new.count-1-j] {
                        return 2
                    } else if j == new.count/2-1 {
                        return 1
                    }
                }
            } else {
                return 2
            }
            
            
        }
    }
    return 0

}

for _ in 0..<length {
    let str = Array(readLine()!)
    result.append(palindrome(str: str))
}

result.forEach { print($0) }
