//: [Previous](@previous)

import Foundation

/*: Realice un programa capaz de sumar las distintas cifras del factorial de un número indicado:
 EJEMPLO: 5! = 5 * 4 * 3 * 2 * 1 = 120 -> 1 + 2 + 0 = 3 */

let number = 5

// Calculate factorial
var factorial = 1

if number > 0 {
    for i in 1...number {
        factorial *= i
    }
}

// Calculate sum of digits
var temp = factorial
var digitSum = 0

while temp > 0 {
    digitSum += temp % 10
    temp /= 10
}

print("Number: \(number)")
print("Factorial: \(factorial)")
print("Sum of digits of factorial: \(digitSum)")

//: [Next](@next)
