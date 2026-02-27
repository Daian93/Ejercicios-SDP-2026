//: [Previous](@previous)

import Foundation

/*: Implementa una función de búsqueda binaria recursiva que funcione sobre cualquier array ordenado.
 BinarySearch(A, L , R, x) =
 No encontrado, si L > R,
 [8pt ]Encontrado, si A (⌊L + R
 2 ⌋)= x,
 [8pt ]BinarySearch(A, L , ⌊L + R
 2 ⌋− 1,x), si A (⌊L + R
 2 ⌋)> x,
 [8pt ]BinarySearch(A, ⌊L + R
 2 ⌋+ 1,R, x), si A (⌊L + R
 2 ⌋)< x. */

func binarySearch<T: Comparable>(_ array: [T], left: Int, right: Int, value: T)
    -> Int?
{
    // Caso base: no encontrado
    if left > right {
        return nil
    }
    let midIndex = left + (right - left) / 2
    // Caso encontrado
    if array[midIndex] == value {
        return midIndex
    } else if array[midIndex] > value {
        // Buscamos en la mitad izquierda
        return binarySearch(
            array,
            left: left,
            right: midIndex - 1,
            value: value
        )
    }
    // Buscamos en la mitad derecha
    return binarySearch(array, left: midIndex + 1, right: right, value: value)
}

let numbersArray = [1, 2, 6, 7, 9, 11, 13, 16, 17, 19]
if let index = binarySearch(
    numbersArray,
    left: 0,
    right: numbersArray.count - 1,
    value: 13
) {
    print("Elemento encontrado en índice \(index)")
} else {
    print("Elemento no encontrado")
}

//: [Next](@next)
