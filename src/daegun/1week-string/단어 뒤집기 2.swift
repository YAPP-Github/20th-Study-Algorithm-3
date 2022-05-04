import Foundation

let input = String(readLine()!)

var result = ""         // result
var word = ""           // current word
var isTag = false

for letter in input {

    if letter == "<" {
        isTag = true
        result = "\(result)\(String(word.reversed()))"
        word = ""
    }
    else if letter == ">" {
        isTag = false
        result = "\(result)<\(word)>"
        word = ""
    } else if letter == " "  {
        
        if isTag {
            word = "\(word)\(String(letter))"
        } else {
            result = "\(result)\(String(word.reversed())) "
            word = ""
        }
        
    } else {
        word = "\(word)\(String(letter))"
    }
}

result = "\(result)\(String(word.reversed()))"

print(result)
