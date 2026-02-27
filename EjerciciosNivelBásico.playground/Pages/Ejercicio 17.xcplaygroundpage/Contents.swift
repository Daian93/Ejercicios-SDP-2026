//: [Previous](@previous)

import Foundation

/*: Implementa un algoritmo para encontrar el segundo número más grande en un array. */

let numbers = [10, 4, 35, 7, 99, 23, 99, 50]

// Remove duplicates to handle repeated maximum
let uniqueNumbers = Array(Set(numbers))

// Sort descending
let sortedNumbers = uniqueNumbers.sorted(by: >)

// Get second largest
if sortedNumbers.count >= 2 {
    let secondLargest = sortedNumbers[1]
    print("Array: \(numbers)")
    print("Second largest number: \(secondLargest)")
} else {
    print("Array does not have a second largest number.")
}

//: [Next](@next)
