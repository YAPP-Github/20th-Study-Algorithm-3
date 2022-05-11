import Foundation

// laptop 높이, laptop 너비, stickers 개수
let input = readLine()!.split(separator: " ").map { Int($0)! }

// Stricker grid
var sticker: [[[Int]]] = []
for n in 0..<input[2] {
    
    let grid = readLine()!.split(separator: " ").map { Int($0)! }
    sticker.append([])
    
    for _ in 0..<grid[0] {
        sticker[n].append(readLine()!.split(separator: " ").map { Int($0)! })
    }
}

// laptop grid
var laptop: [[Int]] = []
for y in 0..<input[0] {
    laptop.append([])
    for x in 0..<input[1] {
        laptop[y].append(0)
    }
}

// 스티커 그리드를 시계방향 & 90도로 회선
func rotate(_ grid: [[Int]]) -> [[Int]]{
    
    var rotated: [[Int]] = []
    
    for y in 0..<grid[0].count {
        rotated.append([])
        for x in (0..<grid.count).reversed() {
            rotated[y].append(grid[x][y])   // x -> y / y -> x.reversed
        }
    }
    
    return rotated
}

// 스티커가 들어갈 자리가 있는지 체크, 들어갈 자리가 있으면 true 반환
func check(_ grid: [[Int]]) -> Bool {
    
    // 스티커가 노트북보다 큰경우
    if laptop.count < grid.count || laptop[0].count < grid[0].count {
        return false
    }
    
    // 스티커 위치 이동
    for y in 0..<laptop.count-grid.count+1 {
        
        for x in 0..<laptop[0].count-grid[0].count+1 {
            
            var isMatch = true
            
            // 스티커 좌표 체크
            for gridY in 0..<grid.count {
                
                if !isMatch { break } // 이전 row에서 중복 발견시 break
                
                for gridX in 0..<grid[0].count {
                    
                    if laptop[gridY+y][gridX+x] == 1 && grid[gridY][gridX] == 1 {
                        isMatch = false
                        break
                    }
                }
            }
            
            // 스티커 모든 좌표체크 이후 중복 발견 안됨
            if isMatch {
                // 스티커가 들어갈 자리의 laptop 을 1로 갱신
                for gridY in 0..<grid.count {
                    for gridX in 0..<grid[0].count {
                        if  grid[gridY][gridX] == 1 {
                            laptop[gridY+y][gridX+x] = 1
                        }
                    }
                }

                return true
            }
        }
    }
    
    return false    // 중복이 발견안된 case 발견안됨
}


// 스티커 개수만큼 확인 진행
for n in 0..<input[2] {
    
    var current = sticker[n]
    
    // 회전시키면서 총 4 번 체크
    for _ in 0..<4 {
        
        if check(current) {
            break
        }
        
        current = rotate(current)
    }
    
}

// laptop grid에서 1의 수 count
var result = 0
for y in 0..<input[0] {
    for x in 0..<input[1] {
        if laptop[y][x] == 1 {
            result += 1
        }
    }
}
print(result)
