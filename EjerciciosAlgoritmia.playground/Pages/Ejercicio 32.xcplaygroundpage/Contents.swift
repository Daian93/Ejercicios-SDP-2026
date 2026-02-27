//: [Previous](@previous)

import Foundation

/* Dado un array de String, encuentra el prefijo común más largo entre ellos, utilizando métodos funcionales. */

func prefijoComunMasLargo(_ strings: [String]) -> String {
    // Tomamos la primera palabra como referencia.
    guard let primero = strings.first else { return "" }

    return primero.enumerated().reduce("") { prefijo, elemento in
        let (indice, caracter) = elemento

        // Todas las palabras deben tener ese índice y el mismo carácter.
        let esComun = strings.allSatisfy {
            $0.count > indice
                && $0[$0.index($0.startIndex, offsetBy: indice)] == caracter
        }

        return esComun ? prefijo + String(caracter) : prefijo
    }
}

let palabras = ["Camino", "Camión", "Camila"]
print(prefijoComunMasLargo(palabras))  // "Cami"

//: [Next](@next)
