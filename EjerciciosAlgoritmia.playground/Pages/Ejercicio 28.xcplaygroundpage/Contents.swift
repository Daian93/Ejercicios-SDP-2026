//: [Previous](@previous)

import Foundation

/*: Crea una función que rote un array k posiciones a la izquierda en un estilo funcional. */

// La rotación se logra dividiendo el array en dos subarrays mediante dropFirst y prefix, que luego se concatenan.
func rotarIzquierda<T>(_ array: [T], k: Int) -> [T] {
    guard !array.isEmpty else { return [] }

    // Normalizamos k
    let rotaciones = k % array.count

    return Array(array.dropFirst(rotaciones)) + Array(array.prefix(rotaciones))
}

let array: [Int] = [1, 2, 3, 4, 5]
let result = rotarIzquierda(array, k: 2)
print(result)

// Otra forma de hacerlo sería:
func rotateLeft<T>(_ array: [T], by k: Int) -> [T] {
    return Array(array[k...] + array[..<k])
}

//: [Next](@next)
