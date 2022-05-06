import Foundation

func solution() {
    
    var points: [Int:(String, Int)] = [:]
    
    for i in 0..<Int(readLine()!)! {
        
        let circle = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for (idx, point) in [circle[0]-circle[1], circle[0]+circle[1]].enumerated() {
            
            if points[point] == nil {
                points[point] = ((idx == 0 ? "(" : ")"), i)
            } else {
                print("NO")
                return
            }
        }
    }

    let sortedPoints = points.sorted { $0.0 < $1.0 }.map { return $0.1 }
    
    var counter = 0
    var open: [Int] = []
    for point in sortedPoints {
        
        if point.0 == "(" {
            
            open.append(point.1)
            counter += 1
        } else if point.0 == ")" {
            
            if point.1 != open.last {
                print("NO")
                return
            }
            
            open.removeLast()
            counter -= 1
        }
        
        if counter < 0 {
            print("NO")
            return
        }
    }
    
    if counter == 0 {
        print("YES")
    } else {
        print("NO")
    }
    
}

solution()
