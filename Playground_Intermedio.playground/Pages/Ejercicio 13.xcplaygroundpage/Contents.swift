//: [Previous](@previous)

import Foundation

/* Calculate the absolute value of a number.
 Note: The absolute value of a number is its numerical value without regard to its sign. For example, the absolute value of -5 and 5 is 5.
 */

// Default value for testing
let number = -5

var absoluteValue: Int

if number < 0 {
    absoluteValue = -number
} else {
    absoluteValue = number
}

print("The absolute value of \(number) is \(absoluteValue).")

// Another way using ternary operator
let number2 = -10

let absoluteValue2 = number2 < 0 ? -number2 : number2

print("The absolute value of \(number2) is \(absoluteValue2).")

// Using a Swift built-in function
let number3 = 25

let absoluteValue3 = abs(number3)

print("The absolute value of \(number3) is \(absoluteValue3).")

//: [Next](@next)
