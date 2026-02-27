//: [Previous](@previous)

import Foundation

/*: Cree un programa capaz de obtener la media aritmética de una sucesión de números dentro de un array. */

let numbers = [10.0, 5.0, 8.0, 12.0, 15.0]

// Calculate the arithmetic mean
let sum = numbers.reduce(0.0, +)
let average = numbers.isEmpty ? 0.0 : sum / Double(numbers.count)

print("Array: \(numbers)")
print("Arithmetic mean: \(average)")

//: [Next](@next)
