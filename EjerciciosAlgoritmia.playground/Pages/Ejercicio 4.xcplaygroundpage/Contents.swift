//: [Previous](@previous)

import Foundation

/* Dado un String, cuenta la frecuencia de cada carácter utilizando funciones de orden superior y presenta el resultado en un diccionario. */

func frecuenciaCaracteres(_ texto: String) -> [Character: Int] {
    texto.reduce(into: [:]) { diccionario, caracter in
        diccionario[caracter, default: 0] += 1
    }
}

let texto = "Swift is awesome!"
let resultado = frecuenciaCaracteres(texto)

print(resultado)

//: [Next](@next)
