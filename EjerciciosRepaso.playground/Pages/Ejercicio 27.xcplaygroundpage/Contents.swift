//: [Previous](@previous)

import Foundation

/*: Implementa una función que, recibiendo una frase, retorne un diccionario donde las claves sean las palabras únicas y los valores sean arrays con los índices en que aparecen en la frase. Esto ayudará a comprender el mapeo de posiciones dentro del texto. */

func mapearPalabrasConIndices(_ frase: String) -> [String: [Int]] {
    // Normalizamos la frase: minúsculas y eliminamos puntuación
    let caracteresPermitidos = frase.lowercased().filter {
        $0.isLetter || $0.isWhitespace
    }

    // Dividimos en palabras
    let palabras = caracteresPermitidos.split(separator: " ")

    var resultado: [String: [Int]] = [:]

    // Recorremos cada palabra y su índice
    for (indice, palabra) in palabras.enumerated() {
        let palabraStr = String(palabra)
        resultado[palabraStr, default: []].append(indice)
    }

    return resultado
}

let frase = "Hola, me llamo Diana. Hola, soy estudiante de ingeniería."
let indicesPalabras = mapearPalabrasConIndices(frase)

print(indicesPalabras)

//: [Next](@next)
