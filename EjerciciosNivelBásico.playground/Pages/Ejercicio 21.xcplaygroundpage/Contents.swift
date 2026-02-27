//: [Previous](@previous)

import Foundation

/*: Crea un programa que implemente el algoritmo de búsqueda binaria en un array ordenado.
 ALGORITMO: La búsqueda binaria compara el elemento central del array con el valor buscado. Si son iguales, termina la búsqueda. Si el valor buscado es menor, continúa la búsqueda en la mitad izquierda; si es mayor, en la mitad derecha. */

let sortedArray = [2, 5, 8, 12, 16, 23, 38, 45, 56, 72, 91]
let target = 23

// Binary search function
func binarySearch(_ array: [Int], _ target: Int) -> Int? {
    var left = 0
    var right = array.count - 1

    while left <= right {
        let mid = (left + right) / 2
        if array[mid] == target {
            return mid
        } else if target < array[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return nil  // target not found
}

if let index = binarySearch(sortedArray, target) {
    print("Array: \(sortedArray)")
    print("Target: \(target)")
    print("Found at index: \(index)")
} else {
    print("Target \(target) not found in array.")
}

//: [Next](@next)
