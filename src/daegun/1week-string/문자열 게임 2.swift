import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    
    // readLine
    let w = Array(readLine()!)
    let k = Int(readLine()!)!
    
    if k == 0 || w.count <= 0{
        print("-1")
        continue
    } else if k == 1 {
        print("1 1")
        continue
    }
    
    var dict: [Character:[Int]] = [:]
    
    // Insert Character index data to dict
    for i in 0..<w.count {
        if dict[w[i]] == nil {
            dict[w[i]] = [i]
        } else {
            dict[w[i]]?.append(i)
        }
    }
    
    var min = w.count+1
    var max = -1
    
    for charInfo in dict {
        
        let list = charInfo.value
        if list.count < k { continue }
        
        for i in 0...list.count-k {
            let result = list[i+k-1] - list[i]
            if result > max { max = result }
            if result < min { min = result }
        }
    }
    
    if min == w.count+1 || max == -1 {
        print("-1")
    } else {
        print("\(min+1) \(max+1)")
    }
    
}

/*
 2
 superaquatornado
 2
 abcdefghijklmnopqrstuvwxyz
 5
 */
