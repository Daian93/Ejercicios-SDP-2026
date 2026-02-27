//: [Previous](@previous)

import Foundation

/*: Implementa una función que, dada una cadena de texto, retorne un diccionario donde cada clave sea una palabra (normalizada en minúsculas y sin puntuación) y el valor sea el número de ocurrencias de esa palabra en el texto. */

func contarPalabras(en texto: String) -> [String: Int] {
    // Pasar cada palabra a minúsculas:
    let textoNormalizado = texto.lowercased()

    // Eliminar la puntuación:
    let textoSinPuntuacion =
        textoNormalizado
        .components(separatedBy: CharacterSet.punctuationCharacters)
        .joined()

    // Separar por espacios:
    let palabras = textoSinPuntuacion.split(separator: " ")

    // Contar ocurrencias:
    var contador: [String: Int] = [:]

    for palabra in palabras {
        let palabraString = String(palabra)
        contador[palabraString, default: 0] += 1
    }

    return contador
}

let texto = "Hola, me llamo Diana. Hola, soy estudiante de ingeniería."
let resultado = contarPalabras(en: texto)
print(resultado)

// Otra forma de comprobar que el resultado es correcto (comparación con otro diccionario):
let esperado: [String: Int] = [
    "hola": 2,
    "me": 1,
    "llamo": 1,
    "diana": 1,
    "soy": 1,
    "estudiante": 1,
    "de": 1,
    "ingeniería": 1,
]

print(resultado == esperado)  // true

//: [Next](@next)
