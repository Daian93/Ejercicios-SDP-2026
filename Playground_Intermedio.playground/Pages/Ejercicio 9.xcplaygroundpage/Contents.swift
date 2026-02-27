//: [Previous](@previous)

import Foundation

// Calculate the sum of the squares of the first N natural numbers.

let number: Int = 3
var sum: Int = 0

if number > 0 {
    for i in 1...number {
        sum += (i * i)
    }
} else {
    print("The number must be greater than 0.")
}

print("The sum of the squares of the first \(number) natural numbers is \(sum).")

// Another way using .reduce():
if number > 0 {
    let sum = (1...number).reduce(0) { $0 + $1 * $1 }
    print("The sum of the squares of the first \(number) natural numbers is \(sum).")
} else {
    print("The number must be greater than 0.")
}


//: [Next](@next)
