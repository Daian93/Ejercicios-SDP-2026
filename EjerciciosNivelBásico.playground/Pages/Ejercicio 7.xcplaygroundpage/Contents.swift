//: [Previous](@previous)

import Foundation

/*: Realice un programa que sea capaz de sumar todos los números que hay en un array de números enteros. */

let numbers = [4, 7, 12, 3, 9, 1]

var totalSum = 0

for number in numbers {
    totalSum += number
}

print("Array: \(numbers)")
print("Total sum: \(totalSum)")

/* Another way:
let numbers = [4, 7, 12, 3, 9, 1]

// Using reduce
let totalSum = numbers.reduce(0) { partialResult, number in
     partialResult + number
}

print("Array: \(numbers)")
print("Total sum using reduce: \(totalSum)")/
*/

//: [Next](@next)
