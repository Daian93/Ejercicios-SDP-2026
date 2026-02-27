//: [Previous](@previous)

import Foundation

/*: Implementa una función que recorra un array de enteros y devuelva un diccionario donde cada clave sea un número y el valor la cantidad de apariciones consecutivas. */

func aparicionesConsecutivas(_ array: [Int]) -> [Int: Int] {
    guard !array.isEmpty else { return [:] }

    var resultado: [Int: Int] = [:]
    var contador = 1
    var actual = array[0]

    for i in 1..<array.count {
        if array[i] == actual {
            // Si el mismo número que el anterior entonces incrementamos contador.
            contador += 1
        } else {
            // Si el número es diferente, actualizamos el máximo en el diccionario.
            resultado[actual] = max(resultado[actual] ?? 0, contador)
            // Reiniciamos para el nuevo número.
            actual = array[i]
            contador = 1
        }
    }

    // Actualizamos el último grupo.
    resultado[actual] = max(resultado[actual] ?? 0, contador)

    return resultado
}

let array: [Int] = [1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 5]
let resultado = aparicionesConsecutivas(array)
print(resultado)

//: [Next](@next)
