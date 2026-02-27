//: [Previous](@previous)

import Foundation

/* Calculate the square root of a number without using the predefined function.
 Note: You must use the calculation formula x₁ = 1/2(x₀ + a/x₀), where a is the number for which we want to calculate the square root. The formula is repeated until the difference between x₁ and x₀ is sufficiently small.
 */

let number: Double = 100
let maxIteration: Int = 8
var origen = number / 2
var squareRoot: Double = 0

if number > 0 {
    var origen: Double = number / 2
    for _ in 1...maxIteration {
        squareRoot = 1 / 2 * (origen + number / origen)
        origen = squareRoot
    }
    print("The square root of \(number) is \(squareRoot).")
} else {
    print("The number must be greater than 0.")
}


// Another way using abs and break:
repeat {
    squareRoot = 1 / 2 * (origen + number / origen)
    if abs(squareRoot - origen) < 0.00001 { break }
    origen = squareRoot
} while true

print("The square root of \(number) is \(squareRoot)")

//: [Next](@next)
