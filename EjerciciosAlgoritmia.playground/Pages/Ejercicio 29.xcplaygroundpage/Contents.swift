//: [Previous](@previous)

import Foundation

/* Dado un String, retorna otro String en el que se eliminan los caracteres duplicados y se conserva el orden original. */

func eliminarDuplicados(_ input: String) -> String {
    var result: String = ""
    var seen: Set<Character> = []

    for char in input {
        if !seen.contains(char) {
            seen.insert(char)
            result.append(char)
        }
    }

    return result
}

let resultado = eliminarDuplicados("manzana")
print(resultado)

// Otra forma más funcional de resolver este ejercicio (con un filter) sería:
func eliminarDuplicados2(_ texto: String) -> String {
    var vistos = Set<Character>()

    return String(
        texto.filter { caracter in
            if vistos.contains(caracter) {
                return false
            } else {
                vistos.insert(caracter)
                return true
            }
        }
    )
}

//: [Next](@next)
