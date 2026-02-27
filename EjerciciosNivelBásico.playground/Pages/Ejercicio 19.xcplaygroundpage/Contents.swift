//: [Previous](@previous)

import Foundation

/*: Crea un algoritmo que rote los elementos de un array k posiciones a la derecha, de forma que los que estén al final pasarán al principio. */

var numbers = [1, 2, 3, 4, 5, 6, 7]

// Number of positions to rotate
let k = 3

// Normalize k in case it's larger than the array size
let rotations = k % numbers.count

// Perform rotation
let rotated = Array(
    numbers.suffix(rotations) + numbers.prefix(numbers.count - rotations)
)

print("Original array: \(numbers)")
print("Array rotated \(k) positions to the right:")
print(rotated)

//: [Next](@next)
