//: [Previous](@previous)

import Foundation

// Calculate the result of raising a number x to a power y.

// Default values for testing
let x = 0.0
let y = -2

var result = 1.0

if x == 0 {
    if y > 0 {
        result = 0
        print("Result: \(result)")
    } else if y == 0 {
        print("Undefined (0^0 is indeterminate).")
    } else {
        print("Error: division by zero.")
    }
} else {
    if y > 0 {
        for _ in 1...Int(y) {
            result *= x
        }
    } else if y < 0 {
        for _ in 1...Int(-y) {
            result *= x
        }
        result = 1 / result
    } else {
        result = 1
    }
    
    print("Result: \(result)")
}

print("\(x) raised to the power of \(y) is \(result).")

// Another way using pow()
let x2 = 2.0
let y2 = 3.0

let result2 = pow(x2, y2)

print("\(x2) raised to the power of \(y2) is \(result2).")

//: [Next](@next)
