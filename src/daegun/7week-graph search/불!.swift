import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = input[0]
let C = input[1]

// 지훈이 움직인 좌표 Queue
var J: [(Int, Int)] = []
var JFront = 0

// 불이 나는 곳 좌표 Queue
var F: [(Int, Int)] = []
var FFront = 0

// 미로 데이터 입력
var maze: [[String]] = []
for r in 0..<R {
    maze.append([])
    
    for (idx, element) in readLine()!.enumerated() {
        maze[r].append(String(element))

        if element == "J" {
            J.append((idx, r))
        } else if element == "F" {
            F.append((idx, r))
        }
    }
            
}

func solution() {
    
    let direction = [(1,0), (-1,0), (0,-1), (0,1)]  // 상하좌우 좌표 offset
    var time = 0


    // J 큐가 비었다면 loop 종료
    while J.count > JFront {
        
        time += 1
        
        // 불의 번짐
        // F 큐가 비었다 == 불이 더이상 번지지 않는다 -> BFS 안함
        if FFront < F.count {
            for _ in FFront..<F.count {
                
                let current = F[FFront]
                FFront += 1
                
                // 상하좌우 체크
                for direction in direction {
                    
                    let x = current.0 + direction.0
                    let y = current.1 + direction.1
                    
                    // 새로운 위치가 미로를 벗어나지 않는다면
                    if (0..<C).contains(x) && (0..<R).contains(y) {
                        if maze[y][x] == "." {
                            maze[y][x] = "F"
                            F.append((x, y))
                        }
                    }
                    
                }
            }
        }
        
        
        // 지훈 이동
        for _ in JFront..<J.count {
            
            let current = J[JFront]
            JFront += 1
            
            // 상하좌우 체크
            for direction in direction {
                
                let x = current.0 + direction.0
                let y = current.1 + direction.1
                
                // 새로운 위치가 미로를 벗어나지 않는다면
                if (0..<C).contains(x) && (0..<R).contains(y) {
                    if maze[y][x] == "." {
                        maze[y][x] = "J"
                        J.append((x, y))
                    }
                    
                // 미로를 탈출한 경우
                } else {
                    print(time)
                    return
                }
            }
        }
    }
    
    // 미로를 탈출하지 못함
    print("IMPOSSIBLE")
}

solution()
