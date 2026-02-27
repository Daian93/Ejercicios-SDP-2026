//: [Previous](@previous)

import Foundation

/* Design an algorithm that calculates the factorial of a number entered by the user that is no greater than 20. Note: The factorial of a number n is n! = n × (n− 1) × (n− 2) ×… × 1*/

let num: Int = 6

var factorial = 1

if num > 1 {
    for i in 1...num {
        factorial *= i
    }
}

/* Another way
    var i = 1
    while i <= num {
        factorial *= i
        i += 1
    }
*/

print("Factorial of \(num) is \(factorial).")

//: [Next](@next)
