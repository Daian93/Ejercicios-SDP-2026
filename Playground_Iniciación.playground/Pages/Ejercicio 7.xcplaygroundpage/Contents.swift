//: [Previous](@previous)

import Foundation

// Create an algorithm that prints the first 10 natural numbers.

var i: Int = 1

while i <= 10 {
    print(i)
    i += 1
}

// Another way
for i in 1...10 {
    print(i)
}

// Using stride()
let numbers = stride(from: 1, to: 11, by: 1)

//: [Next](@next)
