//: [Previous](@previous)

import Foundation

/*: Dado un String, identifica el substring más largo sin caracteres repetidos; explica el método utilizado. */

// Se utiliza una ventana deslizante con dos índices y un conjunto para mantener caracteres únicos, ajustando la ventana cuando aparece un carácter repetido.
func substringMasLargoSinRepetidos(_ texto: String) -> String {
    // Primero convertimos el String en un Array.
    let caracteres = Array(texto)
    // Usamos un Set para saber si un carácter ya está en la ventana.
    var vistos = Set<Character>()

    // 'inicio' marca el inicio de la ventana actual.
    var inicio = 0
    var maxLongitud = 0
    var inicioMax = 0

    // Fin avanza carácter a carácter.
    for fin in 0..<caracteres.count {
        let actual = caracteres[fin]

        // Si el carácter ya está en la ventana, movemos 'inicio' y eliminamos caracteres del set.
        while vistos.contains(actual) {
            vistos.remove(caracteres[inicio])
            inicio += 1
        }

        // Añadimos el carácter actual.
        vistos.insert(actual)

        // Actualizamos el máximo si es necesario. Cada vez que la ventana crece más que el máximo anterior, guardamos su longitud y su posición inicial.
        if fin - inicio + 1 > maxLongitud {
            maxLongitud = fin - inicio + 1
            inicioMax = inicio
        }
    }

    return String(caracteres[inicioMax..<inicioMax + maxLongitud])
}

let texto = "abcdefgabcdefabcdefgh"
let resultado = substringMasLargoSinRepetidos(texto)
print(resultado)

//: [Next](@next)
