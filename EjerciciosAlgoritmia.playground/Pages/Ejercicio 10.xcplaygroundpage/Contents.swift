//: [Previous](@previous)

import Foundation

/*: Dado un array de String, filtra aquellos que sean palíndromos y ordénalos por longitud, haciendo uso de funciones de orden superior. */

func esPalindromo(_ palabra: String) -> Bool {
    let minuscula = palabra.lowercased()
    return minuscula.elementsEqual(minuscula.reversed())
}

func palindromosOrdenadosPorLongitud(_ palabras: [String]) -> [String] {
    return
        palabras
        .filter { esPalindromo($0) }
        .sorted { $0.count < $1.count }  // Ordenamos por longitud creciente
}

let palabras = [
    "Diana", "swift", "programar", "oso", "anilina", "reconocer", "hola",
    "level",
]
let resultado = palindromosOrdenadosPorLongitud(palabras)
print(resultado)

//: [Next](@next)
