//: [Previous](@previous)

import Foundation

// Print an 8x8 chessboard using asterisks and spaces. White are asterisks and Black are spaces.

let size: Int = 8
var row: Int = 1

while row <= size {
    var column: Int = 1
    while column <= size {
        if (row + column) % 2 == 0 {
            print("⬜️", terminator: "") // "*"
        } else {
            print("⬛️", terminator: "") // " "
        }
        column += 1
    }
    row += 1
    print()
}

//: [Next](@next)
