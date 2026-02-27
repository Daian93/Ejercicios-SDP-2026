//: [Previous](@previous)

import Foundation

/*: Crea una función recursiva que determine el máximo común divisor de dos números, empleando el algoritmo de Euclides.
 MCD(a , b) = {a , si b= 0,
 MCD(b, a mod b), si b ≠ 0. */

func mcd(_ a: Int, _ b: Int) -> Int {
    // Caso base
    if b == 0 {
        return a
    }
    // Llamada recursiva
    return mcd(b, a % b)
}

let resultado = mcd(10, 15)
print("El MCD es:", resultado)

//: [Next](@next)
