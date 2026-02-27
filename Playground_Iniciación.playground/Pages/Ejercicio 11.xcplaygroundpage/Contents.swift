//: [Previous](@previous)

import Foundation

/* Create an algorithm that adds up all even numbers between 1 and N. Note: The number N will always be a number requested from the user. */

let num: Int = 10
var sum: Int = 0

for i in stride(from: 2, through: num, by: 2) {
    sum += i
}

print("The sum of all even numbers between 1 and \(num) is \(sum).")

//: [Next](@next)
