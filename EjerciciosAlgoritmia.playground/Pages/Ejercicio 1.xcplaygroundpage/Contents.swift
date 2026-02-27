//: [Previous](@previous)

import Foundation

/*: Dado un array de números enteros, implementa una función que sume todos sus elementos utilizando la función reduce. */

func sumarElementos(_ numeros: [Int]) -> Int {
    numeros.reduce(0, +)
}

let numeros = [2, 4, 6, 8, 10]
print(sumarElementos(numeros))

//: [Next](@next)
