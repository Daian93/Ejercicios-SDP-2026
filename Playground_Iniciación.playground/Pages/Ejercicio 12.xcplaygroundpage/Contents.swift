//: [Previous](@previous)

import Foundation

// Create an algorithm that calculates the sum of all odd numbers between 1 and N.

let num: Int = 9
var sum: Int = 0

for i in stride(from: 1, through: num, by: 2) {
    sum += i
}

print("The sum of all odd numbers between 1 and \(num) is \(sum).")

//: [Next](@next)
