//: [Previous](@previous)

import Foundation

/* Create an algorithm that finds the greatest common divisor of two numbers. Note: The greatest common divisor (GCD) is the largest number that divides both numbers with a division remainder equal to 0 (no remainder). */

var a: Int = 48
var b: Int = 18
var aux: Int = 0

while b != 0 {
    aux = b
    b = a % b
    a = aux
}

print("The GCD is \(a)")

//: [Next](@next)
