import Foundation

let pre = Array(readLine()!)
var post:[Character] = []

var operation: [Character] = []
let priority: [Character:Int] = [
    "(": -1,
    "*": 1,
    "/": 1,
    "+": 0,
    "-": 0
]

for command in pre {

    if (Character("A").asciiValue!...Character("Z").asciiValue!).contains(command.asciiValue!) || (Character("a").asciiValue!...Character("z").asciiValue!).contains(command.asciiValue!)  {
        post.append(command)
    } else {
        // Brace Open
        if command == "(" {
            operation.append("(")
            
        // Brace Close
        } else if command == ")" {
            
            while operation.last != "(" {
                post.append(operation.last!)
                operation.removeLast()
            }
            operation.removeLast()
            
        } else {
            
            while operation.count > 0 && (priority[operation.last!]! >= priority[command]!) {
                post.append(operation.last!)
                operation.removeLast()
            }
            operation.append(command)
        }
    }
    
}

while operation.count > 0 {
    post.append(operation.last!)
    operation.removeLast()
}

print(post.map { String($0) }.joined(separator: ""))

