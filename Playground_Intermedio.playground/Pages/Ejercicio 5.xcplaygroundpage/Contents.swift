//: [Previous](@previous)

import Foundation

/* Draw a diamond made of asterisks. The height (number of rows) will be an odd number chosen by the user.*/

let height = 7
let middle = (height + 1) / 2

// Top half (including middle line)
for i in 1...middle {
    let spaces = String(repeating: " ", count: middle - i)
    let asterisks = String(repeating: "❋", count: 2 * i - 1)
    print(spaces + asterisks)
}

// Bottom half (excluding middle line)
if middle > 1 {
    for i in stride(from: middle - 1, through: 1, by: -1) {
        let spaces = String(repeating: " ", count: middle - i)
        let asterisks = String(repeating: "❋", count: 2 * i - 1)
        print(spaces + asterisks)
    }
}

var spaces: Int = 0
var asterisks: Int = 0

// Another way (1):
for i in 1...height {
    if i <= middle {
        // Parte superior
        spaces = middle - i
        asterisks = 2 * i - 1
    } else {
        // Parte inferior
        spaces = i - middle
        asterisks = 2 * (height - i) + 1
    }

    print(
        String(repeating: " ", count: spaces)
            + String(repeating: "❋", count: asterisks)
    )
}

// Another way (2):
var i: Int = 1

if !(height > 1 && height % 2 == 1) {
    print("Please enter an odd value equal or greater than 3.")
} else {
    let middle = (height + 1) / 2
    var i = 1

    while i <= middle {
        var j = 1
        while j <= middle - i {
            print(" ", terminator: "")
            j += 1
        }

        var k = 1
        while k <= 2 * i - 1 {
            print("❋", terminator: "")
            k += 1
        }

        print()
        i += 1
    }

    i = middle - 1
    while i >= 1 {
        var j = 1
        while j <= middle - i {
            print(" ", terminator: "")
            j += 1
        }

        var k = 1
        while k <= 2 * i - 1 {
            print("❋", terminator: "")
            k += 1
        }

        print()
        i -= 1
    }
}

//: [Next](@next)
