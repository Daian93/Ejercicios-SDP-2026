//: [Previous](@previous)

import Foundation

/* Determine whether a number is a perfect square.
 Note: A perfect square is an integer that is the square of another integer. For example, 36 is a perfect square because 6 × 6 = 36.
*/

let number = 49
var isPerfectSquare = false
var i = 0

while i * i <= number {
    if i * i == number {
        isPerfectSquare = true
        break
    }
    i += 1
}

if isPerfectSquare {
    print("\(number) is a perfect square.")
} else {
    print("\(number) is not a perfect square.")
}

// A cleaner way
let number2 = 49
var isPerfectSquare2 = false

for i in 0...number2 {
    if i * i == number2 {
        isPerfectSquare2 = true
        break
    } else if i * i > number2 {
        break
    }
}

// Another way using squareRoot()
let number3 = 26

if number3 >= 0 {
    let root = Int(Double(number3).squareRoot())

    if root * root == number3 {
        print("\(number3) is a perfect square.")
    } else {
        print("\(number3) is not a perfect square.")
    }
} else {
    print("\(number3) is not a perfect square.")
}

//: [Next](@next)
