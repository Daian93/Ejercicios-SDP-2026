//: [Previous](@previous)

import Foundation

/*: Implementa el algoritmo de ordenamiento de burbuja para ordenar un array de números enteros.
 ALGORITMO: Recorre el array comparando elementos adyacentes. Si están en el orden incorrecto, intercámbialos. Repite este proceso hasta que no se realicen más intercambios en una pasada completa. */

var numbers = [64, 34, 25, 12, 22, 11, 90]

// Bubble sort
let n = numbers.count
var swapped: Bool

repeat {
    swapped = false
    for i in 0..<(n - 1) {
        if numbers[i] > numbers[i + 1] {
            numbers.swapAt(i, i + 1)
            swapped = true
        }
    }
} while swapped

print("Sorted array:")
print(numbers)

//: [Next](@next)
