//: [Previous](@previous)

import Foundation

/*: Dado un array de enteros, encuentra dos números cuya suma sea igual a un valor objetivo, utilizando un enfoque funcional.*/

// Se recorren funcionalmente todas las combinaciones posibles sin repetir mediante flatMap y se selecciona la primera pareja cuya suma coincide con el valor objetivo.
func twoSum(_ nums: [Int], target: Int) -> (Int, Int)? {
    return nums.enumerated()
        .flatMap { (i, a) in
            nums[(i + 1)...].compactMap { b in
                a + b == target ? (a, b) : nil
            }
        }
        .first
}

let numeros = [3, 6, 13, 20, 7, 10]
let objetivo = 10

if let resultado = twoSum(numeros, target: objetivo) {
    print("Números encontrados: \(resultado.0) y \(resultado.1)")
} else {
    print("No existe combinación")
}

//: [Next](@next)
