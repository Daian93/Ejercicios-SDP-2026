//: [Previous](@previous)

import Foundation

/*: Dado un array ordenado y un número objetivo, determina el índice en el que el número debería insertarse para conservar el orden (inserción binaria). */

func indiceDeInsercion(_ array: [Int], objetivo: Int) -> Int {
    var izquierda = 0
    var derecha = array.count - 1

    while izquierda <= derecha {
        let medio = (izquierda + derecha) / 2

        if array[medio] == objetivo {
            // El número ya está, devolvemos su índice.
            return medio
        } else if array[medio] < objetivo {
            izquierda = medio + 1
        } else {
            derecha = medio - 1
        }
    }

    // Cuando izquierda > derecha, izquierda indica la posición de inserción correcta.
    return izquierda
}

let arr = [2, 4, 6, 7]

print(indiceDeInsercion(arr, objetivo: 6))  // 2 (ya existe)
print(indiceDeInsercion(arr, objetivo: 3))  // 1 (debería ir entre 1 y 3)
print(indiceDeInsercion(arr, objetivo: 8))  // 4 (al final)
print(indiceDeInsercion(arr, objetivo: 1))  // 0 (al inicio)

//: [Next](@next)
